import { LightningElement,api,track } from 'lwc';
import createContact from '@salesforce/apex/mycreateContactForm.createContact';
export default class CreateContactForm extends LightningElement {
    @api recordId;
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';
    @track department = '';

    handleInputChange(event) {
        const { name, value } = event.target;
        this[name] = value;
    }

    handleClick() {
        console.log('Record Id:', this.recordId);
        console.log('First Name:', this.firstName);
        console.log('Last Name:', this.lastName);
        console.log('Email:', this.email);
        console.log('Phone:', this.phone);
        console.log('Department:', this.department);

        createContact({
            firstName: this.firstName,
            lastName: this.lastName,
            email: this.email,
            phone: this.phone,
            department: this.department,
            accountId: this.recordId
        })
        .then(() => {
            console.log('Contact created successfully!');
        })
        .catch(error => {
            console.error('Error creating contact:', error.body.message);
        });
    }






}