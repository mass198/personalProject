import { LightningElement } from 'lwc';

export default class TimeCalculator extends LightningElement {
    showStartButton = true;
    timeVal = '0 : 0 : 0 : 0';
    timeIntervalInstance;
    totalMilliSeconds=0;

    startHandler(event) {
        this.showStartButton = false;
        var parentThis = this;

        this.timeIntervalInstance = setInterval(function() {
            var hours = Math.floor((parentThis.totalMilliSeconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            var minutes = Math.floor((parentThis.totalMilliSeconds % (1000 * 60 * 60)) / (1000 * 60));
            var seconds = Math.floor((parentThis.totalMilliSeconds % (1000 * 60)) / (1000));
            var milliseconds = Math.floor((parentThis.totalMilliSeconds % (1000)));

            parentThis.timeVal = hours + " : " + minutes + " : " + seconds + " : " + milliseconds;

            parentThis.totalMilliSeconds += 100;
        },100);
        }

        stopHandler(event) {
            this.showStartButton = true;
            clearInterval(this.timeIntervalInstance);
        }

        resetHandler(event){
            this.showStartButton = true;
            this.timeVal = '0 : 0 : 0 : 0';
            this.totalMilliSeconds=0;
            clearInterval(this.timeIntervalInstance);


        }
    }