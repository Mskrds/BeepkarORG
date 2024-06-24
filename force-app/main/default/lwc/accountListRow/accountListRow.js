// parent Component- accountListRow.js 

import { LightningElement,track, api } from 'lwc';
import getAccdata from '@salesforce/apex/AccountObjcontroller.getAccdata';


export default class AccountListRow extends LightningElement {

   
    @track newaccList =[];
    @track statusval=[];
    @api accountId;
    @track showChild = false;
    @track showAll = true;


    connectedCallback() {
        debugger;
        setTimeout(()=>{
            this.callApexMethod()
        },300);
    }

 callApexMethod() {
    getAccdata()
        .then((result) => {
               
                let index = 0;        //used to keep track of a counter,
                let tempList = [];
                 for(var i=0;i<result.length;i++){
                     index +=1;
                     let temoObj = {           //creates a temporary object
                         sno : index,       
                         Id : result[i].Id,
                         Name : result[i].Name,
                         Email__c : result[i].Email__c,
                         Rating : result[i].Rating,
                         Ownership : result[i].Ownership,
                         Type : result[i].Type,
                          
                        };
                    tempList.push(temoObj);   //adding into array
                 }
                this.newaccList = tempList; //
            }).catch((err) => {
                console.error('Error retrieving contacts:', err);
            });
    }

    handleRowClick(event) {
        debugger;
        const recordId = event.currentTarget.dataset.id;
        this.accountId = recordId;
         this.showAll = false;
         this.showChild = true;
    }
   
        
    
    }