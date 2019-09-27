({
    doInit : function(component, event, helper) {
		var store = component.get("v.getAttributeValue");
        alert(store);
        if(store != undefined){
           component.set("v.getAttributeValue", component.get("v.setAttributeValue")); 
        }
        alert(component.get("v.getAttributeValue"));
	},
	itemsChange : function(component, event, helper) {
		alert('Previous Value..'+event.getParam("oldValue"));
        alert('New Value will be..'+event.getParam("value"));
	}
})