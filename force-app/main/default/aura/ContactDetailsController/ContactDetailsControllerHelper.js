({
    loadContact: function(component, recordId) {
       var action = component.get("c.getContact");
        action.setParams({ "recordId": recordId });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var contact = response.getReturnValue();
                component.set("v.contactRecord", contact);
            }
        });


    },

    updateContacta: function(component, updatedContact) {
        var action = component.get("c.updateContact");
        action.setParams({ "updatedContact": updatedContact });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
               
                console.log("Contact updated successfully");
            }
        });

        $A.enqueueAction(action);
    
    },

    validateEmail: function(email) {
  
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        var isValid = emailRegex.test(email);
        return isValid;
    },

    validatePhone: function(phone) {
      
        var isValid = /^[0-9]{10}$/.test(phone);
        return isValid;
    }
})