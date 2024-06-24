// PastWeekTasksAndEventsController.js
({
    doInit : function(component, event, helper) {
        debugger;
        // Call the server-side controller methods to fetch tasks and events
        var action = component.get("c.getTasksAndEvents");
        //  var eventAction = component.get("c.getTasksAndEvents");
        
        action.setCallback(this, function(taskResponse) {
            var state = taskResponse.getState();
            if (state === "SUCCESS") {
                component.set("v.tasks", taskResponse.getReturnValue());
                var taskList =  taskResponse.getReturnValue().tasklist;
            } else if(state === "ERROR"){
                var errors = action.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert(errors[0].message);
                    }
                }
            }else if (status === "INCOMPLETE") {
                alert('No response from server or client is offline.');
            }
        });
        
        
        $A.enqueueAction(action);
        
    }
})