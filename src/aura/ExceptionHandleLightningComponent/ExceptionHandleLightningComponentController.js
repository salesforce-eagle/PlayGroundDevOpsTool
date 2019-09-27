({
    handleClick : function(component, event, helper) {
        var cmpGet = component.find("inputField").get("v.value");
        var action = component.get("c.initMethod");
        action.setCallback(this, function(response) {
            alert('1');
            if (state === "SUCCESS") {
                alert('in if');
                var returValueIs = response.getReturnValue();
                console.log(returValueIs);
            }else if(state === "ERROR"){
                alert('in else if');
                var errorIs = response.getError()
                console.log(errorIs);
            }else{
                alert('in else');
            }
        });
    }
})