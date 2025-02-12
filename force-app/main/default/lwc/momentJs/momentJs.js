import { LightningElement } from 'lwc';
import JSFILE from '@salesforce/resourceUrl/tpjs'
import CSSFILE from '@salesforce/resourceUrl/tpcss'
import {loadScript, loadStyle} from 'lightning/platformResourceLoader'

export default class MomentJs extends LightningElement {
currenttime;
isLoaded = false;


 renderedCallback(){
    if(this.isLoaded){return }else{
        Promise.all([loadScript(this, JSFILE+'/moment.js'), loadStyle(this, CSSFILE+'/animate/animate.min.css')]).then(success=>{this.loadtime()}).catch(error=>{'Didnt load successfully', console.log(error)})
    
    this.isLoaded = true; 
 }}

 loadtime(){
    this.currenttime = moment().format('LLLL');  
                 
}
}