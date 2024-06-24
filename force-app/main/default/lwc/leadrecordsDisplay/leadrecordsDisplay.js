import { LightningElement,track } from 'lwc';
import getleadrecords from '@salesforce/apex/LeadrecordsDisplay.getleadrecords';
export default class LeadrecordsDisplay extends LightningElement {

@track showleadrecords = [];
connectedCallback() {
    setTimeout(() =>{
        this.callapexmethod()
    },400);
}

callapexmethod(){
        getleadrecords()
        .then((result) => {
            console.log('lead record',result);
            this.showleadrecords = result;
            for(var i=0; i<this.showleadrecords.length; i++){
                if(this.showleadrecords[i].Status == 'Open - Not Contacted'){
                    this.showleadrecords[i].color = 'green';
                } if(this.showleadrecords[i].Status == 'Working - Contacted'){
                    this.showleadrecords[i].color = 'blue';
                } else if(this.showleadrecords[i].Status == 'Working - Contacted'){
                    this.showleadrecords[i].color = 'blue';
                }
            }
        })
        .catch((error) => {
            console.error('error',error);
        });
    }

}