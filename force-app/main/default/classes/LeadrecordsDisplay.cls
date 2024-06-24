//Show the list of Lead records into Table
public class LeadrecordsDisplay {
@AuraEnabled
public static list<Lead> getleadrecords(){
list<lead> ledlist = [select Id, Name,Company,Status From Lead limit 6];
return ledlist;
}
}