import { LightningElement, api, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getTasksByAccountId from '@salesforce/apex/PastWeekTasksAndEventsController.getTasksByAccountId';
import updateTaskStatus from '@salesforce/apex/PastWeekTasksAndEventsController.updateTaskStatus';

export default class GetTaskRelatedtoAccount extends LightningElement {
    @api recordId; // Account Id passed from the page

    @wire(getTasksByAccountId, { accountId: '$recordId' })
    tasks;

    statusOptions = [
        { label: 'In Progress', value: 'In Progress' },
        { label: 'Completed', value: 'Completed' },
        { label: 'Pending', value: 'Pending' }
        
    ];

       
}