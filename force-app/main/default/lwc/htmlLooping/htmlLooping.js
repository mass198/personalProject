import { LightningElement } from "lwc";

export default class HtmlLooping extends LightningElement {
  arr1 = ["apple", "ball", "cat", "dog", "elephant"];

  listofcompanies = [
    {
      id: 1,
      name: "salesforce",
      place: "hyderabad"
    },
    {
      id: 2,
      name: "Amazon",
      place: "US"
    },
    {
      id: 3,
      name: "flipkart",
      place: "Canada"
    },
    {
      id: 4,
      name: "Walmart",
      place: "Europe"
    }
  ];
}