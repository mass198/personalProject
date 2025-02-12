({
    handleAccount : function(component, event, helper) {
        var account = event.getParam("account");
        component.set("v.account", account);
    }
})