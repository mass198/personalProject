import { LightningElement, track, wire } from 'lwc';
import getRandomRecipe from '@salesforce/apex/Spoonacular.getRandomRecipe';
export default class Calloutcomponent extends LightningElement {
    @track response
    @track errormsg
    @track statusCode


    async makeCallout() {
        try {
            const result = await getRandomRecipe();
            console.log('Response:', result); // Log the response
            this.response = JSON.stringify(result.slice(0, 200));
            this.statusCode = result.statusCode;
            this.errormsg = undefined; // Reset error message if callout succeeds
        } catch (error) {
            console.error('Error:', error); // Log the error
            this.response = undefined; // Reset response if error occurs
            this.errormsg = error.body.message;
            this.statusCode = result.statusCode; // Assign error message
        }
    }
}