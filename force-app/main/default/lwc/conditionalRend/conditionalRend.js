import { LightningElement } from "lwc";

export default class ConditionalRend extends LightningElement {
  showVisible = false;
  input;

  changetotrue() {
    this.showVisible = true;
  }
  get inputValue() {
    return this.input === "Hello";
  }

  changetofalse(event) {
    this.input = event.target.value;
    if (this.input === "Hello") {
      this.showVisible = false;
      console.log("here");
    }
  }
}