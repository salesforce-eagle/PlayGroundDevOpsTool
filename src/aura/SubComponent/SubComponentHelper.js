({
    getAllAccounts : function(component, helper) {
        //Calling base component's helper method to call Aura Method
        helper.callServer(component, "c.getAccounts", 
                          function(response){
                              if(response){
                                  component.set("v.data", response);
                                  //Calling showToast method of Base component
                                  helper.showToast({
                                      "title": "SUCCESS",
                                      "type": "success",
                                      "message": "Account details are loaded"
                                  });
                              }
                          }
                         );
    },
})