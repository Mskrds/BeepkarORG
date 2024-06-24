import { LightningElement, track, wire } from 'lwc';
import getContactforsortingandfilter from '@salesforce/apex/ContactDetailsController.getContactforsortingandfilter';
export default class ContactFilterandSorting extends LightningElement {
// contactList.js
    @track filterText = '';
    @track selectedSortOption = 'Name';
    @track sortOptions = [
        { label: 'Name', value: 'Name' },
        { label: 'Email', value: 'Email' },
        // Add more sorting options as needed
    ];

    @wire(getContactforsortingandfilter)
    wiredContacts({ error, data }) {
        if (data) {
            this.contacts = data;
            this.filterAndSortContacts();
        } else if (error) {
            console.error('Error fetching contacts:', error);
        }
    }

    filterAndSortContacts() {
        this.filteredContacts = this.contacts
            .filter(contact => contact.Name.toLowerCase().includes(this.filterText.toLowerCase())) // not understand
            .sort((a, b) => (a[this.selectedSortOption] > b[this.selectedSortOption] ? 1 : -1));
    }

    handleFilterChange(event) {
        this.filterText = event.target.value;
        this.filterAndSortContacts();
    }

    handleSortChange(event) {
        this.selectedSortOption = event.detail.value;
        this.filterAndSortContacts();
    }

    handleSortColumn(columnName) {
        if (this.selectedSortOption === columnName) {
            this.selectedSortOption = '';
        } else {
            this.selectedSortOption = columnName;
        }
        this.filterAndSortContacts();
    }
}