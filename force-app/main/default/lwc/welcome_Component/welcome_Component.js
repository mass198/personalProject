import { LightningElement } from 'lwc';

export default class Welcome_Component extends LightningElement {
    letterhandler(event) {

        var VarValueWeGotFromHTML= event.target.value;
        alert('You have Entered a Letter  ' + VarValueWeGotFromHTML);
    }
}