({
  handleMessage: function (component, message) {
    if (message != null && message.getParam("lmsData") != null) {
      component.set("v.messageRecieved", message.getParam("lmsData").value);
    }
  },
  inputHandler: function (component, event) {
    component.set("v.messageValue", event.target.value);
  },
  publishMsg: function (component) {
    let msg = component.get("v.messageValue");
    let message = { lmsData: { value: msg } };
    component.find("lmschanneltopublish").publish(message);
  }
});