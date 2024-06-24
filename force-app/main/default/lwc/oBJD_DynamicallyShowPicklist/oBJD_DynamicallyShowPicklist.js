import { LightningElement,wire,track,api } from 'lwc';
import getrecordspicklist from '@salesforce/apex/DynamicallyShowPicklistApex.getrecordspicklist';
import updaterecordfields from '@salesforce/apex/DynamicallyShowPicklistApex.updaterecordfields';
export default class OBJD_DynamicallyShowPicklist extends LightningElement {

    @track roleValues = [];
    @track selectedroleType = '';
    @track showHrFields = false;
    @track showLeadFields = false;
    @track showDeveloperFields = false;
    @track showTechnicalLeadFields = false;
    @track hrfirstName ;
     @track hrsecondName ;
    @track leadFirstName = '';
    @track leadsecondName = '';
    @track devfirstName = '';
    @track devsecondName = '';
    @track teamLeadFirstName = '';
    @track error;
    @api recordId;

    @wire(getrecordspicklist)
    wiredroleValues({ error, data }) {
        debugger;
        if (data) {
            this.roleValues = data.map(option => ({ label: option, value: option }));;

        } else if (error) {
            console.error('Error retrieving industry picklist values:', error);
        }
    }

    handleRoleChange(event) {
        debugger;
        if( this.selectedroleType = event.detail.value){
            this.showHrFields = this.selectedroleType == 'HR';

        } if(this.selectedroleType = event.detail.value){
            this.showLeadFields = this.selectedroleType == 'Team lead';

        }if(this.selectedroleType = event.detail.value){
            debugger;
            this.showDeveloperFields = this.selectedroleType == 'Developer';

        }if(this.selectedroleType = event.detail.value){
            this.showTechnicalLeadFields = this.selectedroleType == 'Technical Lead';
        }
    }

    handleHrNameChange(event) {
        debugger;  
            this.hrfirstName = event.target.value;
  
    }
    handleHrSecondNameChange(event){
        debugger;
        this.hrsecondName = event.target.value;
    }

    handleLeadFirstNameChange(event) {
        debugger;
        this.leadFirstName = event.target.value;
    }
    handleLeadSecondNameChange(event){
        debugger;
        this.leadsecondName = event.target.value;
    }

    handleDeveloperFirstNameChange(event){
        this.devfirstName = event.target.value;
    }
     handleDeveloperSecondNameChange(event){
        this.devsecondName = event.target.value;
    }
  
    handleTeamleadFirstNameChange(event){
        this.teamLeadFirstName = event.target.value;
    }


    handleSave() {
        debugger;
        updaterecordfields({recId:this.recordId, hrfirstName:this.hrfirstName,hrsecondName:this.hrsecondName})
            .then((result) => {
                console.log('Record updated successfully',result);
                // You can add additional logic here, such as refreshing the page or displaying a success message
            })
            .catch(error => {
                console.error('Error updating record:', error);
                
            });
    }


}