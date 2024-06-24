// Child component- accountDetails.js

import { LightningElement,api,track } from 'lwc';
import { refreshApex } from '@salesforce/apex';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getContactsByAccountId from '@salesforce/apex/ContactDetailsController.getContactsByAccountId';
import getAccountdata from '@salesforce/apex/AccountObjcontroller.getAccountdata';
import updateCondata from '@salesforce/apex/ContactDetailsController.updateCondata';

export default class AccountDetails extends LightningElement {

 @track showContactRecords = false; 
 @track showAccountRecords = false;
 @api accountId;
 @track accounts;

    refreshData() {
        return refreshApex(this.wiredContacts);
    }
   
   
    accdetailshandleclick() {
         debugger
        getAccountdata()
            .then(result => {
                this.accounts = result;
                this.showAccountRecords = true;
                this.showContactRecords = false;
            })
            .catch(error => {
                console.error('Error fetching account data:', error);
            });
    }

    

 // implemented the pagination on contact records 

    @track contactRecords = [];
    @track ListofContacts = [];
    @track recordList = [];
    @track pageList = [];
    @track currentPage = 1;
    @track recordPerPage = 4;
    @track totalPages = 1;
    @track startIndex = 0;
    @track endIndex = 0;

    //Handle Click
    contactshandleClick() {
        debugger;
        getContactsByAccountId({ accountId: this.accountId })
                .then((result) => {
                     this.contactRecords = result;
                     this.showContactRecords = true;
                     this.showAccountRecords = false;

                    let index = 0;
                    let tempList = [];
                    for (let i = 0; i < result.length; i++) {
                        index += 1;
                        let tempObj = {
                            Name: result[i].Name,
                            Phone: result[i].Phone,
                            Email: result[i].Email,
                            Department: result[i].Department,
                            CleanStatus: result[i].CleanStatus,
                            sno: index,
                        };

                        tempList.push(tempObj);
                    }
                    this.ListofContacts = tempList;
                    this.recordList = tempList;
                    this.totalPages = Math.ceil(this.recordList.length / this.recordPerPage);
                    this.updatePageList();
                })
                .catch((err) => {
                    console.error('Error retrieving contacts:', err);
        });
       
    }

    handlePrevious() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
            this.updatePageList();
        }
    }

    handleNext() {
        debugger;
        if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
            this.updatePageList();
        }
    }

    updatePageList() {
       debugger;
        this.startIndex = (this.currentPage - 1) * this.recordPerPage + 1;
        this.endIndex = Math.min(this.startIndex + this.recordPerPage - 1, this.recordList.length);
        this.pageList = this.recordList.slice(this.startIndex - 1, this.endIndex);
    }  

@track newCaseList = [];

//  handleSave() {
//          debugger
//         updateCondata()
//             .then(result => {
//                 this.newCaseList = result;
//                 this.handleSaveSuccess('Saved');
//             })
//             .catch(error => {
//                 console.error('Error fetching account data:', error);
//             });
//     }

 

handleSaveSuccess(action) {
        debugger;
        console.log(action);
        this.showNotification('Success', 'success');
        this.dispatchEvent(evt);
    }

     showNotification(title,message,variant){
        const evt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant
        });
        this.dispatchEvent(evt);
    }


}