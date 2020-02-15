$(function(){
  $('.passcheck').click(function(){
      $('.passshow').toggle();
  });
  $(function(){
    $('.passcheck').click(function(){
      // passcheckをクッリクしたら
        var text = $('#password-input').val();
        // valで#password-inputの値を取ってきて、変数textに入れる
        console.log(text)
        $('.passshow').text(text);
        // pssshowにtextメソッドでtextを入れる
    });
  });
});

$(function(){
  //バリデーション
  $('#password-input').on('click',function(){
    let error;
    let value = $('#password-input').val();
    // console.log(value)
    if(value == ""){
      error = true;}
    else if(!value.match(/[0-9a-zA-Z]/)){
      error = true;}
    if(error){
      $('.alert1').show();
    }
  });
});