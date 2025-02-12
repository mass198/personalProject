import { LightningElement, track } from 'lwc';

export default class Bankloanintrest_Component extends LightningElement {
    @track loanresult;
    @track principal;
    @track noOfYears;
    @track rateOfInterest;

    principalChangeHandler(event) {
        this.principal = parseInt(event.target.value);
        // console.log(parseInt(event.target.value));
    }
    durationChangeHandler(event) {
        this.noOfYears = parseInt(event.target.value);
    }
    rateChangeHandler(event) {
        this.rateOfInterest = parseInt(event.target.value);
    }
    calculateloanamountHandler() {
        this.loanresult = ' The Loan Intrest for the given period is = ' + (this.principal * this.rateOfInterest * this.noOfYears) / 100;
    }
}