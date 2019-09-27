({
    toggleOptionalTab : function(component, event, helper) {        
        var action = component.get("c.updateAttribute");
        action.setParams({
            "recordIdVal" : component.get("v.recordId")
        });
        action.setCallback(this,function(response){
            var state= response.getState();
            $A.log(response);
            if(state == "SUCCESS"){
                var getButtonInfo = event.getSource().get("v.label");
                if(getButtonInfo.includes("2")){
                    component.set("v.defaultTab",'two');
                }else if(getButtonInfo.includes("3")){
                    component.set("v.defaultTab",'three');
                }if(getButtonInfo.includes("1")){
                    component.set("v.defaultTab",'one');
                }
            }
            $A.get('e.force:refreshView').fire();
        });
        $A.enqueueAction(action);
    }
})