import { LightningElement, track } from 'lwc';
import getTokenization from '@salesforce/apex/AmazonPaymentServiceController.getTokenization';

export default class AmazonTokenGeneration extends LightningElement {

    @track cardNumber;
    @track expiryDate;
    @track cardCVV;
    @track token;
    @track error;
    @track cardHolderName;

    handleInput(event) {

        const value = event.target.value;  // Capture the value from the event target
    
        if (event.target.dataset.id === 'cardNumber') {
            this.cardNumber = value;
        } else if (event.target.dataset.id === 'expiryDate') {
            this.expiryDate = value;
        } else if (event.target.dataset.id === 'cardCVV') {
            this.cardCVV = value;
        } else if (event.target.dataset.id === 'cardHolderName') {
            this.cardHolderName = value;
        } 
    /*    const field = event.target.dataset.id;
        if (field) {
            this[field] = event.target.value;
            console.log(`${field} updated to: ${this[field]}`);
*/
    }

    async tokenizeCard() {
        try {
            console.log('Card Number:', this.cardNumber);
        console.log('Expiry Date:', this.expiryDate);
        console.log('Card CVV:', this.cardCVV);
        console.log('Card Holder Name:', this.cardHolderName);
            const response = await getTokenization({
                cardNumber: this.cardNumber,
                cardExpiry: this.expiryDate,
                cardCVV: this.cardCVV,
                cardHolderName: this.cardHolderName
            });
            this.token = JSON.parse(response).token;
            console.log(`response - ${response}`);
        } catch (error) {
            this.error = error.body ? error.body.message : error.message;
        }
    }
}