import { LightningElement,track,wire } from 'lwc';
    import getRecord from '@salesforce/apex/CustomRecordEditController.getRecord';
    import updateCases from '@salesforce/apex/updatingCaseRecords.updateCases';
    export default class InLineEditingcomponent extends LightningElement {

    @track oppos = [];
    @track newOppoList = [];

    connectedCallback() {
        debugger;
        setTimeout(() =>{  
            getRecord().then((result) => {
                this.oppos = result;
                let index = 0;
                let tempList = [];
                    for(var i=0;i<result.length;i++){
                        index +=1;
                        let temoObj = {
                            Id : result[i].Id,
                            Name : result[i].Name,
                            Amount : result[i].Amount,
                            Email__c: result[i].Email__c,
                            sno : index

                        };
                        tempList.push(temoObj);
                    }
                    this.newOppoList = tempList;
            }).catch((err) => {
                console.error('Error retrieving contacts:', error);
            });
        },100);
    }
        handleInputChange(event) {
        debugger;
        const index = event.target.dataset.index;
        const field = event.target.dataset.field;
        const value = event.target.value;

        // Ensure the newOppoList array exists and has the correct length
        if (this.newOppoList.length >= index) {
            this.newOppoList[index][field] = value;
        }
    }
    handleSave(){
        debugger;
        const Updateopprec = [];             // initializes an empty array
        this.newOppoList.forEach(opporec => {
            if (opporec.Id) {
                // Existing record: Add to the update list
                Updateopprec.push({
                        Id : opporec.Id,
                            Name : opporec.Name,
                            Amount : opporec.Amount,
                            Email__c : opporec.Email__c
                            
                });
            }else{
                console.log('No Case Record Found....');
            }
        })
        // Update existing records
        if (Updateopprec.length > 0) { 
            updateCases({ Updateopprec })
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




    }