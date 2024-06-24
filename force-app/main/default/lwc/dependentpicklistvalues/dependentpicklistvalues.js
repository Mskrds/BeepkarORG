import { LightningElement,wire, track  } from 'lwc';
import {getObjectInfo} from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import {getPicklistValues} from 'lightning/uiObjectInfoApi';
import State_FIELD  from '@salesforce/schema/Account.State__c';
import COUNTRY_FIELD  from '@salesforce/schema/Account.Country__c';
 
export default class Dependentpicklistvalues extends LightningElement {
    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT })
    accountInfo;
    @track stateOptions;
    @track countryOptions;
    @track country;
    // @track countryFieldData;

    @wire(getPicklistValues, { recordTypeId: '$accountInfo.data.defaultRecordTypeId', fieldApiName: State_FIELD })
stateFieldInfo({ data, error }) {
    if (data) {
        console.log('State Field Data:', data);
        this.stateFieldData = data;
    } else if (error) {
        console.error('Error fetching state field values:', error);
    }
}

@wire(getPicklistValues, {recordTypeId: '$accountInfo.data.defaultRecordTypeId', fieldApiName: COUNTRY_FIELD })
countryFieldInfo({ data, error }) {
    if (data) {
        console.log('Country Field Data:', data);
        this.countryOptions = data.values;
    } else if (error) {
        console.error('Error fetching country field values:', error);
    }
}

    handleContinentChange(event) {
        debugger;
        let key = this.stateFieldData.controllerValues[event.target.value];
        this.stateOptions = this.stateFieldData.values.filter(opt => opt.validFor.includes(key));
    }

    
}