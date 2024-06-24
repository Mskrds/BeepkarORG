({
    handleClick: function(component, event, helper) {
        component.set("v.showSpinner", true);
        var conData = component.get("v.newContactForm");
            var saveConAction = component.get("c.getContactDetails");
        saveConAction.setParams({
            conList :  conData
        });
            saveConAction.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title":"Contact Created",
                        "message":"Creation successful!!"
                    });
                    toastEvent.fire();
                    $A.get('e.force:refreshView').fire();
                } else if (state === "ERROR") {
                    console.log('response state-->' + state);
                } else {
                    console.log('unknown prob-->' + state);
                }
                
                component.set("v.showSpinner", false);
            });
            
            $A.enqueueAction(saveConAction);
    }
})