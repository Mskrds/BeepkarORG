import { LightningElement, api } from 'lwc';
//calling the apex method into the LWC syntax
import createnewConRecord from '@salesforce/apex/basicInfolwcomponent.createnewConRecord'; // Apex Method
export default class BasicInformation extends LightningElement {
    error;
    myFirstName='';
    myLastName='';
    Email='';
    

     // value
    changeHandler(event) {  //onchange event
      
      if(event.target.name=='FirstName'){
        this.myFirstName = event.target.value;

      }
       if(event.target.name=='LastName'){
        this.myLastName = event.target.value;
    }
    else if(event.target.name=='Email'){
        this.Email = event.target.value;

    }     
}   
saverecordHandler(){
  
  debugger; //checking purpose --> will start 
 
    createnewConRecord({ FirstName : this.myFirstName,LastName:this.myLastName,Email:this.Email })
    .then(response => {
        alert("record have been created sucessfully");
        this.template.querySelectorAll('lightning-input[data-id="reset"]'). //collecting all the input fields
        forEach(element => {           //passing each one field
          element.value = null;        // making it as Null
        });
        //this.template.querySelector("lightning-input").reset();
    })
    .catch(error => {
        this.error = error;
        console.log('***ExId Error: ' + this.error.status);
    });
  // this.template.querySelector('form').reset();
}
}