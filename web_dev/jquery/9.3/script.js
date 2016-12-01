$(document).ready(function(){
  $("a").hover(function(){
    $(this).css("font-size", 24);
    }, function(){
    $(this).css("font-size", 18);
});


  $('h1').scrollToFixed({ marginTop: 0, limit: 580 });


});
