import { LightningElement,track } from 'lwc';
    import { CloseActionScreenEvent } from "lightning/actions";
    import GetAcclist from '@salesforce/apex/AccandOpp_PtoC_Records.GetAcclist';
    import getAccRealtedopp from '@salesforce/apex/AccandOpp_PtoC_Records.getAccRealtedopp';
    export default class accandOpp_PtoC_Records extends LightningElement {

    @track Accdata =[];
    @track showAccount = false;
    @track showOpportunity = false;
    @track selectedAccountIds = [];
    @track 
    error;

    connectedCallback() {
        debugger;
        setTimeout(()=>{
        this.callAccApexMethod()
        },300);
    }

    callAccApexMethod() {
    GetAcclist()
    .then(Accdata => {
    debugger;
        if (Accdata) {
        let tempObjList = [];
        for (let i = 0; i < Accdata.length; i++) {
            let tempObj = {
            Id: Accdata[i].Id,
            Name: Accdata[i].Name,
            Email__c : Accdata[i].Email__c,
            Phone : Accdata[i].Phone,
            Site : Accdata[i].Site

            };
            tempObjList.push(tempObj);
        }
        this.Accdata = tempObjList;
        this.showAccount = true;
    }
    })
    .catch(error => {
        console.error('Error while fetching account records', error);
        this.error = error;
        this.closeQuickAction();
        });
    }

    //--------------------
    callOppApexMethod() {
    getAccRealtedopp()
        .then(Oppodata => {
        debugger;
            if(Oppodata){
            
        }
        })
        .catch(error => {
        console.error('Error while fetching account records', error);
        this.error = error;
        this.closeQuickAction();
        });
    }

    handleCheckboxChange(event) {
    debugger;
    const accountId = event.target.dataset.id;
    console.log('Account IDs:', accountId);

        this.selectedAccountIds = [...this.selectedAccountIds, accountId];

        for (var i = 0; i < this.Accdata.length; i++) {
            if (this.selectedAccountIds == (this.Accdata[i].Id)) {
                this.Accdata[i].checked = true;
            } else {
                this.Accdata[i].checked = false;
            }
        }


    // You can perform additional logic here based on the selected checkboxes
    console.log('Selected Account IDs:', this.selectedAccountIds);
    }



    closeQuickAction() {
    console.log( "Record Id is " + this.recordId );
    this.dispatchEvent( new CloseActionScreenEvent() );
    }


    }