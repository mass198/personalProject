import { LightningElement, api, wire } from "lwc";

import { getRecord, getFieldValue, updateRecord } from "lightning/uiRecordApi";
import { getLocationService } from "lightning/mobileCapabilities";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { NavigationMixin } from "lightning/navigation";

import APPTNUMBER_FIELD from "@salesforce/schema/ServiceAppointment.AppointmentNumber";
import APPTSTATUS_FIELD from "@salesforce/schema/ServiceAppointment.Status";
import APPTID_FIELD from "@salesforce/schema/ServiceAppointment.Id";
const APPTCILAT_FIELD = "FSM_Check_In_Location__Latitude__s";
//import test_FIELD from "ServiceAppointment.FSM_Check_Out_Location__c";
const APPTCILONG_FIELD = "FSM_Check_In_Location__Longitude__s";
const APPTCOLAT_FIELD = "FSM_Check_Out_Location__Latitude__s";
const APPTCOLONG_FIELD = "FSM_Check_Out_Location__Longitude__s";

export default class LocationTest extends NavigationMixin(LightningElement) {
  @api recordId;
  @api varLocnLat;
  @api varLocnLong;
  @api varDispatch;
  @api varCheckIn;
  @api varCheckOut;
  @api varSAComplete;

  // Internal Variables //
  myLocationService;
  currentLocation;
  locationButtonDisabled = false;
  requestInProgress = false;
  varDispatch = false;
  varCheckIn = false;
  varCheckOut = false;
  varSAComplete = false;
  localAppStatus = "";
  apptStatusSelected = "";
  apptToBeUpdated = "";
  inpInRoute = false;
  inpCheckIn = false;
  inputStatus = "";
  radiobutton = false;
  selectedValue = "";
  varLocnLat = 11.111111;
  varLocnLong = 22.222222;
  get dispatchOptns() {
    return [
      { label: "In Route", value: "In Route" },
      { label: "Check In", value: "Check In" }
    ];
  }

  get checkInOptns() {
    return [{ label: "Check In", value: "Check In" }];
  }
  get checkOutOptns() {
    return [{ label: "Check Out", value: "Check Out" }];
  }

  @wire(getRecord, {
    recordId: "$recordId",
    fields: [APPTNUMBER_FIELD, APPTSTATUS_FIELD]
  })
  serviceAppt;

  connectedCallback() {
    this.myLocationService = getLocationService();
    if (
      this.myLocationService != null &&
      this.myLocationService.isAvailable()
    ) {
      //this.handleGetCurrentLocation();
    }
  }

  get apptNumber() {
    return getFieldValue(this.serviceAppt?.data, APPTNUMBER_FIELD);
  }

  get apptStatus() {
    this.localAppStatus = getFieldValue(
      this.serviceAppt?.data,
      APPTSTATUS_FIELD
    );
    if (this.localAppStatus === "Dispatched") {
      this.varDispatch = true;
      this.varCheckIn = false;
      this.varCheckOut = false;
      this.varSAComplete = false;
    } else if (this.localAppStatus === "In Route") {
      this.varDispatch = false;
      this.varCheckIn = true;
      this.varCheckOut = false;
      this.varSAComplete = false;
    } else if (this.localAppStatus === "Check In") {
      this.varDispatch = false;
      this.varCheckIn = false;
      this.varCheckOut = true;
      this.varSAComplete = false;
    } else {
      this.varDispatch = false;
      this.varCheckIn = false;
      this.varCheckOut = false;
      this.varSAComplete = true;
    }

    return getFieldValue(this.serviceAppt?.data, APPTSTATUS_FIELD);
  }

  get currentLocationAsMarker() {
    return [
      {
        location: {
          //Latitude: this.currentLocation.coords.latitude,
          //Longitude: this.currentLocation.coords.longitude
        },
        title: "My Location"
      }
    ];
  }

  handleGetCurrentLocation() {
    this.currentLocation = null;

    if (
      this.myLocationService != null &&
      this.myLocationService.isAvailable()
    ) {
      // Configure options for location request
      const locationOptions = {
        enableHighAccuracy: true
      };

      this.requestInProgress = true;

      this.myLocationService
        .getCurrentPosition(locationOptions)
        .then((result) => {
          this.currentLocation = result;
          this.varLocnLat = this.currentLocation.coords.latitude;
          this.varLocnLong = this.currentLocation.coords.longitude;

          // result is a Location object
          console.log(JSON.stringify(result));

          //this.dispatchEvent(
          //new ShowToastEvent({
          //    title: 'Location Detected',
          //    message: 'Location determined successfully.',
          //    variant: 'success'
          //})
          //);
        })
        .catch((error) => {
          // Handle errors here
          console.error(error);

          // Inform the user we ran into something unexpected
          this.dispatchEvent(
            new ShowToastEvent({
              title: "LocationService Error",
              message:
                "There was a problem locating you: " +
                JSON.stringify(error) +
                " Please try again.",
              variant: "error",
              mode: "sticky"
            })
          );
        })
        .finally(() => {
          console.log("#finally");
          // Remove the spinner
          this.requestInProgress = false;
        });
    } else {
      // LocationService is not available
      // Not running on hardware with GPS, or some other context issue
      console.log("Get Location button should be disabled and unclickable. ");
      console.log("Somehow it got clicked: ");
      console.log(event);

      // Let user know they need to use a mobile phone with a GPS
      this.dispatchEvent(
        new ShowToastEvent({
          title: "LocationService Is Not Available",
          message: "Try again from the Salesforce app on a mobile device.",
          variant: "error"
        })
      );
    }
  }

  fetchValue(event) {
    if (event.target.name === "radioGroup") {
      this.inputStatus = event.target.value;
    }
  }

  saveAppt() {
    const fields = {};
    fields[APPTID_FIELD.fieldApiName] = this.recordId;
    console.log(this.inputStatus, "----------");
    if (this.inputStatus === "In Route") {
      fields[APPTSTATUS_FIELD.fieldApiName] = this.inputStatus;
      this.inputStatus = "";
    }
    if (this.inputStatus === "Check In") {
      fields[APPTSTATUS_FIELD.fieldApiName] = this.inputStatus;
      //fields[FSMCILAT_FIELD.fieldApiName]  = parseFloat(this.varLocnLat);
      //fields[FSMCILONG_FIELD.fieldApiName] = parseFloat(this.varLocnLong);
      fields[APPTCILAT_FIELD] = parseFloat(this.varLocnLat);
      fields[APPTCILONG_FIELD] = parseFloat(this.varLocnLong);
      console.log("this is Check in");

      this.inputStatus = "";
    }
    if (this.inputStatus === "Check Out") {
      fields[APPTSTATUS_FIELD.fieldApiName] = this.inputStatus;
      fields[APPTCOLAT_FIELD] = parseFloat(this.varLocnLat);
      fields[APPTCOLONG_FIELD] = parseFloat(this.varLocnLong);
      //fields[FSMCOLAT_FIELD.fieldApiName]  = parseFloat(this.varLocnLat);
      //fields[FSMCOLONG_FIELD.fieldApiName] = parseFloat(this.varLocnLong);
      /* fields[APPTCOLAT_FIELD.fieldApiName] = {
        FSM_Check_Out_Location__Latitude__s: parseFloat(this.varLocnLat),
        FSM_Check_Out_Location__Longitude__s: parseFloat(this.varLocnLong)
      }; 

      fields[APPTCOLAT_FIELD.fieldApiName] = JSON.parse(
        '{"latitude":' + parseFloat(this.varLocnLat) + "}"
      );
      fields[APPTCOLONG_FIELD.fieldApiName] = JSON.parse(
        '{"longitude":' + parseFloat(this.varLocnLong) + "}"
      );
      console.log("**********" + this.varLocnLat);
      console.log("**********" + this.varLocnLong);
      /*fields[test_FIELD] = {
        FSM_Check_Out_Location__Latitude__s: 11.111,
        FSM_Check_Out_Location__Longitude__s: 22.222
      }; */
      // fields[APPTCOLONG_FIELD.fieldApiName] = 22.222222;
      // fields[APPTCOLONG_FIELD.fieldApiName] = parseFloat(this.varLocnLong);
      console.log("this is Check out");
      this.inputStatus = "";
    }
    const recordInput = { fields };
    //this.navigateToViewRecordPage();
    //updateRecord(recordInput).then(() => {});
    updateRecord(recordInput)
      .then(() => {
        this.dispatchEvent(new CloseActionScreenEvent());
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Service Appointment updated",
            variant: "success",
            mode: "dismissable"
          })
        );
      })
      .catch((error) => {
        console.log(error);
        console.log(recordInput);
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error updating Service Appointment",
            message: error.body.message,
            variant: "error",
            mode: "sticky"
          })
        );
      });
    //this.navigateBackToSA();
  }

  navigateBackToSA() {
    var url = window.location.href;
    var value = url.substr(0, url.lastIndexOf("/") + 1);
    window.history.back();
    return false;
  }
}