// opportunityListLWC.js
import { LightningElement, wire, api } from 'lwc';
import getOpportunitiesByAccountId from '@salesforce/apex/OpportunityController.getOpportunitiesByAccountId';

export default class GetOpportunitiesByAccountId extends LightningElement {
    @api recordId; // Account Id passed from the record page

    @wire(getOpportunitiesByAccountId, { accountId: '$recordId' })
    opportunities;

    
}