// ContactEditFormHelper.js
({
    isValidEmail: function(email) {
        // Basic Email format validation
        var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailRegex.test(email);
    },

    isValidPhone: function(phone) {
        // Basic Phone format validation (numeric characters only)
        var phoneRegex = /^[0-9]+$/;
        return phoneRegex.test(phone);
    },
})