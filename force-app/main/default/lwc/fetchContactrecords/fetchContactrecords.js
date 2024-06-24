import { LightningElement,track,wire } from 'lwc';
//calling the apex method into the LWC syntax
import getrecords from '@salesforce/apex/Fetchconrecords.getrecords'; // Apex Method
import updateconrecord from '@salesforce/apex/Fetchconrecords.updateconrecord'; // Apex Method
export default class FetchContactrecords extends LightningElement {
  
   
@track columns = [
    { label: 'LastName', fieldName: 'LastName', type:'text',editable: true},
    { label: 'FirstName', fieldName: 'FirstName', type:'text',editable: true },
    { label: 'Email', fieldName: 'Email', type: 'text',editable: true }
   
];
@track conlist;
@track error;
@wire(getrecords) contrecords({error,data}){
   debugger;
 if(data){
    this.conlist=data;
 }
 else if(error){
    this.error=error;
 }
}


savehandle(event){
   const updatefield = event.detail.draftvalue;
   console.log('updatefield:'+JSON.stringify(updatefield))
   updateconrecord({condata:updatefield})
   .then(result =>{
      console.log(+JSON.stringify(result))
   })
   .catch(error=>{
      console.error(+JSON.stringify(error))
   })
}
        }