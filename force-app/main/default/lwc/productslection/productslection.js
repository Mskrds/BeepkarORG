import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getOpportunityLineItems from '@salesforce/apex/OpportunityLineItemController.getOpportunityLineItems';
import insertOpportunityLineItem from '@salesforce/apex/OpportunityLineItemController.insertOpportunityLineItem';

const columns = [
    { label: 'Product', fieldName: 'Product2Id', type: 'text' },
    { label: 'Quantity', fieldName: 'Quantity', type: 'number' },
    { label: 'Total Price', fieldName: 'TotalPrice', type: 'currency' },
    { label: 'Unit Price', fieldName: 'UnitPrice', type: 'currency' },
];

export default class Productslection extends LightningElement {
    lineItems;
    columns = columns;
    selectedRows = [];

    @wire(getOpportunityLineItems)
    wiredOpportunityLineItems({ error, data }) {
        if (data) {
            this.lineItems = data.map(item=>({ProductName:item.PricebookEntry.Product2.Name}));
        } else if (error) {
            console.error(error);
        }
    }

   handleRowSelection(event) {
        this.selectedRows = event.detail.selectedRows;
       
    }

    insertOpportunityLineItem() {
          if (this.selectedRows.length === 0) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Please select at least one Opportunity Line Item',
                    variant: 'error',
                })
            );
            return;
        }

        insertOpportunityLineItem()
            .then(() => {
                // Refresh the opportunity line items after insertion
                return refreshApex(this.lineItems);
            })
            .catch(error => {
                console.error(error);
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: 'Error inserting Opportunity Line Item',
                        variant: 'error',
                    })
                );
            });
    }
}