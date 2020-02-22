$(function(){
  $('#js-count').keyup(function(){
    var count = $(this).val().length;
    $('.textCount').text(count);
  })
})



// new Vue({
//   el: "#app",
//   data: {
//     hoge: 'aaaa'
//   },
//   method: {
//     hogehoge: function(){
//       return hogehoge
//     }
//   }
// })