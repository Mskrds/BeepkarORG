trigger OPPOApprovalProcess on Opportunity (After update) {
 /*   for(opportunity opp: Trigger.new){
        
        if(opp.Amount<=2000){
            Approval.ProcessSubmitRequest req = new Approval.ProcessSubmitRequest();
            req.setComments('OPPO Amount Approval Process');
            req.setObjectId(opp.Id);
            Approval.ProcessResult approvalResult = Approval.process(req);
            System.debug('OPPO submitted for approval successfully: '+approvalResult .isSuccess());
        }
    }*/
}