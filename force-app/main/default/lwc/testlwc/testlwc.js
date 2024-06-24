import { LightningElement,track } from 'lwc';
export default class Testlwc extends LightningElement {

   @track  selectedrecId;


   handleRecordSelection(event){
       
        let  selectedRecordId = event.detail.recordId;
       let seletecrecId=event.target.value;
       let ssss= this.selectedrecId;
       debugger;
       console.log('Selected Record ID:', selectedRecordId);
      
   }

}