import { LightningElement, track } from "lwc";

export default class TwoWayDataBinding extends LightningElement {
  name = "mass";
  stream = "engineering";

  dyamicchangehandler(event) {
    this.stream = event.target.value;
  }

  offdyamicchangehandler(event) {
    this.name = event.target.value;
  }

  testobj = {
    area: "tn",
    pincode: 505,
    haveid: true
  };

  ontrackhandler(event) {
    this.testobj.area = event.target.value;
  }

  trackhandler(event) {
    this.testobj = { ...this.testobj, area: event.target.value };
  }

  arr1 = ["ajay", "akash", "shekar"];

  num1 = 30;
  num2 = 50;

  get nameofajay() {
    return this.arr1[0];
  }

  get multiplyvalues() {
    return this.num1 * this.num2;
  }
}