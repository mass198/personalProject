import { LightningElement, track } from 'lwc';

export default class NewComponent extends LightningElement {

    @track result;
    num1;
    num2;

    onInputChangeHandler(event) {
        const name = event.target.name;
        if (name === 'Number1') {
            this.num1 = event.target.value;
        } else if (name === 'Number2') {
            this.num2 = event.target.value;
        }
    }

    onButtonCLick(event) {
        var operation = event.target.label;
        if (!isNaN(this.num1) && !isNaN(this.num2)) {
            const numb1 = parseInt(this.num1, 10);
            const numb2 = parseInt(this.num2, 10);
            var PrintResult = 0;
            if (operation === 'Add') {
                PrintResult = (numb1 + numb2);
            } else if (operation === 'Subtract') {
                PrintResult = `${numb1 - numb2}`;
            } else if (operation === 'Multiply') {
                PrintResult = `${numb1 * numb2}`;
            } else if (operation === 'Divide') {
                PrintResult = `${numb1 / numb2}`;
            }
            if (PrintResult !== null && PrintResult !== '' && PrintResult !== undefined && !isNaN(PrintResult)) {
                this.result = PrintResult;
            }
        }
    }
}