import { LightningElement } from 'lwc';

export default class Paitent_form extends LightningElement {

        booleanflagvalue = false;

        showformhandler(){

            this.booleanflagvaue = true;
        }

        hideformhandler(){

            this.booleanflagvalue = false;

        }
}