({
    handleSearch: function(component, event, helper) {
        var searchCriteria = component.get("v.searchCriteria");
        var selectedField = component.get("v.selectedField");

        var action = component.get("c.searchRecords");
        action.setParams({
            "searchCriteria": searchCriteria,
            "selectedField": selectedField
        });

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                var searchResults = response.getReturnValue();
                component.set("v.searchResults", searchResults);
            } else {
                console.error("Error during search: " + state);
            }
        });

        $A.enqueueAction(action);
    }
})