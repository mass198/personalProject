({
    doInit: function (component, event, helper) {
        var planLocation;
        var objectId = component.get('v.recordId');

        var planAttrs = component.get("c.getPlan");
        planAttrs.setParams({
            "objectId": objectId
        });
        planAttrs.setCallback(this, function (response) {
            if (response.getState() != "SUCCESS") {
                helper.showToast('error', response.getError()[0].message);
                helper.closeModal(component);
                return;
            }

            var resp = response.getReturnValue();
            var attributes;
            var planLocation;

            var attributes = resp.Account;
            var attributesLabel = resp.AttributesLabel;
            var dealerPlan = resp.Dealer__c;
            var attributesList = []; 
            
            if(!dealerPlan){
               helper.closeModal(component);
               helper.showToast('warning', 'A função Check-In está desabilitada para Visitas aos Clientes.', 10000, 'Check-In não realizado.'); 
            }  

            if (attributes) {

                attributes = attributes.split(';');
                attributesLabel = attributesLabel.split(';');

                attributes.forEach((valor, index) => {
                    attributesList.push({
                        value: valor,
                        label: attributesLabel[index]
                    });
                });

            } 

            component.set('v.attributes', attributesList);
        });
        $A.enqueueAction(planAttrs);
    }, 

    onCheckinWithLocation: function (component, event, helper) {
        navigator.geolocation.getCurrentPosition(position => {
            var latit = position.coords.latitude;
            var longit = position.coords.longitude;

            component.set("v.lat", latit);
            component.set("v.lon", longit);

            helper.showToast('success', 'Realizando check-in...', 2500, 'Posição obtida.');
            helper.checkCanCheckIn(component, event, helper);
        }, error => {
            var currentTotalErrors = component.get('v.totalErrors');

            if (currentTotalErrors > 2) {
                helper.showToast('warning', 'Realizado Check-In com a localização atual', 3000);
                helper.performCheckIn(component, event, helper, 0, 0);
                return;
            }

            helper.showToast('error', 'Erro ao obter posição, tente novamente.', 2000, 'Não realizado.');
            component.set('v.totalErrors', currentTotalErrors + 1);
            component.set('v.step', 1);
            return;
        }, {
            maximumAge: 60000,
            timeout: 10000,
            enableHighAccuracy: true
        });

    }, 

    checkCanCheckIn: function (component, event, helper) {
        var objectId = component.get('v.recordId');
        var lat = component.get('v.lat');
        var lon = component.get('v.lon');

        var planLocation = component.get("c.getPlan");
        planLocation.setParams({
            "objectId": objectId
        });
        planLocation.setCallback(this, function (response) {
            if (response.getState() != "SUCCESS") {
             //   helper.showToast('error', response.getError()[0].message);
                helper.closeModal(component);
                return;
            }

            var resp = response.getReturnValue();
            
         	if (!resp.Dealer__r.ShippingLongitude || !resp.Dealer__r.ShippingLatitude) {
                helper.showToast('error', 'A latitude/longitude do dealer é nula.', 6000, 'Não realizado.');
                helper.closeModal(component);
                return;
            }

            var latPlan = resp.Dealer__r.ShippingLatitude;
            var lonPlan = resp.Dealer__r.ShippingLongitude;
          //  var attributes = resp.Account;

            component.set('v.attributes', attributes);
            component.set('v.latVisit', latPlan);
            component.set('v.lonVisit', lonPlan);

            var distancia = helper.distanceBetween(lat, lon, latPlan, lonPlan);

            if (distancia > 0.5) {
                var currentTotalOut = component.get('v.totalOutOfRange');

                if (currentTotalOut > 2) {
                    helper.showToast('warning', 'Fora do alcance multiplas vezes. Realizando check-in sem localização.', 4000);
                    helper.performCheckIn(component, event, helper, lat, lon, true);
                    return;
                }

                helper.showToast('error', 'Localização fora do alcance para o check-in.', 6000, 'Não realizado.');
                component.set('v.totalOutOfRange', currentTotalOut + 1);

                helper.doInit(component, event, helper);
                var checkinType = component.get('v.checkinType');
                if (checkinType == 'Attribute') {
                    component.set('v.step', 2);
                } else {
                    component.set('v.step', 1);
                }
            } else {
                helper.performCheckIn(component, event, helper, lat, lon);
            }

        });
        $A.enqueueAction(planLocation);

    },

    performCheckIn: function (component, event, helper, lat, lon, outOfRange) {
        var planId = component.get('v.recordId');
        var checkinType = component.get('v.checkinType');
        var selectedAttributes = component.get("v.attributesSelected");

        var planLocation = component.get("c.performCheckInLocation");
        planLocation.setParams({
            "objectId": planId,
            "lat": lat,
            "lon": lon,
            "typeCheckin": checkinType,
            "attributes": selectedAttributes,
            "outOfRangeCheckin": outOfRange
        });
        planLocation.setCallback(this, function (response) {
            if (response.getState() != "SUCCESS") {
                helper.showToast('error', response.getError()[0].message, 3000, 'Erro');
                helper.closeModal(component);
                return;
            } 

            helper.showToast('success', 'O check-in foi realizado com sucesso.', 6000, 'Realizado.');
            //helper.closeModal(component);
            $A.get('e.force:refreshView').fire();
        });
        $A.enqueueAction(planLocation);
    },

    closeModal: function (component) {
        var dismissActionPanel = $A.get("e.force:closeQuickAction");
        dismissActionPanel.fire();

        component.set('v.totalErrors', 0);
        component.set('v.lat', 0);
        component.set('v.lon', 0);
    },

    distanceBetween: function (lat1, lon1, lat2, lon2) {
        if ((lat1 == lat2) && (lon1 == lon2))
            return 0;

        let radlat1 = Math.PI * lat1 / 180;
        let radlat2 = Math.PI * lat2 / 180;
        let theta = lon1 - lon2;
        let radtheta = Math.PI * theta / 180;
        let dist = Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta);

        if (dist > 1)
            dist = 1;

        dist = Math.acos(dist);
        dist = dist * 180 / Math.PI;
        dist = dist * 60 * 1.1515;
        dist = dist * 1.609344
        return dist.toFixed(1);  
    }, 
})