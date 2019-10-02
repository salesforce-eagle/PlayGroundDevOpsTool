({
    doInit : function(component, event, helper) {
        
        component.set('v.columns', [
            {label: 'Data Modified', fieldName: 'Display', editable:'false', type: 'text'},
            {label: 'Created/Modified User', fieldName: 'CreatedById', editable:'false', type: 'url'}
        ]);
        helper.getData(component, helper);        
    },
    
    handleClick : function(component, event, helper) {
        var source=event.getSource();        
        if(source.get('v.label') == 'Get Details'){
            component.set('v.showTable', true);
            source.set('v.label','Hide Details');
        }else if(source.get('v.label') == 'Hide Details'){
            component.set('v.showTable', false);
            source.set('v.label','Get Details');
        }        
    },
    emailSend : function(component, event, helper) {
        var action = component.get("c.sendEmailToUser");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {                
                var toastEvent = $A.get("e.force:showToast");
                toastEvent.setParams({
                    "title": "Success!",
                    "message": "An Email has been sent."
                });
                toastEvent.fire();
            }
        });
        $A.enqueueAction(action);
    }
})