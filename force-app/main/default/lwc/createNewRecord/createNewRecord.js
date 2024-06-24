import { LightningElement, track} from 'lwc';
//import createNewRecMethod from '@salesforce/apex/createNewRecordHandler.createNewRecMethod'
//import { ShowToastEvent } from 'lightning/platformShowToastEvent';
export default class CreateNewRecord extends LightningElement {
    @track ledFirstName;
    @track ledCompany;
    @track ledLastLName;
    @track ledGender;
    ledresults;
    error;
    @track isSecondPage = false;

    @track GenderOptions = [
        { label: 'Male', value: 'Male' },
        { label: 'Female', value: 'Female' }
         ];

    handleOnchange(event){
        debugger;
        if(event.target.name == 'ledfName'){
            this.ledFirstName = event.target.value;

        } else if(event.target.name == 'ledCompany'){
            this.ledCompany = event.target.value;

        } else if(event.target.name == 'ledlName'){
            this.ledLastLName = event.target.value;

        } else if(event.target.name == 'Gender'){
            this.ledGender = event.target.value;
        }


    }
    handleClick(){
        debugger;
       this.isSecondPage = true;
    }
}