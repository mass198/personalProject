import { LightningElement } from "lwc";

export default class ParentLifeCycle extends LightningElement {
  name = "naveen";
  isVisible = false;

  constructor() {
    super();
    console.log("This is parent constructor");
    this.name = "update";
    console.log(`This is parent cons${this.name}`);
  }

  connectedCallback() {
    console.log("This is parent connectedCallback");
    this.name = "update";
    console.log(`This is parent conncall${this.name}`);
  }

  showComponentHandler() {
    this.isVisible = !this.isVisible;
  }

  renderedCallback() {
    console.log("This is parent renderedCallback");
  }
}