({
	fetchHistory : function(component, event, helper) {
        //console.log('fetchHistory');
       
        //var objectHistoryLine = [];
        var objectHistoryLine =[{
            "action": "Changed",
            "actionItem1": "from Unassigned to",
            "actionItem2":"Strategic",
            "actionItem": "IBCM Tier",
            "who": "B"}
        ];
        
        var historyList = [];
        for(var historyLine in objectHistoryLine){
            var sObjectItem = {};
            console.log('historyLine: '+objectHistoryLine[historyLine]);
            sObjectItem.action = objectHistoryLine[historyLine].action+objectHistoryLine[historyLine].actionItem+objectHistoryLine[historyLine].actionItem1+objectHistoryLine[historyLine].actionItem2;
            sObjectItem.User = objectHistoryLine[historyLine].who;
            historyList.push(sObjectItem);
        }
        component.set('v.mycolumns', [
            {label: 'Action2', fieldName: 'action', type: 'text'},
                {label: 'User', fieldName: 'User', type: 'text'}
                //{label: 'Type', fieldName: 'Type', type: 'Text'}
            ]);
        component.set('v.historyLineItem',historyList);
        console.log('2w2w2: '+JSON.stringify(historyList));
	}
})