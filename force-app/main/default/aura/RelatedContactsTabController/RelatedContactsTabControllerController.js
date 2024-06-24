// MessageTabController.js
({
    doInit: function (component, event, helper) {
        // Fetch messages or perform any initialization logic
        helper.fetchMessages(component);
    },

    handleTabActivate: function (component, event, helper) {
        // Display a message when the tab is selected
        component.set("v.selectedTabMessage", "Tab is selected!");
    }
})