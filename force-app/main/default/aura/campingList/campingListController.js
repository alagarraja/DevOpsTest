({
	myAction : function(component, event, helper) {
		
        var action = component.get("c.getCamping");
       /* action.setParams({
            recordId: component.get("v.recordId")
        });*/
        action.setCallback(this, function(data) {
            component.set("v.CampingList", data.getReturnValue());
        });
        $A.enqueueAction(action);

	}
})