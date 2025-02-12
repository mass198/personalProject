import { LightningElement } from 'lwc';

export default class LearnComponent extends LightningElement {

    valueofthebutton = false;

    valueofthesecondbutton=false;

    showsurveyhandler(){
        this.valueofthebutton=true;

    }

    Thankyouhandler(){
        this.valueofthesecondbutton=true;

    }


}