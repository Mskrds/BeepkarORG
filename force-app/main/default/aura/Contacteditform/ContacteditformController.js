// ContactEditFormController.js
({
    handleRecordUpdated: function (component, event, helper) {
       
    },
    saveChanges: function (component, event, helper) {
        var editedRecord = component.get("v.editedRecord");
        if (helper.validateRecord(editedRecord)) {
            helper.saveRecord(component, editedRecord);
        } 
    }
})