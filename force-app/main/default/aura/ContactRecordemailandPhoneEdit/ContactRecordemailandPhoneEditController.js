// ContactEditFormController.js
({
    
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
        
        // Close the action panel
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();
     
    }
})