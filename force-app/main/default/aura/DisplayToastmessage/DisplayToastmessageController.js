({
	Toastbuttom : function(component, event, helper) {
		
        var dip = $A.get("e.force:showToast");
        dip.setParams({
            title:'Toast Message',
            message:'13. custom toast component that displays temporary messages or notifications to users.',
            type : 'Info',
            duration:5000,
            mode:'dismissible'
        });
        dip.fire();
	}
})