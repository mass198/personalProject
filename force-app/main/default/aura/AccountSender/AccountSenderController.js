({
    sendAccount : function(component, event, helper) {
        var account = {
            'Name': 'Acme Corporation',
            'Industry': 'Manufacturing',
            'Phone': '(555) 555-1212'
        };
        console.log('account---'+account);
        var accountFired = component.getEvent("accountFired");
        accountFired.setParams({
            "account": account
        });
          console.log('accountFired---'+accountFired);
        $A.get("e.c:AccountFired");
        accountFired.fire();
                  console.log('accountFired.fire---'+ accountFired.fire());

        
    }
})