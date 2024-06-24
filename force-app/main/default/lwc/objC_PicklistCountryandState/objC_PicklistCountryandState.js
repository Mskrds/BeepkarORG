import { LightningElement,track,wire } from 'lwc';
import getPicklistValues from '@salesforce/apex/DynamicallyShowPicklistApex.getPicklistValues';
export default class ObjC_PicklistCountryandState extends LightningElement {

    @track selectedCountry;
    @track selectedState;
    @track countryPicklistValues = [];
    @track statePicklistValues = [];

    // Fetch picklist values on component initialization
    connectedCallback() {
        debugger;
        this.fetchPicklistValues();
    }

    // Wire method to fetch picklist values
    @wire(getPicklistValues)
    wiredPicklistValues({ data, error }) {
        if (data) {
            debugger;
            this.countryPicklistValues = data['Country values'];
            this.statePicklistValues = data['State values'];
        } else if (error) {
            console.error('Error fetching picklist values:', error);
        }
    }

  
    handleCountryChange(event) {
        this.selectedCountry = event.detail.value;
       
    }

   
    handleStateChange(event) {
        this.selectedState = event.detail.value;
        
    }

    // Fetch picklist values method
    fetchPicklistValues() {
        // Call the wire method to fetch picklist values
        getPicklistValues()
            .then(result => {
                this.countryPicklistValues = result['Country values'];
                this.statePicklistValues = result['State values'];
            })
            .catch(error => {
                console.error('Error fetching picklist values:', error);
            });
    }
}