import { LightningElement, api } from "lwc";

export default class ChiToParComp extends LightningElement {
  @api studentName;
  @api age;

  sendfromchild = "here is the news";

  sendevent(event) {
    const eve = new CustomEvent("sendmessage", { detail: this.sendfromchild });
    this.dispatchEvent(eve);
  }
}