// ContactInfoFormHelper.js
({
    fetchContact: function (component) {
        var action = component.get("c.getContactById");
        action.setParams({ contactId: component.get("v.recordId") });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var contact = response.getReturnValue();
                component.set("v.contact", contact);
                component.set("v.editedContact", { contact });
            } else {
                console.error("Error fetching contact: ", state);
                
            }
        });
        $A.enqueueAction(action);
    },

    validateContact: function (editedContact) {
        if (!editedContact.LastName || !editedContact.Email || !editedContact.Phone) {
         
            return false;
        }
        return true;
    },

    saveContact: function (component) {
        var action = component.get("c.updateContact");
        action.setParams({ 
            contactId: component.get("v.editedContact.Id"),
            lastName: component.get("v.editedContact.LastName"),
            email: component.get("v.editedContact.Email"),
            phone: component.get("v.editedContact.Phone")
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("Contact updated successfully");
                // Handle success scenario if needed
            } else {
                console.error("Error updating contact: ", state);
                // Handle errors appropriately
            }
        });
        $A.enqueueAction(action);
    }
})