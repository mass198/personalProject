import { LightningElement } from "lwc";

export default class ChildLifeCycle extends LightningElement {
  name = "mass";
  constructor() {
    super();
    console.log("This is child constructor");
    //console.log(`This is child cons${this.name}`);
  }

  connectedCallback() {
    console.log("This is child connectedCallback");
    //console.log(`This is child conncall${this.name}`);
  }

  renderedCallback() {
    console.log("This is child renderedCallback");
  }

  disconnectedCallback() {
    alert("child component disconnected");
  }
}