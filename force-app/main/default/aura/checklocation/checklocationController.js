// CheckInLocationController.js
({
    init: function(component, event, helper) {
        // Perform initialization
        // For example, you can check the user's location and set the check-in option accordingly
        // Here, we're assuming that the user is working from home by default
        component.set("v.checkInOption", "Working from Home");
    },
    
    checkIn: function(component, event, helper) {
        // Perform check-in logic
        // For example, you can use a geolocation API to get the user's location
        // and take appropriate action based on the selected check-in option
        
        // In this example, we're simply displaying an alert with the check-in details
        alert("Checked in as: " + component.get("v.checkInOption"));
    }
})