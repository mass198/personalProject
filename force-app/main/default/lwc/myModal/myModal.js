import { api } from "lwc";
import LightningModal from "lightning/modal";

export default class MyModal extends LightningModal {
  @api content;

  handleOkay() {
    this.close("okay");
  }
  dispatchSelectEvent(e) {
    // e.target might represent an input with an id and value
    const { id, value } = e.target;
    const selectEvent = new CustomEvent("select", {
      detail: { id, value }
    });
    this.dispatchEvent(selectEvent);
  }
}