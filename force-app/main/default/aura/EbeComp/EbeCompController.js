({
	callJSONctr : function(component, event, helper) {
		
        alert('method called...');
        var action = component.get("c.parseJson");
		
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                
                component.set('v.wrpObj', response.getReturnValue());
                alert("From Controller: " + response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        alert("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    alert("Unknown error");
                }
            }
        });

        $A.enqueueAction(action);
	}
})