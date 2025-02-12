import { LightningElement } from "lwc";
import signuptemplate from "./signup.html";
import signintemplate from "./signin.html";
import rendertemplate from "./renderMethod.html";
export default class RenderMethod extends LightningElement {
  btnclick;

  formhandler(event) {
    this.btnclick = event.target.label;
  }
  render() {
    return this.btnclick === "Sign In"
      ? signintemplate
      : this.btnclick === "Sign Up"
      ? signuptemplate
      : rendertemplate;
  }

  submithandler(event) {
    console.log(`${event.target.label} is success`);
  }
}