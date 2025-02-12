import { LightningElement } from "lwc";

export default class QueriesAll extends LightningElement {
  arr1 = ["karl", "napolean", "hitler", "cheguvera"];
  getValushandler() {
    const divta = this.template.querySelector("h1");
    divta.style.border = "1px solid red";
    divta.style.color = "green";
    console.log(divta.innerHTML);
    const divall = this.template.querySelectorAll("h1");
    Array.from(divall).forEach((item) => {
      console.log(`inner text ${item.innerHTML}`);
    });
    console.log(`array names ${divall}`);
    const pnames = this.template.querySelectorAll(".name");
    Array.from(pnames).forEach((item) => {
      console.log(`This is text ${item.innerText}`);
      item.setAttribute("title", item.innerText);
    });
    const dyn = this.template.querySelector(".tes");
    dyn.innerHTML = "<p>this is from js</p>";
  }
}