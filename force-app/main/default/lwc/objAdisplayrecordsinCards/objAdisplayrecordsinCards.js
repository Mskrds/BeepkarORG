import { LightningElement, api,track } from 'lwc';
import getcandidateDetails from '@salesforce/apex/ObjAcontroller.getcandidateDetails';
import orderLogo from '@salesforce/resourceUrl/orderLogo';

const ERROR_VARIANT = 'error';

export default class ObjAdisplayrecordsinCards extends LightningElement {


  @api recordId;
  @track modifiedAddOns = [];
  @track addOn; 
  
  data;
  error;

  
  orderLogo = orderLogo;


  readOnly;
  @api
  value;
  editedValue;
  
  
   connectedCallback() {     
     debugger;
      setTimeout(()=>{
           
            this.callApexMethod();
             
        },300);
    }



    callApexMethod(){
      debugger;
      getcandidateDetails({addOnId:this.recordId})
      .then(result => {
        this.data = result;
         
          this.addOn = result.map(addO => ({
     
              ...addO,
                modifiedImageUrl: this.extractImageUrlFromRichText(addOn.ImageURL__c)
            

          }));
      })
            
      .catch(error => {
              console.error('Error fetching add-on:',error);
      });
    }
    

// Add this method to your JavaScript file
 extractImageUrlFromRichText(richTextContent) {
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = richTextContent;

        const imgElement = tempDiv.querySelector('img');

        return imgElement ? imgElement.src : '';
    }


}