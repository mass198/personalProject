import { LightningElement } from "lwc";

const columns = [
  { label: "Label", fieldName: "name" },
  { label: "Website", fieldName: "website", type: "url" },
  { label: "Phone", fieldName: "phone", type: "phone" },
  { label: "Balance", fieldName: "amount", type: "currency" },
  { label: "CloseAt", fieldName: "closeAt", type: "date" },
  {
    type: "customButton",
    typeAttributes: {
      iconName: "utility:edit",
      label: "Edit",
      name: "editRecord",
      title: "editTitle",
      disabled: false,
      value: "test"
    }
  }
];

export default class ParentDatatableContainer extends LightningElement {
  data = [];
  columns = columns;

  connectedCallback() {
    const data = this.generateData({ amountOfRecords: 5 });
    this.data = data;
  }

  errorCallback(error, stack) {
    console.error("ParentDatatableContainer.html", error?.message, stack);
  }

  generateData({ amountOfRecords }) {
    return [...Array(amountOfRecords)].map((_, index) => {
      return {
        name: `Name (${index})`,
        website: "www.salesforce.com",
        amount: Math.floor(Math.random() * 100),
        phone: `${Math.floor(Math.random() * 9000000000) + 1000000000}`,
        closeAt: new Date(Date.now() + 86400000 * Math.ceil(Math.random() * 20))
      };
    });
  }
}