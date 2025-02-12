import { LightningElement, track } from 'lwc';

export default class TwoWayData extends LightningElement {

    Name = "Mass";
    role = "Salesforce Developer";
    // city 
    // state 
    // country 


    getName(event){
        this.Name = event.target.value;
    }

    getRole(event){
        this.role = event.target.value;
    }

    // getaddress(event){
    //     this.city=event.target.value;
    //     this.state=event.target.value;
    //     this.country=event.target.value;
    // }

  //  Youraddress =[...city, ...state, ...country]

   address={city:'hyd',state:'TS',country:'ind'}

  trackhandler(event){
    this.address = {...this.address, "city":event.target.value}
  }

  users= ['john','mike','carl']

  firstusername = this.users[0]

  get firstuser(){
    return this.users[0]
  }
}