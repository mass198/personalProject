import { LightningElement } from 'lwc';

export default class ParToChiComp extends LightningElement {
    recvalue

    recievedvalue(event) {
        this.recvalue = event.detail
    }
}