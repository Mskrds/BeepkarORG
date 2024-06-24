import { LightningElement, track, api } from 'lwc';
import createNewRecMethod from '@salesforce/apex/createNewRecordHandler.createNewRecMethod'
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateNewRecord2 extends LightningElement {
   // @track ledFirstName;
   // @track ledCompany;
   // @track ledLastLName;
   // @track ledGender;
   @track ledemail;
    @api fname1;
    @api lname1;
    @api comp1;
    @api gen1;
    ledresults;
    error;
    
    handleOnchange(event){
        debugger;
        if(event.target.name == 'ledfemail'){
            this.ledemail = event.target.value;

        } 
        /*else if(event.target.name == 'ledCompany'){
            this.ledCompany = event.target.value;

        } else if(event.target.name == 'ledlName'){
            this.ledLastLName = event.target.value;

        } else if(event.target.name == 'Gender'){
            this.ledGender = event.target.value;
        }*/
    }
    handleClick(){
        debugger;
        createNewRecMethod({lEmail:this.ledemail})
        .then((result) => {
            this.ledresults = result;
            console.log(ledresults);
           
          })
          .catch((error) => {
            this.error = error;
            console.log(error);
          });
          this.showToast();
    }

    showToast() {
        const event = new ShowToastEvent({
            title: 'Success',
            message:
                'Female candidate-REcord Is Created Successfully',
        });
        this.dispatchEvent(event);
    }
}