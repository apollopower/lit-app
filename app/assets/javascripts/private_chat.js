function printMessage(message) {
  $('#messages').append(message + "<br>");
}

$(function(){

  var chatChannel;
  var username;

  function setupChannel() {
        chatChannel.join().then(function(channel) {
            printMessage(username + ' joined the chat.');
        });

        chatChannel.on('messageAdded', function(message) {
            printMessage(message.author + ": " + message.body);
         });
    }

    var $input = $('#chat-input');
    $input.on('keydown', function(e) {
        if (e.keyCode == 13) {
            chatChannel.sendMessage($input.val())
            $input.val('');
        }
     });

   $.post("/tokens", function(data) {
      username = data.username;
      var accessManager = new Twilio.AccessManager(data.token);
      var messagingClient = new Twilio.IPMessaging.Client(accessManager);

      messagingClient.getChannelByUniqueName('chat').then(function(channel) {
          if (channel) {
              chatChannel = channel;
              setupChannel();
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

// $.post("/tokens.json", function(data){
//   username = data.username;
//   var accessManager = new Twilio.AccessManager(data.token);
//   var messagingClient = new Twilio.IPMessaging.Client(accessManager);
//
//   messagingClient.getChannelByUniqueName('Jonas_channel_test').then(function(channel){
//     if (channel) {
//       chatChannel = channel
//       setupChannel();
//       console.log(channel);
//     } else {
//       messaginClient.createChannel({
//         uniqueName: $('#conversation_id').val(),
//         friendlyName: 'Jonas Channel!'
//       }).then(function(channel){
//         console.log('Created the Jonas channel...')
//         console.log(channel)
//       })
//     }
//   })
//   $('#invite-button').click(function(){
//     invitePerson();
//   });
//
// });



  // $.post("/tokens.json", function(data){
  //   var accessManager = new Twilio.AccessManager(data.token);
  //   var messagingClient = new Twilio.IPMessaging.Client(accessManager);
  // }).then(function(messagingClient){
  //   console.log(messagingClient)
  //   messagingClient.createChannel({
  //     uniqueName: 'private',
  //     friendlyName: 'Private Channel'
  //   }).then(function(channel){
  //     console.log('Created Private Channel');
  //     console.log(channel);
  //   });
  // });



// Step 1: I need to instantiate Conversation instance by requesting Conversation
// Step 2: Idea owner needs to 'accept' and change boolean verify
// Step 3: Conversation Index links to show page where conversation is created with COnvo ID (Used in JS file to specify channel)
