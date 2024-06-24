import { LightningElement, track, wire } from 'lwc';
import fetchAccount from '@salesforce/apex/AccountObjcontroller.fetchAccount';
import getContacts from '@salesforce/apex/AccountObjcontroller.getContacts';
import fetchOpportunity from '@salesforce/apex/AccountObjcontroller.fetchOpportunity';

export default class DisplayAccounts extends LightningElement {
    @track acc;
    @track contacts = [];
    @track opps = [];
    selectedAccountId;

    @wire(fetchAccount)
    wiredAccounts({ error, data }) {
        debugger;
        if (data) {
            this.acc = data;
        } else if (error) {
            // Handle error
        }
    }

    handleAccountClick(event) {
        debugger;
        this.selectedAccountId = event.target.name;
        this.fetchContactsAndOpportunities(this.selectedAccountId);
    }

    fetchContactsAndOpportunities(accountId) {
        debugger;
        getContacts({ accountId })
            .then(result => {
                debugger;
                this.contacts = result;
            })
            .catch(error => {
                // Handle error
            });

        fetchOpportunity({ accountId })
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
                // Handle error
            });
    }

    handleContactChange(event) {
        // Do something when contact is selected
    }
}