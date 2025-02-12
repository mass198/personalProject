import { LightningElement } from "lwc";
import pubsub from "c/pubsub";
export default class SubComp extends LightningElement {
  message;
  spanElement;
  mySpan;

  connectedCallback() {
    this.callthesubscriber();
  }
  callthesubscriber() {
    pubsub.subscribe("sendthis", (message) => {
      this.message = message;
    });
  }

  renderedCallback() {
    const spanElement = this.template.querySelector("span");
    if (spanElement) {
      spanElement.style.color = "blue"; // Apply your desired style
      spanElement.style.fontSize = "16px"; // Apply any other desired styles
    }
  }
}