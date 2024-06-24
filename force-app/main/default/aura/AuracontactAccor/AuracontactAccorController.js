({
    doInit: function(component, event, helper) {
        component.set("v.columnCon1", [
            {label: "Last Name", fieldName: "LastName", type: "text"},
            {label: "Phone", fieldName: "Phone", type: "phone"},
            {label: "Email", fieldName: "Email", type: "email"},
        ]);

        var contactAction1 = component.get("c.getContactDetails");
        contactAction1.setCallback(this, function(Response) {
            var state = Response.getState();
            if (state === "SUCCESS") {
                component.set("v.firstBatchCon", Response.getReturnValue());
            } else {
                console.error("Failed to fetch contact details");
            }
        });
        $A.enqueueAction(contactAction1);
    }
})