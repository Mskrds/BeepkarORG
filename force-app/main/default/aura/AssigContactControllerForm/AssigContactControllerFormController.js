// ContactFormController.js
({
    createContact: function(component, event, helper) {
        var firstName = component.get("v.firstName");
        var lastName = component.get("v.lastName");
        var email = component.get("v.email");
        var phone = component.get("v.phone");

        // Validate email format
        if (!helper.isValidEmail(email)) {
          
            console.error("Invalid email format");
          
            return;
        }

        // Validate phone format
        if (!helper.isValidPhone(phone)) {
           
            console.error("Invalid phone format");
           
            return;
        }

        var action = component.get("c.createContact");
        action.setParams({
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
            "phone": phone
        });

        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var contactId = response.getReturnValue();
                console.log("Contact created with Id: " + contactId);
      
            } else {
                console.error("Error while creating contact: " + response.getError()[0].message);
            }
        });

        $A.enqueueAction(action);
    }
})