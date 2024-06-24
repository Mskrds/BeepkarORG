({
	dosave : function(component, event, helper) {
		var action = component.get("c.CreateContact");
       // var contactlist = component.get("v.contactobj")
        action.setParams({'contactobj':component.get('v.contactobj')});
        action.setCallback(this,function(result){
            var conid = result.getReturnValue();
            component.set('v.contactId',conid);
            //contactlist.Splice(0,0,component.get('v.contactobj'));
            alert("Contact recors is successfully Created"+conid);
           // component.set("v.contactlist",contactlist);
        });
        $A.enqueueAction(action);
	}
   
})