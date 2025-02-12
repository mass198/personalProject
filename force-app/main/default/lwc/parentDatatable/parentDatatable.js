import LightningDatatable from "lightning/datatable";

import customButton from "./customButton.html";

export default class ParentDatatable extends LightningDatatable {
  static customTypes = {
    customButton: {
      template: customButton,
      typeAttributes: ["selected", "id", "type", "rules", "multiselectable"]
    }
  };
}