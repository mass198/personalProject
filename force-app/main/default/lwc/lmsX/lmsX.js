import { LightningElement, wire } from "lwc";
import firstchannel from "@salesforce/messageChannel/first__c";
import { publish, MessageContext } from "lightning/messageService";

export default class LmsX extends LightningElement {
  inputValue;
  @wire(MessageContext)
  context;

  callhandler(event) {
    this.inputValue = event.target.value;
  }

  publishmessagehandler() {
    const message = { lmsData: { value: this.inputValue } };
    publish(this.context, firstchannel, message);
  }
}