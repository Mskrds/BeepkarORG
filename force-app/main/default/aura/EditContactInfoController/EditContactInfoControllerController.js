//Create an Aura component by  lightning record edit form on contact object with email and  phone fields based on recordid
// ContactEditFormController.js

({
    
    handleSubmit: function(component, event, helper) {
        debugger;
        event.preventDefault(); // Prevent the form submission for now
        
     
       
    },
    
    validatemeilonchange : function(component, event, helper){
        debugger;
        var queryemail = component.find('email').get('v.value');
        let emailRegex=/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        let emailVal=queryemail;
       /* if(emailVal.match(emailRegex)){
            
        }else{
            alert("Please enter valid email");
        }*/
    },
    validatphoneonchange: function(component, event, helper){
        debugger;
        var phonequery = component.find('phone').get('v.value');
        let phoneRegex = /^\d{10}$/;
        let phoneval = phonequery;
   /* if(phoneval.match(phoneRegex)){
            
        }else{
            alert("Please enter valid phone");
        }*/
    },
    
    handleSuccess: function(component, event, helper) {
        
        // Handle the form success event if needed
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Success!",
            "message": "Record updated successfully.",
            "type": "success"
        });
        toastEvent.fire();
    },
    
    handleError: function(component, event, helper) {
        // Handle the form error event if needed
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Error!",
            "message": "An error occurred while updating the record.",
            "type": "error"
        });
        toastEvent.fire();
    }
})