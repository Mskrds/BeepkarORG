({
	dosave : function(component, event, helper) {
		var action = component.get("c.CreateContact");
       // var contactlist = component.get("v.contactobj")
        action.setparams({'contactobj':Component.get('v.contactobj')});
        action.setCallback(this,function(result){
            component.set('v.contactId',false); 
            var conid = result.getReturnValue();
            //contactlist.Splice(0,0,component.get('v.contactobj'));
            alert("conid"+conid);
           // component.set("v.contactlist",contactlist);
        });
        $A.enqueueAction(action);
	}
   
})