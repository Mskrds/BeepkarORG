import { LightningElement, wire,api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { refreshApex } from '@salesforce/apex';
import getcontactstodelete from '@salesforce/apex/ContactDetailsController.getcontactstodelete';
export default class ContactobjDeleteAssign extends LightningElement {


    @api currentRecordId;
    @api error;
    @wire(getcontactstodelete) contacts;


    handleChange(event){    //     My Handlechangeevent on the radio button, update the currentRecordId on selection
        debugger;
        this.currentRecordId=event.target.value;     // selected Record Id Will get
        console.log('current RecordId'+this.currentRecordId);
    }

    handleDelete(){
        debugger;
        deleteRecord(this.currentRecordId)  //Calling  the deleteRecord method from the UI API to delete the record based on the currentRecord Id
        .then(() => {
            return refreshApex(this.contacts);
        })
        .then(()=>{
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted Successfully',
                    varient: 'Success'
                })
            );
        } )

        .catch((error) => {
           this.error=error;
           console.log('unable to delete the record due to'+JSON.stringify(this.error));
        });
    }

}