({
	doInit : function(component, event, helper) {
		
        var recordId = component.get('v.recordId');
        window.open('/apex/GISMap?id=' + recordId,'_blank');
        $A.get("e.force:closeQuickAction").fire();
    }
})