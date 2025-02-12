import { LightningElement } from 'lwc';

export default class Jstohtml_component extends LightningElement {
    fullname= 'Phanindra Marupaka';
    changeNamehandler(event)
    {
        this.fullname= 'Phani 23'; 
    }
}