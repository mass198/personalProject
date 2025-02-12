import { LightningElement, wire } from "lwc";
import { refreshApex } from "@salesforce/apex";
import getContactData from "@salesforce/apex/contactdatareturn.getContactData";
import LightningAlert from "lightning/alert";

export default class lightalert extends LightningElement {
  spinnerActive;
  lsgOppId;
  oppLSGRecId;
  quoteProductRecords = [];
  @wire(getContactData) returnedContacts;
  handleAlertClick() {
    LightningAlert.open({
      message: "this is the alert message",
      theme: "error", // a red theme intended for error states
      label: "Error!" // this is the header text
    });
    //Alert has been closed
  }

  handleSave() {
    this.spinnerActive = true;
    insertOpportunityProducts({
      quoteProductRecords: this.template
        .querySelector("lightning-button")
        .getSelectedRows(),
      lsgOppId: this.oppLSGRecId
    })
      .then((resultStr) => {
        if (resultStr === "SUCCESS") {
          return updateOpportunityProducts({
            quoteProductRecords: this.template
              .querySelector("lightning-button")
              .getSelectedRows(),
            lsgOppId: this.oppLSGRecId
          });
        } else {
          LightningAlert.open({
            message: "Sync Errored Out! ",
            theme: "error", // a red theme intended for error states
            label: "Error!" // this is the header text
          });
          refreshApex(this.returnedContacts);
        }
      })
      .then((resultStr) => {
        if (resultStr === "SUCCESS") {
          console.log("inside if 128");
          LightningAlert.open({
            message:
              "Sync request sent successfully, Products will be added in a while!",
            theme: "success",
            label: "Success!"
          });
          //
        } else {
          LightningAlert.open({
            message: "Sync Errored Out! " + resultStr,
            theme: "error", // a red theme intended for error states
            label: "Error!" // this is the header text
          });
        }
      })
      .catch((error) => {
        console.log("error" + JSON.stringify(error));
        if (error.body && error.body.message) {
          this.errorMessage = error.body.message;
        }
        if (
          error.body &&
          error.body.pageErrors &&
          error.body.pageErrors[0].message
        ) {
          this.errorMessage = error.body.pageErrors[0].message;
        }
        if (!this.errorMessage)
          this.errorMessage = "Something went wrong ! " + error;
      })
      .finally(() => {
        this.spinnerActive = false;
      });
  }
  refreshView() {
    this.spinnerActive = true;
    refreshApex(this.returnedContacts);
  }
}