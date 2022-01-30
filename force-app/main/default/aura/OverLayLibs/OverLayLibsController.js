({
    	
	handleShowModalFooter : function (component, event, helper) {
        var modalBody;
        var modalFooter;
        $A.createComponents([
                ["c:ModalContent",{}],
                ["c:modalFooter",{}]
            ],
            function(components, status){
                if (status === "SUCCESS") {
                    modalBody = components[0];
                    modalFooter = components[1];
                    component.find('overlayLib').showCustomModal({
                       header: "Application Confirmation",
                       body: modalBody, 
                       footer: modalFooter,
                       showCloseButton: true,
                       cssClass: "popoverclass",
                       closeCallback: function() {
                      
                       }
                   })
                }
            }
       );
	}
})