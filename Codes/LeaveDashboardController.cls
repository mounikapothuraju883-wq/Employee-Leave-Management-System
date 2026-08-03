public with sharing class LeaveDashboardController {

    @AuraEnabled(cacheable=true)
    public static List<Leave_Request__c> getLeaveRequests() {
        return [
            SELECT Id,
                   Name,
                   Employee__r.Name,
                   Leave_Type__c,
                   Status__c,
                   From_Date__c,
                   To_Date__c
            FROM Leave_Request__c
        ];
    }
}
