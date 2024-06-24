({
	doaction : function(component, event, helper) {
		var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");
        
        //is input Numberic?
        if(isNaN(value)){
            inputCmp.set("v.errors",
                [{message:"Input not a number"+value}]);    
        }else{
            inputCmp.set("v.errors",null);
        }
        }
	}
)