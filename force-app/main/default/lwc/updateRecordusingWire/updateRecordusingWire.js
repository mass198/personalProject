import { LightningElement, wire } from "lwc";
import { getListUi } from "lightning/uiListApi";
import CONTACT_OBJ from "@salesforce/schema/Contact";
import { updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
const COLS = [
  { label: "Id", fieldName: "Id" },
  { label: "Name", fieldName: "Name" },
  { label: "Email", fieldName: "Email", editable: true },
  { label: "Phone", fieldName: "Phone", editable: true },
  { label: "Title", fieldName: "Title", editable: true }
];
export default class UpdateRecordusingWire extends LightningElement {
  contacts = [];
  columns = COLS;
  draftValues = [];
  @wire(getListUi, {
    objectApiName: CONTACT_OBJ,
    listViewApiName: "AllContacts",
    pageSize: 10
  })
  listout({ data, error }) {
    if (data) {
      console.log(data);
      this.contacts = data.records.records.map((item) => {
        return {
          Name: this.getValue(item, "Name"),
          Id: this.getValue(item, "Id"),
          Email: this.getValue(item, "Email"),
          Phone: this.getValue(item, "Phone"),
          Title: this.getValue(item, "Title")
        };
      });
    }
    if (error) {
      console.error(error);
    }
  }

  //updateRecord(recordInput: Record, clientOptions?: Object): Promise<Record>

  getValue(data, field) {
    return data.fields[field].value;
  }

  handleSave(event) {
    const recordInputs = event.detail.draftValues.map((draft) => {
      const fields = { ...draft };
      return { fields: fields };
    });
    const promises = recordInputs.map((recordInput) =>
      updateRecord(recordInput)
    );
    Promise.all(promises)
      .then((result) => {
        this.toastevent("Success", "Record Updated Succesfully", "success");
        this.draftValues = [];
      })
      .catch((error) => {
        this.toastevent(
          "Failed",
          `there is an error ${error.body.message}`,
          "error"
        );
      });
  }

  toastevent(title, message, variant) {
    const neweve = new ShowToastEvent({
      title,
      message,
      variant
    });
    this.dispatchEvent(neweve);
  }
}