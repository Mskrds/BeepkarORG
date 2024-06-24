// productList.js
import { LightningElement, wire,api,track } from 'lwc';
import getProducts from '@salesforce/apex/ProductControllerB.getProducts';
export default class ProductobjeinsertAssigB extends LightningElement {
   

@api records;
@api productList = [];
@track data = [];
@track selectedproducts= false;
@track insertrecord1;
@track selectedproductrecords = [];
updateObjList = [];
updatedListToPass = [];
filteredList = [];
error;
inputVal = true;
    disableBtn;
    ischecked = true;
   
connectedCallback() {
    debugger;
    setTimeout(()=>{
      getProducts()
      .then(result =>{
      if(result){
          this.data = result;   

          let tempObjList = [];
          for(var i=0;i<result.length;i++){
             var tempObj={
                Id : result[i].Id,
                Name : result[i].Name,
                checked : false
             };
             tempObjList.push(tempObj);
          }
          this.updateObjList = tempObjList;
      }
      })
      .catch(error =>{
       this.error = error;
      })
    },300);
}



 handleCheckboxChange(event) {
     debugger;
     let collectallids =[];
        var selectedProductId = event.target.value;
        var isChecked = event.target.checked;
        this.updateObjList.forEach(record => {
            if (record.Id === selectedProductId ) {
                if(isChecked == true){
                var objtemp ={
                    Id : record.Id,
                    Name : record.Name,
                    checked : true
                }
                this.filteredList.push(objtemp);
                }
                // else{
                //     this.filteredList.filter(record => record.Id !== selectedProductId);
                // }
                
            }else{
               // this.filteredList = this.filteredList.filter(item => item.Id !== selectedProductId);
            }
        });
        console.log('Record List ::: '+ this.filteredList);
 }

       


 
//              for (let i = 0; i < this.data.length; i++) {
//             if (this.data[i].Id === selectedProductId) {
//                 this.productList = this.data[i];
//                 this.productList = this.collectallids;
//             }

//      this.productList = this.productList.map(prod => 
//             prod.Id === selectedProductId ? {...prod, isSelected: event.target.checked } : prod
//         );

//         if (isChecked) {
//             // Add the selected product ID to the array
//             this.productList = [this.productList, selectedProductId];
//         } else {
//             // Remove the selected product ID from the array
//             this.productList = this.productList.filter(item => item !== selectedProductId);
//         }

//         // Update the button disabled state
//         this.disableBtn = this.productList.length === 0;
//         this.selectedproductrecords = this.productList.filter(prod => prod.isSelected);
//         // Check if any records are selected to enable/disable the button
//         this.disableBtn = this.selectedproductrecords.length === 0;
//         //condition for button should be visible after checked -->
    
//         if(event.target.checked){
//             this.disableBtn = false;
//         }else{
//             this.disableBtn = true;
//         }
//     }

//  }


    selectall(event) {
        debugger;
    const toggleList = this.template.querySelectorAll('[data-id^="toggle"]');
    //iterate the togglelist
    for (const toggleElement of toggleList) {
        toggleElement.checked = event.target.checked;
    if(event.target.checked){
        this.disableBtn = false;
      }else{
        this.disableBtn = true;;
      }     
        this.productList = event.target.checked ? this.data.map(prod => prod.Id) : [];
    }

    }


nextScrren(){
    debugger;
    console.log('Selected Items:', this.filteredList);
    this.data= false;
    this.productList = true;
    this.selectedproducts =true;
    this.productList = [];
    
}

}