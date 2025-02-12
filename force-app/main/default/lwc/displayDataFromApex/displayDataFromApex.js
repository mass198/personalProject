import { LightningElement, wire } from "lwc";
import { getSObjectValue } from "@salesforce/apex";
import getContactData from "@salesforce/apex/contactdatareturn.getContactData";
import getAccountList from "@salesforce/apex/contactdatareturn.getAccountList";
import Id_field from "@salesforce/schema/Contact.Id";
import Name_field from "@salesforce/schema/Contact.Name";
import Email_field from "@salesforce/schema/Contact.Email";

export default class DisplayDataFromApex extends LightningElement {
  accounts
  @wire(getContactData) Contact;

  get contId() {
    return this.Contact.data
      ? getSObjectValue(this.Contact.data, Id_field)
      : " ";
  }
  get conName() {
    return this.Contact.data
      ? getSObjectValue(this.Contact.data, Name_field)
      : " ";
  }
  get conEmail() {
    return this.Contact.data
      ? getSObjectValue(this.Contact.data, Email_field)
      : " ";
  }

  getlist(){
    getAccountList().then(results=>{this.accounts = results}).catch(error=>{console.error()})
  }
}