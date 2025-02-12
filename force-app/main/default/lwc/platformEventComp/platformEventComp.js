import { LightningElement, api, track } from "lwc";
import {
  subscribe,
  unsubscribe,
  onError,
  isEmpEnabled
} from "lightning/empApi";
const columns = [
  { label: "Record Array", fieldName: "Record_Array__c", type: "text" }
];
export default class PlatformEvent extends LightningElement {
  channelName = "/event/Account__e";

  isSubscribeEnabled = false;
  isUnsubscribeEnabled = !this.isSubscribeEnabled;

  subscription = {};
  empEnabled = true;

  logs = [];
  columns = columns;

  get buttonVariant() {
    return this.isSubscribeEnabled ? "neutral" : "brand";
  }

  get buttonLabel() {
    return this.isSubscribeEnabled ? "Unsubscribe" : "Subscribe";
  }

  // Tracks changes to channelName text field
  handleChannelName(event) {
    this.channelName = event.target.value;
  }

  // Initializes the component
  connectedCallback() {
    // Register error listener
    this.registerErrorListener();
    isEmpEnabled().then((empEnabled) => {
      this.empEnabled = empEnabled;
    });
  }

  disconnectedCallback() {
    this.handleUnsubscribe();
  }

  handleToggleSubscribe() {
    if (!this.isSubscribeEnabled) {
      this.handleSubscribe();
    } else {
      this.handleUnsubscribe();
    }
  }

  // Handles subscribe button click
  handleSubscribe() {
    // Invoke subscribe method of empApi. Pass reference to messageCallback
    subscribe(this.channelName, -1, (/** @type {DebugLog} */ response) => {
      try {
        this.logs = [
          { ...response.data.payload, replayId: response.data.event.replayId },
          ...this.logs
        ];
      } catch (ex) {
        console.log("Error parsing response: ", JSON.stringify(response));
      }
    }).then((response) => {
      // Response contains the subscription information on subscribe call
      console.log(
        "Subscription request sent to: ",
        JSON.stringify(response.channel)
      );
      this.subscription = response;
      this.toggleSubscribeButton(true);
    });
  }

  // Handles unsubscribe button click
  handleUnsubscribe() {
    this.toggleSubscribeButton(false);

    // Invoke unsubscribe method of empApi
    unsubscribe(this.subscription, (response) => {
      console.log("unsubscribe() response: ", JSON.stringify(response));
      // Response is true for successful unsubscribe
      this.logs = [];
    });
  }

  toggleSubscribeButton(enableSubscribe) {
    this.isSubscribeEnabled = enableSubscribe;
    this.isUnsubscribeEnabled = !enableSubscribe;
  }

  registerErrorListener() {
    // Invoke onError empApi method
    onError((error) => {
      console.log("Received error from server: ", JSON.stringify(error));
      // Error contains the server-side error
    });
  }
}