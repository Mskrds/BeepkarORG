({
    tabSelected: function(component, event, helper) {
        var selectedTab = event.getSource().get("v.id");
        alert("You selected " + selectedTab);
        // You can replace the alert with any other custom logic or actions you want.
    }
})