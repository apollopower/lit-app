$(document).ready(function(){
  $(document).on("click", '.vote, .upvote', function(evt){
    evt.preventDefault();
    var $this = $(this);
      $.ajax({
        method: "POST",
        url: $this.attr('href'),
        dataType: "json"
      })
      .done(function(data){
        $this.closest('.idea-container').find('.idea-count').html(data.idea_count)
        if ($this.attr("class") === 'vote') {
          toggleVoteClass($this,'upvote', 'vote')
        }else{
          toggleVoteClass($this,'vote', 'upvote')
        }
    })
  });
});


function toggleVoteClass(elem, addClass, removeClass){
  $(elem).removeClass(removeClass)
  $(elem).addClass(addClass)
}
