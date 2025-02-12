import { LightningElement } from 'lwc';
import getAccountusingNames from "@salesforce/apex/contactdatareturn.getAccountusingNames"
export default class Welcomecomponent extends LightningElement {
    searchKey = ''
    timer
    accounts
    msg

    connectedCallback() {
        this.addEventListener("closethemod", this.handleevent.bind(this))
    }

    handleevent(event) {
        this.msg = event.detail.message;
    }
    callwire(event) {
        window.clearTimeout(this.timer)
        this.searchKey = event.target.value;
        this.timer = setTimeout(() => { this.callit() }, 2000);
    }

    callit() {
        getAccountusingNames({ searchKey: this.searchKey }).then(results => { this.accounts = results }).catch(error => { console.log(error) })
    }



}