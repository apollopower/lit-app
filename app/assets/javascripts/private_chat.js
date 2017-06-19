function printMessage(message){
  $('#private').append(message + "<br>")
}

$(function(){

  var chatChannel;
  var username;

  function testing() {
    console.log("Testing!")
  }

  function setupChannel() {
      chatChannel.join().then(function(channel) {
          printMessage(username + ' joined the chat.');
      });

      chatChannel.on('messageAdded', function(message) {
          printMessage(message.author + ": " + message.body);
       });
  }

  function invitePerson() {
    chatChannel.invite('Christina Medeiros').then(function(){
      console.log('Your friend has been invited!')
    })
  }

  var $input = $('#private-chat-input');
  $input.on('keydown', function(e) {
      if (e.keyCode == 13) {
          chatChannel.sendMessage($input.val())
          $input.val('');
      }
   });




    $.post("/tokens.json", function(data){
      username = data.username;
      var accessManager = new Twilio.AccessManager(data.token);
      var messagingClient = new Twilio.IPMessaging.Client(accessManager);

      messagingClient.getChannelByUniqueName('Jonas_channel_test').then(function(channel){
        if (channel) {
          chatChannel = channel
          setupChannel();
          console.log(channel);
        } else {
          messaginClient.createChannel({
            uniqueName: 'Jonas_channel_test',
            friendlyName: 'Jonas Channel!'
          }).then(function(channel){
            console.log('Created the Jonas channel...')
            console.log(channel)
          })
        }
      })
      $('#invite-button').click(function(){
        invitePerson();
      });

    });

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
});
