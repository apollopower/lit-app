$(document).ready(function(){
  $('.vote').click(function(evt){
    evt.preventDefault();
    var $this = $(this);
      $.ajax({
        method: "POST",
        url: $this.attr('href'),
        dataType: "json"
      })
      .done(function(data){
        $this.closest('.idea-container').find('.idea-count').html(data.idea_count)
        $this.css('color','red')
        $this.unbind("click", css);
    })
  });
  });
