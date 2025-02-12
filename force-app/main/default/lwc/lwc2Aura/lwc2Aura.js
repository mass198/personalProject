import { LightningElement, api } from "lwc";

export default class Lwc2Aura extends LightningElement {
  @api title;

  sendhandler() {
    const event = new CustomEvent("sendaura", {
      detail: {
        msg: "This message is from LWC component which has been sent through custom event to Aura"
      }
    });

    this.dispatchEvent(event);
  }
}