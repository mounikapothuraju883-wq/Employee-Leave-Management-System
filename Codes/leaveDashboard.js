import { LightningElement, wire } from 'lwc';
import getLeaveRequests from '@salesforce/apex/LeaveDashboardController.getLeaveRequests';

const columns = [
    { label: 'Employee', fieldName: 'employeeName' },
    { label: 'Leave Type', fieldName: 'Leave_Type__c' },
    { label: 'Status', fieldName: 'Status__c' },
    { label: 'From Date', fieldName: 'From_Date__c', type: 'date' },
    { label: 'To Date', fieldName: 'To_Date__c', type: 'date' }
];

export default class LeaveDashboard extends LightningElement {
    columns = columns;
    leaveRequests = [];

    @wire(getLeaveRequests)
    wiredLeaveRequests({ error, data }) {
        if (data) {
            this.leaveRequests = data.map(record => ({
                ...record,
                employeeName: record.Employee__r ? record.Employee__r.Name : ''
            }));
        } else if (error) {
            console.error(error);
        }
    }
}
