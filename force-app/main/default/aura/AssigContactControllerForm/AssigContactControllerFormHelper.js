// ContactFormHelper.js
({
    isValidEmail:function(email) {
       
        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
        return emailRegex.test(email);
    },

    isValidPhone: function(phone) {
        
        var phoneRegex = /^\d{10}$/; // Assuming a 10-digit phone number
        return phoneRegex.test(phone);
    }
})