import { LightningElement, track} from 'lwc';
import createContact from '@salesforce/apex/ContactCreationControllerAB.createContact';

export default class ContactCreationForm extends LightningElement {
   
    @track LastName = '';
    @track Email = '';
    @track AccountId = '0015g00001YIio5AAD'; 

   // seperately mentioned the handlerevents 
    handleLastNameChange(event) {
        this.LastName = event.target.value;
    }

    handleEmailChange(event) {
        this.Email = event.target.value;
    }

    Insertcon() {
        debugger;
        createContact({ 
            
            LastName: this.LastName,
            Email: this.Email,
            AccountId: this.AccountId
        })
        .then(response => {
            debugger;
            console.log('Contact created successfully:', response);
           
        })
        .catch(error => {
            console.error('Error creating contact:', error);
           
        });
    }
}