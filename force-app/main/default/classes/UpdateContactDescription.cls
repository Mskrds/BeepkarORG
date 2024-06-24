public class UpdateContactDescription implements Queueable {
    private String contactId;
    private String newDescription;

    // Constructor to set the contactId and newDescription
    public UpdateContactDescription(String contactId, String newDescription) {
        this.contactId = contactId;
        this.newDescription = newDescription;
    }

    public void execute(QueueableContext context) {
        // Retrieve the contact record
        Contact contactToUpdate = [SELECT Id, Description FROM Contact WHERE Id = :contactId LIMIT 1];

        // Update the description field
        contactToUpdate.Description = newDescription;

        // Update the contact record
        update contactToUpdate;
    }
}