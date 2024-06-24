({
    fetchContact: function (component, contactId) {
        var action = component.get("c.getContactById");
        action.setParams({ contactId: contactId });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var contact = response.getReturnValue();
                component.set("v.contact", contact);
                component.set("v.editedContact", {contact });
            } else {
                console.error("Error fetching contact: ", state);
                // Handle errors appropriately
            }
        });
        $A.enqueueAction(action);
    },

    validateContact: function (editedContact) {
        // Perform basic validation, you can add more validation logic as needed
        if (!editedContact.LastName || !editedContact.Email || !editedContact.Phone) {
            // Display an error message or take appropriate action
            return false;
        }
        return true;
    },

    saveContact: function (component, editedContact) {
        var action = component.get("c.updateContact");
        action.setParams({ 
            contactId: editedContact.Id,
            lastName: editedContact.LastName,
            email: editedContact.Email,
            phone: editedContact.Phone
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