import { LightningElement } from "lwc";
import MyModal from "c/myModal";

export default class MyApp extends LightningElement {
  handleClick() {
    const result = MyModal.open({
      // `label` is not included here in this example.
      // it is set on lightning-modal-header instead
      label: "stephe",
      size: "small",
      description: "Accessible description of modal's purpose",
      content: "Passed into content api"
    });
    // if modal closed with X button, promise returns result = 'undefined'
    // if modal closed with OK button, promise returns result = 'okay'
    console.log(result);
  }

  handleSelectEvent(detail) {
    const { id, value } = detail;
    console.log(`select event fired elem with id ${id} and value: ${value}`);
  }

  // ...
  // Trigger visibility of the modal
  handleOpenModal() {
    MyModal.open({
      label: "Modal Title",
      size: "small",
      description: "Modal Title with brief description",
      // event triggered when new CustomEvent('select', {detail: {}});
      // occurs *from within* LightningModal.
      // see dispatchSelectEvent() in c/myModal.js above
      onselect: (e) => {
        // stop further propagation of the event
        e.stopPropagation();
        // hand off to separate function to process
        // result of the event (see above in this example)
        this.handleSelectEvent(e.detail);
        // or proxy to be handled above by dispatching
        // another custom event to pass on the event
        // this.dispatchEvent(e);
      }
    });
  }
}