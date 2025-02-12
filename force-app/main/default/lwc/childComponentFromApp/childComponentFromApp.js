import { LightningElement, api } from 'lwc';

export default class ChildComponentFromApp extends LightningElement {

    @api displaythemessage;
    @api projectcode;
}