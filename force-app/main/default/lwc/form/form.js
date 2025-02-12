import { LightningElement } from "lwc";

export default class Form extends LightningElement {
  accountId;
  contactId;
  handleSuccess(event) {
    //    console.log('event:', event);
    this.contactId = event.detail.id;
    alert("Id: " + event.detail.id);
  }
}