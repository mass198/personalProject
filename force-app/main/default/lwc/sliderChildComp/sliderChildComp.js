import { LightningElement, api } from "lwc";

export default class SliderChildComp extends LightningElement {
  val;

  changeVal(event) {
    this.val = event.target.value;
  }

  @api get newVal() {
    return (this.val = 50);
  }
}