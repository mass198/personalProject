import { LightningElement, api, wire } from "lwc";
import { getRecord, getFieldValue } from "lightning/uiRecordApi";
import PHONE_FIELD from "@salesforce/schema/Account.Phone";
import sendMsg from "@salesforce/apex/whatsappController.sendMessage";
import { ShowToastEvent } from "lightning/platformShowToastEvent";

const fields = [PHONE_FIELD];

export default class WhatsappLauncher extends LightningElement {
  @api recordId;

  whatsappMsg = "";
  phoneNumber = "";
  samplePhone = "118778007981747";
  accessKey =
    "EAAEF8Jc1HZAQBO9VQ0nxGtw18WL0PFZCuZC6EqY1xiXOnDmxCUKPzrggyFSuIhyVpgazJwqdZBGYsLa0n7eBLOrTtjf7K65JK7wn7Dcx6n5mSOSuSQi1vrymuSX4yGc5kCli8A4SSMMZAOtfxZCGK5OIlozZA8bdIS8gizCJXyP9IRXWb2SoB3sDcRa2x7YZAVfZCQURxOoG0vjbF71fZCGVwZD";
  _title = "Sample Title";
  message = "Sample Message";
  variant = "error";
  variantOptions = [
    { label: "error", value: "error" },
    { label: "warning", value: "warning" },
    { label: "success", value: "success" },
    { label: "info", value: "info" }
  ];

  @wire(getRecord, { recordId: "$recordId", fields })
  account;

  get getphone() {
    return (this.phoneNumber = this.account.data
      ? getFieldValue(this.account.data, PHONE_FIELD)
      : "");
    // this.phoneNumber = getFieldValue(this.account.data, PHONE_FIELD);
    // return getFieldValue(this.account.data, PHONE_FIELD);
    console.log(this.phoneNumber);
  }

  sendMessage() {
    sendMsg({
      message: this.whatsappMsg,
      phoneNumber: this.phoneNumber,
      accessKey: this.accessKey,
      samplePhone: this.samplePhone
    }).then((result) => {
      console.log("Final Response ==> " + result);
      console.log(this.phoneNumber);

      if (result == "Success") {
        this._title = "Success";
        this.message = "Message Sent Successfully..!";
        this.variant = "success";
        this.showNotification();
        this.clearField();
      } else {
        this._title = "Error";
        this.message = "Message Sent Failed..!";
        this.variant = "error";
        this.showNotification();
        this.clearField();
      }
    });
  }

  showNotification() {
    const evt = new ShowToastEvent({
      title: this._title,
      message: this.message,
      variant: this.variant
    });
    this.dispatchEvent(evt);
  }

  clearField() {
    this.whatsappMsg = "";
    this.phoneNumber = "";
  }

  onWhatsappMsg(event) {
    this.whatsappMsg = event.target.value;
  }
}