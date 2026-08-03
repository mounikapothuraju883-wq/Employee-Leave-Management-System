trigger LeaveRequestTrigger on Leave_Request__c (before update) {

    for (Leave_Request__c lr : Trigger.new) {

        Leave_Request__c oldRecord = Trigger.oldMap.get(lr.Id);

        if (lr.Status__c == 'Approved' &&
            oldRecord.Status__c != 'Approved') {

            lr.Manager_Comments__c = 'Leave approved successfully.';
        }
    }
}
