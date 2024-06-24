trigger AssestObjecTrigger on Asset (After update) {
    
/*  if(trigger.isupdate && trigger.isafter){
    TriggerAssignHandlerClasses.UpdateAssetMinimumExpirationDate(trigger.new);
    } */
     if(trigger.isinsert && trigger.isafter){
    TriggerAssignHandlerClasses.createoppandoppOLI(trigger.new);
    
}
}