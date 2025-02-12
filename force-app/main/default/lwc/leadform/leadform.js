import { LightningElement } from 'lwc';


export default class Leadform extends LightningElement {
    


    accountId;
    leadId;
   handleSuccess(event) {
    //    console.log('event:', event);
       this.leadId = event.detail.id;
       alert('Id: '+event.detail.id);
   }
}