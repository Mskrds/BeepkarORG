import { LightningElement,track,api } from 'lwc';
import getCasesrecords from '@salesforce/apex/updatingCaseRecords.getCasesrecords';
import updateCases from '@salesforce/apex/updatingCaseRecords.updateCases';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class UpdatingCaseRecords extends LightningElement {

    @track cases =[];
    @track newCaseList=[];

    connectedCallback() {
        debugger;
        setTimeout(() =>{  
           this.callApexclass(); 
        },100);
    }
callApexclass(){
    getCasesrecords().then((result) => {
                this.cases = result;
                let index = 0;
                let tempList = [];
                 for(var i=0;i<result.length;i++){
                     index +=1;
                     let temoObj = {
                         Id : result[i].Id,
                         Subject : result[i].Subject,
                         Description : result[i].Description,
                         Status : result[i].Status,
                         sno : index

                     };
                     tempList.push(temoObj);
                 }
                 this.newCaseList = tempList;
            }).catch((err) => {
                console.error('Error retrieving contacts:', err);
            });
}

    handleInputChange(event) {
        debugger;
        const index = event.target.dataset.index;
        const field = event.target.dataset.field;
        const value = event.target.value;


        if (this.newCaseList.length >= index) {
            this.newCaseList[index][field] = value;
        }
    }

    handleSave(){
        debugger;
        const casesToUpdate = [];
        this.newCaseList.forEach(case1 => {
            if (case1.Id) {
              
                casesToUpdate.push({
                    Id: case1.Id,
                    Subject : case1.Subject,
                    Description : case1.Description,
                    Status : case1.Status
                });
            }else{
                console.log('No Case Record Found....');
            }
        })
        // Update existing records
        if (casesToUpdate.length > 0) {
            updateCases({ casesToUpdate })
            .then(result => {
                console.log('Update Result:', result);
                this.handleSaveSuccess('Saved');

            })
            .catch(error => {
                console.error('Update Error:', error);
            });
        }
    }

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