import { LightningElement } from "lwc";

const columns = [
  { label: "Label", fieldName: "name" },
  { label: "Website", fieldName: "website", type: "url" },
  { label: "Phone", fieldName: "phone", type: "phone" },
  { label: "Balance", fieldName: "amount", type: "currency" },
  { label: "CloseAt", fieldName: "closeAt", type: "date" }
];

export default class ParentDatatableButton extends LightningElement {
  data;
  isModalVisible = false;

  columns = columns;

  showModal() {
    this.isModalVisible = true;
  }

  showTable() {
    this.data = this.generateData({ amountOfRecords: 5 });
  }

  closeModal() {
    this.isModalVisible = false;
  }

  hideTable() {
    this.data = null;
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