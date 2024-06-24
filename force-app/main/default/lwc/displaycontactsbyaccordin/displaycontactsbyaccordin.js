import { LightningElement, api, wire } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import getconrelatedtoacc from '@salesforce/apex/AccountObjcontroller.getconrelatedtoacc';
const columns = [
    {label : 'Contact Name', fieldName : 'Name'},
     {label : 'Contact Phone', fieldName : 'Phone'},
     {label : 'Contact Email', fieldName : 'Email'},
];
export default class Displaycontactsbyaccordin extends LightningElement {

columnsList = columns;
@api getdata;
allData;

    @wire(getconrelatedtoacc)
    wiredAccounts({ error, data }) {
        debugger;
        if (data) {
            this.allData = data;
            console.log('Data',data);
        } else if (error) {
         console.error('Error',error);
        }
    }
}