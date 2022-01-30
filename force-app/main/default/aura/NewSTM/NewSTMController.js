({
    doInit : function(component, event, helper) {
		
        var res = component.get("v.resRecord");
        
        alert('5'+ res);
        component.set("v.resourceId", res.Id);
        component.set("v.resourceName", res.Name);
        component.set("v.checkLoad", true);
	}    
    
})