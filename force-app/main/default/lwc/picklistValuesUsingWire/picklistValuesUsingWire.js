import { LightningElement, wire } from 'lwc';
import { getPicklistValues, getObjectInfo } from 'lightning/uiObjectInfoApi';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ACCOUNT_OBJ from '@salesforce/schema/Account';

export default class PicklistValuesUsingWire extends LightningElement {
    IndustryOptions = []
    selectvalue

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJ }) getthepicklistId


    @wire(getPicklistValues, { recordTypeId: '$getthepicklistId.data.defaultRecordTypeId', fieldApiName: INDUSTRY_FIELD })
    getpickValue({ data, error }) {
        if (data) {
            this.IndustryOptions = [...this.generatepicklist(data)]
            console.log(data)
        } if (error) {
            console.error(error)
        }
    }




    generatepicklist(data) {
        return data.values.map(item => ({ label: item.label, value: item.value }))
    }

    handleChange(event) {
        this.selectvalue = event.detail.value;
    }


}