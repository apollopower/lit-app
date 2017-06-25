$(function(){
  $(document).on("click", ".sort", function(evt){
    evt.preventDefault()
    var $this = $(this);
    $this.closest('ul').find('li').removeClass('active')
    $this.closest('li').addClass('active')
    $.ajax({
      method: "GET",
      url: $this.attr("href"),
      dataType: "HTML",
    })
    .done(function(comment_data){
      $(".comment-wrapper").html(comment_data)
    })
  })
})
