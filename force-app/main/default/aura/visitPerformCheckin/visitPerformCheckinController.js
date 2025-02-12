({
    doInit: function (component, event, helper) {
        helper.doInit(component, event, helper);
    },

    onSelectedType: function (component, event, helper) {
        var checkinType = component.get('v.checkinType');

        if (checkinType == '' || checkinType == null) {
            helper.showToast('error', 'Selecione algum tipo de check-in.', 2000, 'Verifique os dados.');
            return;
        }

        console.log('Valor checkinType ->', checkinType);

        if (checkinType == 'NotPresencial') {
            component.set('v.step', 3);
            helper.performCheckIn(component, event, helper, 0, 0);

        } else if (checkinType == 'VisitPlan') {
            component.set('v.step', 3);
            helper.onCheckinWithLocation(component, event, helper);

        } else if (checkinType == 'Attribute') {
            component.set('v.step', 2);
        }

    },

    onAttributesNext: function (component, event, helper) {
        var attributes = component.get('v.attributesSelected');

        if (attributes == '' || attributes == null) {
            helper.showToast('error', 'Selecione algum atributo.', 2000, 'Verifique os dados.');
            return;
        }
        component.set('v.step', 3);
        helper.onCheckinWithLocation(component, event, helper);
    },

    onBackRequest: function (component, event, helper) {
        component.set('v.step', 1);
    },

    cancelCheckin: function (component, event, helper) {
        helper.closeModal(component);
    } 

})