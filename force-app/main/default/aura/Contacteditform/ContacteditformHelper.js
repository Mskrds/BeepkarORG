// ContactEditFormHelper.js
({
    validateRecord: function (record) {
        // Perform basic validation
        if (!record.Email || !record.Phone) {
            // Display an error message or take appropriate action
            return false;
        }

        // You can add more specific validation logic as needed

        return true;
    },

    saveRecord: function (component, editedRecord) {
        component.find("recordData").saveRecord($A.getCallback(function(saveResult) {
            if (saveResult.state === "SUCCESS"){
                console.log("Record saved successfully");
               
            } else if (saveResult.state === "ERROR") {
                console.error("Error saving record: ", saveResult.error);  
            } 
        }));
    }
})