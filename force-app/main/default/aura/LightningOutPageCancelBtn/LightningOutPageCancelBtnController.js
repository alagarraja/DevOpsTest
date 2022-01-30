({
	onCancel : function(component, event, helper) {
 		alert(component.get('v.recordId'));
                
       // window.location ='/0011t000006DyCMAA0';
       
        var event = $A.get('e.force:navigateToObjectHome');

        event.setParams({
            scope: 'Contact'
        });
        
        event.fire();
       
    }
    
})