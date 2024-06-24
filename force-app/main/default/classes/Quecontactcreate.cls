public class Quecontactcreate implements queueable {
    
    private List<contact>acclist;
    
    Public Quecontactcreate (list<contact>creatrec){
        this.acclist = creatrec;
    }

    public void execute(QueueableContext qcont){
        list<contact>conlist = new list<contact>();
        
        for(contact acc: acclist){
            if(acc.Title!=null){
            acc.Description = 'kk';
            conlist.add(acc);
        }
            }
        if(conlist.size()>0){
            update conlist;
        }
        
        
    }
    
}