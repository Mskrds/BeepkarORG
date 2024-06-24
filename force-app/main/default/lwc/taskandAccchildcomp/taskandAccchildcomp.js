import { LightningElement,api,track,wire} from 'lwc';
import getTasksByAccountId from '@salesforce/apex/PastWeekTasksAndEventsController.getTasksByAccountId';
import getStatuspicklistvalues from '@salesforce/apex/PastWeekTasksAndEventsController.getStatuspicklistvalues';
import updateTasks from '@salesforce/apex/PastWeekTasksAndEventsController.updateTasks';
export default class taskandAccchildcomp extends LightningElement {

    @api recordId;
    @track tasks=[];
    @track newtaskList =[];
    @track statusval=[];
    countlength;

      //@wire decorator to asynchronously fetch picklist values for the Status field. 
    @wire(getStatuspicklistvalues)
    wiredgetStateOptions({ data, error }) {
        debugger;
        if (data) {
            debugger;
            console.log('data===>' + data);
            this.statusval = [];         // Initializes an empty array
            for (let i = 0; i < data.length; i++) {
                this.statusval.push({
                    label: data[i],
                    value: data[i]
                });
            }
            console.log('statusval===>' + this.statusval); 
        } else if (error) {
            console.error('Error fetching statusvalues.....', error);
        }
    }

    connectedCallback(){
        debugger;
        setTimeout(() =>{
            console.log('recordId===>'+ this.recordId);
            getTasksByAccountId({accId : this.recordId }).then((result) => {
                this.tasks = result;
                let index = 0;        //used to keep track of a counter,
                let tempList = [];
                 for(var i=0;i<result.length;i++){
                     index +=1;
                     let temoObj = {          //creates a temporary object
                         Id : result[i].Id,
                         Subject : result[i].Subject,
                         Description : result[i].Description,
                         Status : result[i].Status,
                         sno : index,
                         selected:false
                         
                     };
                     tempList.push(temoObj);   //adding into array
                 }
                 this.newtaskList = tempList; //
            }).catch((err) => {
                console.error('Error retrieving contacts:', err);
            });
        },100);

    }

    handlechangeNew(event){
        debugger;
        
        const index = event.target.dataset.index;  //represents the position of the input field in the task list.
        const field = event.target.dataset.field;  //represents the property of the task object being modified ("Status").
        const value = event.target.value;

        if (this.newtaskList.length >= index) {  // checking items are available
            this.newtaskList[index][field] = value; //finds the task at the specified index and updates the property (e.g., "1" "Status" ="Completed") with the new value.
        }

    }

    handleSave(){
        debugger;
        
         const tasksToUpdate = []; //initializes an empty array, to store information about the tasks that need to be updated.

         this.newtaskList.forEach(existval => {
            if (existval.Id) {
                // Existing record: (it's an existing record). In this case, the task details are added to the tasksToUpdate array.
                tasksToUpdate.push({
                    Id: existval.Id,
                    Subject: existval.Subject,
                    Description: existval.Description,
                    Status: existval.Status,

                });

                console.log('tasksToUpdate===>'+tasksToUpdate);
               
            } 
            else {
                console.log('No Records Found');
                
            }
        });

                var count = 0;
                for(var i=0;i<tasksToUpdate.length;i++){
                   
                    if(tasksToUpdate[i].Status.toLowerCase() === 'completed'){
                        count = count + 1;
                        
                    }
                }
                this.countlength = count;
              

        if (tasksToUpdate.length > 0) {
            console.log('tasksToUpdate===>'+tasksToUpdate);
            updateTasks({ updatet : tasksToUpdate,completedcount: count,accId : this.recordId, })
                .then(result => {
                    console.log('Update Result:', result);
                })
                .catch(error => {
                    console.error('Update Error:', error);
                    

                });
        }
    }
}