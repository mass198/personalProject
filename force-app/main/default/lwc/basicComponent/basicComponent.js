import { LightningElement } from 'lwc';
import Pen__OBJ from '@salesforce/schema/Pen__c'
import Name__FIELD from '@salesforce/schema/Pen__c.Name'
import Price__FIELD from '@salesforce/schema/Pen__c.Price__c'
import Quantity__FIELD from '@salesforce/schema/Pen__c.Quantity__c'
import { createRecord } from 'lightning/uiRecordApi';

export default class BasicComponent extends LightningElement {
    name;
    price;
    quantity;
    namechangehandler(event) {
        this.name = event.target.value
    }

    pricechangehandler(event) {
        this.price = event.target.value
    }

    quantitychangehandler(event) {
        this.quantity = event.target.value
    }

    createAccount() {
        console.log('btn clicked')
        const fields = {}
        fields[Name__FIELD.fieldApiName] = this.name, fields[Price__FIELD.fieldApiName] = this.price, fields[Quantity__FIELD.fieldApiName] = this.quantity
        const recordInput = { apiName: "Pen__c", fields }
        createRecord(recordInput).then((response) => console.log('recordsuccesfullycreated')).catch((error) => console.error('error creating record' + (JSON.stringify(error))))
    }
}