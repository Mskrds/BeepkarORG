// ContactEditFormController.js
({
    handleSubmit: function(component, event, helper) {
        event.preventDefault();
        var fields = event.getParam("fields");
        var email = fields.Email;
        var phone = fields.Phone;

        // Basic Email validation
        if (!helper.isValidEmail(email)) {
            component.find('emailField').setErrorMessages([{ message: 'Invalid Email format' }]);
            return;
        }

        // Basic Phone validation (numeric characters only)
        if (!helper.isValidPhone(phone)) {
            component.find('phoneField').setErrorMessages([{ message: 'Phone should contain only numeric characters' }]);
            return;
        }

        // If validations pass, submit the form
        component.find('recordEditForm').submit(fields);
    },

    

   
})