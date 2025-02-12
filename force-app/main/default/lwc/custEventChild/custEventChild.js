import { LightningElement } from "lwc";
import LightningModal from "lightning/modal";

export default class CustEventChild extends LightningElement {
  closehandler() {
    const myEve = new CustomEvent("closethemod", {
      detail: "Child closed successfully"
    });
    this.dispatchEvent(myEve);
  }

  disconnectedCallback() {
    alert("child component disconnected");
  }
}