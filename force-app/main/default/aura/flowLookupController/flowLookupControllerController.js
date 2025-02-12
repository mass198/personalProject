({
	handleInputKeyUp : function(component, event, helper) {
        try
        {
            var labelField = component.get("v.inpField");
            var extraconditions = component.get("v.extraconditions");
            console.log('extraconditions--->'+ extraconditions);
            var action = component.get("c.getLookupRecords");
            action.setParams({
                obj : component.get("v.object"),
                returnField : component.get("v.inpField"),
                inputField : component.get("v.inpField"),
                inputValue : component.get("v.searchText"),
                extraconditions : component.get("v.extraconditions")
            }); 
            console.log('***extraCondition--->'+extraconditions);
            var res = [];
            action.setCallback(this, function(response){
                var state = response.getState();
                if (state === "SUCCESS") {                  
                    var result = response.getReturnValue();
                    if(!$A.util.isEmpty(result) && !$A.util.isUndefined(result))
                    {
                        for(var key in result)
                        {
                            console.log('Hellooo: '+JSON.stringify(result[key]));
                            res.push({label:result[key][labelField], value:result[key].Id});
                        }
                        component.set("v.searchResult", res); 
                    }    
                }
                else
                {
                    console.log('Controller Calling error - Response State: ' + state)
                }
            });
            $A.enqueueAction(action);   
        }
        catch(e)
        {
            console.log('Exception: ' + e);
        }
	},
    
    handleComboChange : function(component, event, helper) {
		var selectedOptionValue = event.getParam("value");
        component.set("v.resValue", selectedOptionValue);
	}
})