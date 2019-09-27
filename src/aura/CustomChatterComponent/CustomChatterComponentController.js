({
    handlePostCreated: function(cmp, event, helper) {
        cmp.find('notifLib').showToast({
            "title": "Success!",
            "message": "You just shared a post."
        });
    }
})