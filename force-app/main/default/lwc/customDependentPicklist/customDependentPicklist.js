import { LightningElement, wire, track } from 'lwc';
import fetchDependentPicklistValues from '@salesforce/apex/DependentPicklistGenerator.fetchDependentPicklistValues';

export default class CustomDependentPicklist extends LightningElement {
    @track typeDependentPicklistWrapperArray;
    @track typeOptions;
    @track ratingOptions;
    selectedTypeValue;
    selectedRatingValue;

    @wire(fetchDependentPicklistValues)
    wiredFetchDependentPicklistValues({ error, data }) {
        if (data) {
            try {
                this.typeDependentPicklistWrapperArray = JSON.parse(data);
                this.typeOptions = Object.keys(JSON.parse(data)).map(key => ({ label: key, value: key }));
                this.ratingOptions = undefined;
            } catch (error) {
                console.error('Error parsing data:', error);
            }
        } else if (error) {
            console.error('Error fetching dependent picklist values:', error);
        }
    }

    handleTypeChange(event) {
        // Reset selected values and options for the "Rating" field
        this.selectedRatingValue = undefined;
        this.ratingOptions = undefined;

        // Get the selected value of the "Type" field from the event
        const selectedType = event.detail.value;

        // Check if there are dependent picklist values available for the selected "Type"
        if (this.typeDependentPicklistWrapperArray && this.typeDependentPicklistWrapperArray[selectedType]) {
            // Extract and map picklist values for the "Rating" field
            this.ratingOptions = Object.keys(this.typeDependentPicklistWrapperArray[selectedType][0]).map(value => ({
                label: value,
                value: value
            }));
        }
    }

    handleRatingChange(event) {
        // Handle the selection of both "Hot" and "Cold" values
        this.selectedRatingValue = event.detail.value;
        
        // Check if the selected type is "customer-channel"
        if (this.selectedTypeValue === 'customer-channel') {
            // Force the rating to be "Hot"
            this.selectedRatingValue = 'Hot';
        }

        console.log('Selected Rating:', this.selectedRatingValue);
        // Add additional logic if needed
    }
}