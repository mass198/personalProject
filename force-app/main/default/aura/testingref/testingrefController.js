({
	onloading: function(component, event, helper) {
    try {
        let changeType = event.getParams().changeType;
        if (changeType === "ERROR") {
             console.log('Error during record data loading:', event.getParams().error);
            // ... your existing LOADED logic ...
        } else if (changeType === "ERROR") {
            console.error('Error during record data loading:', event.getParams().error);
            // You can add additional error handling here if needed
        }
    } catch (error) {
        console.error('Unexpected error:', error);
    }
}


})