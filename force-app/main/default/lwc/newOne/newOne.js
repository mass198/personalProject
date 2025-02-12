import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

import Contact_OBJECT from '@salesforce/schema/Contact';
import FIRST_NAME_FIELD from '@salesforce/schema/Contact.FirstName';
import LAST_NAME_FIELD from '@salesforce/schema/Contact.LastName';
import EMAIL_FIELD from '@salesforce/schema/Contact.Email';
import ACCOUNT_LOOKUP_FIELD from '@salesforce/schema/Contact.AccountId';
/**
 * Creates SObject records.
 */
export default class newOne extends LightningElement {
    a_SObject_Variable  = Contact_OBJECT;
    l_Fields_Variable = [FIRST_NAME_FIELD, LAST_NAME_FIELD , EMAIL_FIELD, ACCOUNT_LOOKUP_FIELD];
    call_this(){
        // Run code when account is created.
            const event = new ShowToastEvent({
                title: 'Success',
                message:
                    'Account is successfully created.',
            });
            this.dispatchEvent(event);
    }
}