$(function(){
  $('#js-count').keyup(function(){
    let count = $(this).val().length;
    $('.textCount').text(`${count}/1500`);
  })
})
