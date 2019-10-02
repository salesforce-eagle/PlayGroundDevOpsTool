({
    getData : function(component, helper) {
        var action = component.get("c.getSetupModifyDetails");
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log('List of Sobject is: '+JSON.stringify(response.getReturnValue().auditList));
                component.set("v.data", response.getReturnValue().auditList);
            }
        });
        $A.enqueueAction(action);
    },
    /*{
    //Id, Action, Section, createdDate,CreatedById, CreatedBy.Name, Display
   cmp.set('v.testColumns', [
                {
                  label: 'Link',Id
                  fieldName: 'link',Id
                  type: 'url',
                  typeAttributes: {
                    label: { fieldName: 'linkLabel' }
                  }
                }]);
        cmp.set('v.testData', [{
            id: '1',
            link: 'http://google.com',
            linkLable:'Google'
        }]);
    
}*/
})