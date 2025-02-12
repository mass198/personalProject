import { LightningElement, api } from "lwc";

export default class P2cparentComp extends LightningElement {
  perce;
  getcardDetails = [
    {
      src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-01.jpg",
      header: "First Card",
      description: "First card description."
    },

    {
      src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-02.jpg",
      header: "Second Card",
      description: "First card description."
    },

    {
      src: "https://www.lightningdesignsystem.com/assets/images/carousel/carousel-03.jpg",
      header: "Third Card",
      description: "First card description."
    }
  ];

  sendtochild(event) {
    this.perce = event.target.value;
  }
  resetClick() {
    this.template.querySelector("c-slider-child-comp").newVal();
  }
}