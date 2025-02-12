import { LightningElement, track } from "lwc";
import { createRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

export default class CreateRecord extends LightningElement {
  @track accountName;
  @track accountPhone;
  @track accountWebsite;

  accountNameChangeHandler(event) {
    this.accountName = event.target.value;
  }

  accountPhoneChangeHandler(event) {
    this.accountPhone = event.target.value;
  }

  accountWebsiteChangeHandler(event) {
    this.accountWebsite = event.target.value;
  }

  createAccount() {
    const fields = {
      Name: this.accountName,
      Phone: this.accountPhone,
      Website: this.accountWebsite
    };
    const recordInput = { apiName: "Account", fields };

    createRecord(recordInput)
      .then((response) => {
        console.log("Account has been created : ", response.id);
        const event = new ShowToastEvent({
          title: "Success",
          variant: "error",
          //  message:'Account is successfully created.',
          message: error.body.message
        });
        this.dispatchEvent(event);
      })
      .catch((error) => {
        console.error("Error in creating account : ", error.body.message);
        const event = new ShowToastEvent({
          title: "error",
          variant: "error",
          // message: "Error in creating account"
          message: error.body.message
        });
        this.dispatchEvent(event);
      });
  }
  call_this() {
    // Run code when account is created.
    console.error("gvvhgjvvcyfcf");

    const event = new ShowToastEvent({
      title: "Success",
      variant: "success",
      //   message: "Account is successfully created."
      message: error.body.message
    });
    this.dispatchEvent(event);
  }
}