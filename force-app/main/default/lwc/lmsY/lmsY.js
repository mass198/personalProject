import { LightningElement, wire } from "lwc";
import firstchannel from "@salesforce/messageChannel/first__c";
import {
  subscribe,
  MessageContext,
  unsubscribe,
  APPLICATION_SCOPE
} from "lightning/messageService";

export default class LmsY extends LightningElement {
  subscription;
  recMessage;
  @wire(MessageContext)
  context;

  connectedCallback() {
    this.subevent();
  }

  subevent() {
    this.subscription = subscribe(
      this.context,
      firstchannel,
      (message) => {
        this.handleMessage(message);
      },
      { scope: APPLICATION_SCOPE }
    );
  }

  handleMessage(message) {
    this.recMessage = message.lmsData.value
      ? message.lmsData.value
      : "message not found";
  }

  unsub() {
    unsubscribe(this.subscription);

    this.subscription = null;

    const checkbtn = this.template.querySelector(".slds-hide");
    checkbtn.classList.remove("slds-hide");

    const addbtn = this.template.querySelector(".hidenow");
    addbtn.classList.add("slds-hide");
  }
  resub() {
    this.subevent();
    const addbtn = this.template.querySelector(".hidenow");
    addbtn.classList.remove("slds-hide");

    const checkbtn = this.template.querySelector(".second");
    checkbtn.classList.add("slds-hide");
  }
}