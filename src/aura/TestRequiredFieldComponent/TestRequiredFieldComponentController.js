({
    doInit: function(component, event, helper){
        var parentObjectName = "Bibhu" //component.get("v.sObjectName");
        if(!parentObjectName.includes("__c")){
            console.log('It might be a standard Object: '+ parentObjectName);
            parentObjectName +="__c";
            console.log("Latest Object Name: "+parentObjectName);
        }
    },
    
    showRequiredFields: function(component, event, helper){
        var fieldFind = component.find("Input");
        if(fieldFind.length != undefined){
            for(var i = 0; i < fieldFind.length; i++){
                alert('I am inside Save-->');
                if((fieldFind[i].get("v.value")) === ""){
                    fieldFind[i].focus();
                }
            }
        }else{
            alert('I am inside Else Save-->>');
            if((fieldFind.get("v.value")) === ""){
                fieldFind.focus();
            }            
        }
        
    },
    changeHandle: function(component, event, helper){
        //alert('Check Me'); 
        
    },
    
    validateContact: function(component, event, helper){
        var validity  = component.find("Input")
        console.log('validity Length'+ JSON.stringify(validity));
        
        if(validity.length != undefined)
        {
            for(var i= 0; i < validity.length; i++)
            {
                var valueCheck = validity[i].get("v.value");
                if(valueCheck === ""){
                    alert('Can not pass Null Value for -->'+validity[i].get("v.fieldName"));
                }
                console.log('Please Print in IF:->> '+validity[i].get("v.value"));
            }
        }else{
            alert('Can not pass Null Value--Else'+validity.get("v.fieldName"));
            console.log('Please Print in ELSE:->> '+validity.get("v.value"));        
        }       
    }
})