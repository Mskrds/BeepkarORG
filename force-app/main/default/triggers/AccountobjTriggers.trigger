trigger AccountobjTriggers on Account (before insert,After insert,After update,after Delete) {
/* if(trigger.isinsert && trigger.isafter){
        ConvertingFlowstoTriggerhandlerclass.Createcon(trigger.new);
    }*/
  /*  if(trigger.isinsert && trigger.isbefore){
        TriggerAssignHandlerClasses.accBillindShippingaddress(trigger.new);
        
} */
   /*if(trigger.isinsert && trigger.isafter){
        TriggerAssignHandlerClasses.Createconwhenaccreated(trigger.new); 
    
}*/
    /* if(trigger.isInsert && trigger.isafter){
        TriggerAssignHandlerClasses.SendEmailToAccUser(trigger.new);
    }*/
 /*  if(trigger.isupdate && trigger.isafter){
        TriggerAssignHandlerClasses.AccBillCityUpdateonCon(trigger.new,trigger.oldmap); 
} */
    
   /* if(trigger.isupdate && trigger.isafter){
        TriggerAssignHandlerClasses.SendemailWhenAccTypeupdated(trigger.new,trigger.oldmap);
} */
   /* if(trigger.isupdate && trigger.isafter){
    TriggerAssignHandlerClasses.PopulateoppstageName(trigger.new,trigger.oldmap);
    } */
  
     /* if(trigger.isInsert && trigger.isafter){
        TriggerAssignHandlerClasses.countofaccounts(trigger.new);  
    }       
    if(trigger.isdelete && trigger.isafter){
        TriggerAssignHandlerClasses.countofaccounts(trigger.old);
    }*/
}