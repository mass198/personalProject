import { LightningElement, track } from 'lwc';

export default class Project extends LightningElement {
    

    firstnumber;
    secondnumber;
    result;

    firstInputHandler(event){
        this.firstnumber = parseInt(event.target.value);
    }

    secondInputHandler(event){
        this.secondnumber= parseInt(event.target.value);
    }

    addhandler(){
        this.result=this.firstnumber+this.secondnumber;
    }

    subhandler(){
        this.result=this.firstnumber-this.secondnumber;
    }

    mulhandler(){
        this.result=this.firstnumber*this.secondnumber;
    }

    divhandler(){
        this.result=this.firstnumber/this.secondnumber;
    }
    result(){
        this.result="answer is" + this.result;
    }
    
    
    
        
    }