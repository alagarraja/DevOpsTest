({
    handleCancel : function(component, event, helper) {
        //closes the modal or popover from the component
        component.find("overlayLib").notifyClose();
    },
    handleOK : function(component, event, helper) {
        alert('Click Ok !!!');
        component.find("overlayLib").notifyClose();
        //do something
    }
})