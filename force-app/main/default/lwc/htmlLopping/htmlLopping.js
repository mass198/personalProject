import { LightningElement } from "lwc";

export default class HtmlLopping extends LightningElement {
  companylist = ["amazon", "facebook", "google", "salesforce"];

  comp = [
    { id: 1, cname: "amazon", location: "Hyderabad" },
    { id: 2, cname: "facebook", location: "pune" },
    { id: 3, cname: "google", location: "gaurogan" },
    { id: 4, cname: "salesforce", location: "US" }
  ];
}