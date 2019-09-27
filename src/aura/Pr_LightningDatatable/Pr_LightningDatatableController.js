({
    /*
     * This finction defined column header
     * and calls getAccounts helper method for column data
     * editable:'true' will make the column editable
     * */
doInit : function(component, event, helper) {        
        component.set('v.columns', [
            {label: 'Name', fieldName: 'Name', editable:'true', type: 'text'},
            {label: 'Phone', fieldName: 'Phone', editable:'true', type: 'phone'},
            {type: "button", typeAttributes: {
                label: 'View',
                name: 'View',
                title: 'View',
                disabled: false,
                value: 'view',
                iconPosition: 'left'
            }},
            {type: "button", typeAttributes: {
                label: 'Edit',
                name: 'Edit',
                title: 'Edit',
                disabled: false,
                value: 'edit',
                iconPosition: 'left'
            }}
            //{label: 'Rating', fieldName: 'Rating', editable:'true', type: 'text'},
            //{label: 'Custom Field', fieldName: 'My_Custom_Field__c', editable:'true', type: 'text'}
        ]);        
        //helper.getAccounts(component, helper);
    //@pkumar : changed for using base helper
        helper.getAllAccounts(component, helper);
    },

    /*
     * This function is calling saveDataTable helper function
     * to save modified records
     * */
    onSave : function (component, event, helper) {
        helper.saveDataTable(component, event, helper);
    },
    
    // @pkumar : added for rowaction
    viewRecord : function(component, event, helper) {
        var recId = event.getParam('row').Id;
        var actionName = event.getParam('action').name;
        if ( actionName == 'Edit' ) {
            alert('Edit');
            var editRecordEvent = $A.get("e.force:editRecord");
            editRecordEvent.setParams({
                "recordId": recId
            });
            editRecordEvent.fire();
        } else if ( actionName == 'View') {
            alert('view');
            var viewRecordEvent = $A.get("e.force:navigateToURL");
            viewRecordEvent.setParams({
                "url": "/" + recId
            });
            viewRecordEvent.fire();
        }
    }
})