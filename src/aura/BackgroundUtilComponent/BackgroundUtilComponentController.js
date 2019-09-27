({
    doInit : function(component, event, helper) {
        var workspaceAPI = component.find("er");
        console.log('---: '+JSON.stringify(workspaceAPI));      
        workspaceAPI.getFocusedTabInfo().then(function(response) {
            var focusedTabId = response.tabId;
            console.log('Tab Info is :'+focusedTabId);
        });
        /* workspaceAPI.refreshTab({
                tabId: focusedTabId,
                includeAllSubtabs: true
            });
        })
        .catch(function(error) {
            console.log(error);
        });
        $A.get('e.force:refreshView').fire();*/
    },
    openTab : function(component, event, helper) {
        var workspaceAPI = component.find("er");
        workspaceAPI.openTab({
            url: '#/sObject/001R0000003HgssIAC/view',
            focus: true
        });
    },
    getAllTabInfo : function(component, event, helper) {
        var workspaceAPI = component.find("er");
        workspaceAPI.getAllTabInfo().then(function(response) {
            console.log(response);
        })
        .catch(function(error) {
            console.log(error);
        });
    }    
})