import { LightningElement, track } from "lwc";
import getAccount from "@salesforce/apex/waterbottleorg.getAccount";

export default class Waterbittle extends LightningElement {
  @track rspns;
  @track errr;
  @track stats;

  async makecallout() {
    try {
      const result = await getAccount();
      this.rspns = JSON.stringify(result);
      this.stats = result.statusCode;
      this.errormsg = undefined; // Reset error message if callout succeeds
    } catch (error) {
      console.error("Error:", error); // Log the error
      this.rspns = undefined; // Reset response if error occurs
      this.errr = error.body.message;
      this.stats = result.statusCode; // Assign error message
    }
  }
}