trigger DuplicateLeadEmail on Lead (before insert) {

    Set <String> emailSet = new Set<String>(); 
    for (Lead ld:trigger.new) {
        emailSet.add(ld.email);  
    }
    List <Lead>AllLeads = new List<Lead>();
    AllLeads = [SELECT email FROM Lead WHERE email IN :emailSet];
    for (Lead con:trigger.new) {
        If (AllLeads.size() > 0) {
            // Display the error on email field
            con.email.adderror( 'Duplicate Lead Found..' );
        }
    }

}