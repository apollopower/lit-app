// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScripxt code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('.like').click(function(evt){
    evt.preventDefault();
    $(this).css("color","tomato");
    // console.log('test');
  });
});

// $(document).ready(function() {
// $('.like').click(function(evt){
//   evt.preventDefault();
//     // var self= $(this)
//     this.css("color", "tomato")
//
//   //     $.ajax({
//   //     method: "GET",
//   //     url: self.attr('href'),
//   //     dataType: "json"
//   //   })
//   //   .done(function (data){
//   //     console.log (data)
//   //     if (data.solved){
//   //       self.css("color", "tomato")
//   //     }
//   //     else {
//   //       self.css("color", "yellow")
//       }
//     });
