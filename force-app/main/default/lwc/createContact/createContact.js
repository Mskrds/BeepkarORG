// contactForm.js
import { LightningElement, track } from 'lwc';
import createContact from '@salesforce/apex/ContactControllers.createContact';

export default class CreateContact extends LightningElement {
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';
    @track showError = false;
    @track error = '';

    handleFirstNameChange(event) {
        this.firstName = event.target.value;
    }

    handleLastNameChange(event) {
        this.lastName = event.target.value;
    }

    handleEmailChange(event) {
        this.email = event.target.value;
        this.validateEmail();
    }

    handlePhoneChange(event) {
        this.phone = event.target.value;
        this.validatePhone();
    }

    validateEmail() {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!this.email.match(emailRegex)) {
            this.showError = true;
            this.error = 'Please enter a valid email address.';
        } else {
            this.showError = false;
            this.error = '';
        }
    }

    validatePhone() {
        const phoneRegex = /^\d{10}$/;

        if (!this.phone.match(phoneRegex)) {
            this.showError = true;
            this.error = 'Please enter a valid 10-digit phone number.';
        } else {
            this.showError = false;
            this.error = '';
        }
    }

    get isCreateDisabled() {
        return (
            this.showError ||
            !this.firstName ||
            !this.lastName ||
            !this.email ||
            !this.phone
        );
    }

    createContact() {
        if (!this.isCreateDisabled) {
            createContact({
                firstName: this.firstName,
                lastName: this.lastName,
                email: this.email,
                phone: this.phone
            })
                .then(() => {
                    // Handle success, if needed
                    console.log('Contact created successfully');
                })
                .catch(error => {
                    // Handle error, if needed
                    console.error('Error creating contact', error);
                });
        }
    }
}