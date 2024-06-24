// customButton.js
   import { LightningElement, api } from 'lwc';
export default class CreateFeasibilityapprovalButton extends LightningElement {

@api recordId;
ShowRmsnullMessage=false;

connectedCallback(){
    setTimeout(() =>{
     this.getmymethod();
    },300);
}
getmymethod(){

}

    showAlert(message) {
        // Show an alert using the Lightning Design System
        const evt = new ShowToastEvent({
            title: 'Check Field',
            message: message,
            variant: 'error',
        });
        this.dispatchEvent(evt);
    }
}