import { LightningElement, track, api } from 'lwc';
import getOrders from '@salesforce/apex/SalesOrderController.getOrders';


const columns = [
    // { label: 'Id', fieldName: 'Id', type: 'text', sortable: true},
    { label: 'Amount', fieldName: 'Amount__c', type: 'number'},
    { label: 'Channel', fieldName: 'Channel__c', type: 'text'},
    { label: 'Product Id', fieldName: 'Product_Id__c', type: 'text'},
    { label: 'Transaction Date', fieldName: 'Transaction_DateTime__c', type: 'date'},
];

export default class Orders extends LightningElement {

    accountId = '';
    columns = columns;
    @track ordersList;
    @track errorMsg;
    @api recordId;

    connectedCallback() {
        console.log('Record Id', this.recordId);
        this.accountId = this.recordId;
        this.getData();
    }

    getOrderData(event) {
        this.accountId = this.recordId;
        this.errorMsg = undefined;
    }

    handleSearch() {
        if(!this.accountId) {
            this.errorMsg = 'Please enter an account Id.';
            this.ordersList = undefined;
            return;
        }
        getOrders({accountId : this.accountId})
        .then((result) => {
            this.ordersList = result;
            console.log(this.ordersList)
        })
        .catch((error) => {
            this.ordersList = undefined;
            if(error) {
                this.errorMsg = error.body.message;
            } 
        });         
    }

    getData() {
        getOrders({accountId : this.accountId})
        .then((result) => {
            this.ordersList = result;
            console.log(this.ordersList)
        })
        .catch((error) => {
            this.ordersList = undefined;
            if(error) {
                this.errorMsg = error.body.message;
            } 
        });
    }

}