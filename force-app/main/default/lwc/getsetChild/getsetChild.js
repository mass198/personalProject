import { LightningElement, api } from "lwc";

export default class GetsetChild extends LightningElement {
  userDetails;

  @api
  get detail() {
    return this.userDetails;
    console.log(`detail ${this.detail}`);
    console.log(`Ud  ${this.userDetails}`);
  }

  set detail(data) {
    let newAge = data.Age * 2;
    this.userDetails = { ...data, Age: newAge, location: "Hyd" };
  }
}