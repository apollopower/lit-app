// function printMessage(message){
//   console.log("Static")
//   $('#messages').append(message + "<br>")
// }

$(function() {

    var chatChannel;
    var username;

    function printMessage(message){
      console.log("Complete!")
      $('#messages').append(message + "<br>")
    }

    function setupChannel() {
        chatChannel.join().then(function(channel) {
            console.log("about to add a noty to the chat!")
            printMessage( '<strong>' + username + '</strong>' + ' joined the chat.');
        });
        console.log("Another test")
        chatChannel.on('messageAdded', function(message) {
            printMessage('<strong>' + message.author + ": " + '</strong>'  + message.body);
         });
    }

    var $input = $('#chat-input');
    $input.on('keydown', function(e) {
        if (e.keyCode == 13) {
            chatChannel.sendMessage($input.val())
            $input.val('');
        }
     });

     $.post("/tokens.json", function(data) {
       username = data.username;
       var accessManager = new Twilio.AccessManager(data.token);
       var messagingClient = new Twilio.IPMessaging.Client(accessManager);

       messagingClient.getChannelByUniqueName('chat').then(function(channel) {
         if (channel) {
           chatChannel = channel;
           setupChannel();
           console.log("setupChannel was called")
         } else {
           messagingClient.createChannel({
             uniqueName: 'chat',
             friendlyName: 'Chat Channel' })
             .then(function(channel) {
               chatChannel = channel;
               setupChannel();
             });
           }
         });
       });
});
