@isTest
public class LeaveRequestTriggerTest {

    @isTest
    static void testManagerCommentsUpdate() {

        Employee__c emp = new Employee__c(
            Name = 'Rahul',
            Employee_ID__c = 'EMP001',
            Email__c = 'rahul@test.com',
            Department__c = 'IT',
            Designation__c = 'Developer',
            Status__c = 'Active'
        );
        insert emp;

        Leave_Request__c leave = new Leave_Request__c(
            Employee__c = emp.Id,
            Leave_Type__c = 'Casual Leave',
            From_Date__c = Date.today().addDays(1),
            To_Date__c = Date.today().addDays(2),
            Status__c = 'Pending'
        );
        insert leave;

        Test.startTest();

        leave.Status__c = 'Approved';
        update leave;

        Test.stopTest();

        Leave_Request__c updatedLeave = [
            SELECT Manager_Comments__c
            FROM Leave_Request__c
            WHERE Id = :leave.Id
        ];

        System.assertEquals(
            'Leave approved successfully.',
            updatedLeave.Manager_Comments__c
        );
    }
}
