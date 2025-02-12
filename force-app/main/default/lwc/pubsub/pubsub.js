const store = {};
/** 

* @param {string} eventName
* @param {function} callback 

**/

const subscribe = (eventName, callback) => {
  if (!store[eventName]) {
    store[eventName] = new Set();
  }
  store[eventName].add(callback);
};

/** 

* @param {string} eventName
* @param {function} callback 

**/

const unsubscribe = (eventName, callback) => {
  if (store[eventName]) {
    store[eventName].delete(callback);
  }
};
/** 

* @param {string} eventName
* @param {*} payload 

**/

const publish = (eventName, payload) => {
  if (store[eventName]) {
    store[eventName].forEach((callback) => {
      try {
        callback(payload);
      } catch (error) {
        console.error(error);
      }
    });
  }
};

export default { subscribe, unsubscribe, publish };