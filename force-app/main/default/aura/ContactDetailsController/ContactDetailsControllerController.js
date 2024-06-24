({
    doInit: function(component, event, helper) {
        var recordId = component.get("v.recordId");
        helper.loadContact(component, recordId);
    },

    editContact: function(component, event, helper) {
        var recordLoader = component.find("recordLoader");

        // Load the contact record using force:recordData
        recordLoader.reloadRecord(true);

        // Use the "recordUpdated" event handler to get the updated record
        component.find("recordLoader").get("e.recordUpdated").setParams({
            "recordId": component.get("v.recordId"),
            "fields": ["Email", "Phone","LastName"]
        }).fire();
    },

    saveContact: function(component, event, helper) {
        var editedContact = component.get("v.editedContact");

        var isValidEmail = helper.validateEmail(editedContact.Email);

        if (!isValidEmail) {
            
            console.error("Invalid email address. Please enter a valid email.");
            return;
        }

        //  phone field validation
        var isValidPhone = helper.validatePhone(editedContact.Phone);

        if (!isValidPhone) {
           
            console.error("Invalid phone number. Please enter a 10-digit phone number.");
            return;
        }
         
        helper.updateContacta(component, editedContact);
    }
})