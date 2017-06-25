App.activity = App.cable.subscriptions.create("ActivityChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    console.log(data.message)
    $('#message_notification').find('.modal-body').html(data.message)
    $('#message_notification').find('.modal-footer .button_to').attr('action', data.url)
    $('#message_notification').find(".chat-with").val("Chat with " + data.name);
    if (data.is_verified) {
      $("#message_notification").find('.chat-with-receiver').html("Brainstorm with " + data.name)
      $('#message_notification').find('.modal-footer .button_to').css({display: 'none'})
      $("#message_notification").find('.chat-with-receiver').attr('href', data.url)
    }
    $('#message_notification').modal();
  }
});
