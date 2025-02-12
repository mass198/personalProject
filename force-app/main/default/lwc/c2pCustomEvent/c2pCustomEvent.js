import { LightningElement } from "lwc";

export default class C2pCustomEvent extends LightningElement {
  showMod = false;
  msg;
  truehandler() {
    this.showMod = true;
  }
  clshndlr(event) {
    this.showMod = false;
    this.msg = event.detail;
  }
}