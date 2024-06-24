// updateCaseLWC.js
import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import updateCase from '@salesforce/apex/updatingCaseRecords.updateCase';

export default class UpdateCase extends LightningElement {
    @api recordId; 
    @track description = '';

    updateCase() {
        updateCase({ caseId: this.recordId, newDescription: this.description })
            .then(() => {
               
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Case updated successfully',
                        variant: 'success',
                    })
                );
            })
            .catch((error) => {
                
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error',
                    })
                );
            });
    }
}