import { LightningElement, api } from 'lwc';
import {showToastEvent} from 'lightning/platformShowToastEvent';

import Name_Field from '@salesforce/schema/Lead.Name';
import Status_Field from '@salesforce/schema/Lead.Status';
import Company_Field from '@salesforce/schema/Lead.Company';




export default class GetDetailsofPen extends LightningElement {


    @api recordId;
    @api objectApiName;

    Fields=[Name_Field, Status_Field, Company_Field];


    handlesubmit(event){
        const evt = new showToastEvent({
                title: 'Voila',
                message:  'Account Successfully Created',
                variant: 'success',

        });

        this.dispatchEvent(evt);
    }

}