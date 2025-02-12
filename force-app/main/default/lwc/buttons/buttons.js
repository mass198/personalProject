import { LightningElement , track} from 'lwc';

export default class Buttons extends LightningElement {
    @track handleDownloadValue;
    handleDownload(event){
        window.open("https://source.unsplash.com/random/300×300","_blank")
    }
}