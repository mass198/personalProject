import { LightningElement } from "lwc";
import pubsub from "c/pubsub";
export default class PubComp extends LightningElement {
  message;

  callhandler(event) {
    this.message = event.target.value;
  }

  publishEventhandler() {
    pubsub.publish("sendthis", this.message);
  }
}