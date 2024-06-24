import { LightningElement, track } from 'lwc';
import createNewRecMeth from "@salesforce/apex/createNewRecordHandler.createNewRecMeth";
export default class CreateNewLeadRecord extends LightningElement {
    @track firstName;
    @track lastName;
    @track Comp;
    leadData;
    error;
    handleOnchange(event){
        debugger;
        if(event.target.name == 'Lname'){
            this.lastName = event.target.value;
        } else if(event.target.name == 'Fname'){
            this.firstName = event.target.value;
        }
        else if(event.target.name == 'comp'){
            this.Comp = event.target.value;
        }
    }
handleClick(){
    debugger;
    createNewRecMeth({ledlastName:this.lastName, ledfirstName:this.firstName, ledcomp:this.Comp})
    .then((result) => {
        this.leadData = result;
        this.showToast();
    }).catch((err) => {
        this.error = err;
    });
}

    showToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message:
                'REcord Create Successfully',
        });
        this.dispatchEvent(event);
    }
}