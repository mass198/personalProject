import { LightningElement } from 'lwc';

export default class ShowandHideform extends LightningElement {

    booleanflagvalue = false;

    showformhandler(){
        this.booleanflagvalue=true;
    }

    hideformhandler(){
        this.booleanflagvalue=false;
    }


}