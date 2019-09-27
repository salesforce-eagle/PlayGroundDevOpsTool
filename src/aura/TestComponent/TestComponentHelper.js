({
    getontacts : function(component, event, helper) {
        var action = component.get("c.getObjectList");
        var acid = component.get("v.recordId");
        action.setParams({
            accountIds: acid
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if(state === 'SUCCESS') {
                var contactList = response.getReturnValue();
                component.set("v.cons",contactList);
            }
            else {
                alert('Error in getting data');
            }
        });
        $A.enqueueAction(action);
    }
 })