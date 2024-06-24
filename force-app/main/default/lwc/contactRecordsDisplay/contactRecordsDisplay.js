import { LightningElement,track } from 'lwc';
import getContactDetails from '@salesforce/apex/contactAccordianApex.getContactDetails';
export default class ContactRecordsDisplay extends LightningElement {

@track data= [];

    connectedCallback() {
        debugger;
        setTimeout(()=>{
            this.callApexMethod()
        },300);
    }
callApexMethod() {
    getContactDetails()
        .then((result) => {
            console.log('Contact Records:', result); // Log the result to the console
            this.data = result;
        })
        .catch((error) => {
            console.error('Error fetching contact details', error);
        });
}
   
}