$(function(){
  //バリデーション　ニックネーム
  $('#nickname-input').on('blur',function(){
    let error;
    let value = $('#nickname-input').val();
    // console.log(value)
    if(value == ""){
      error = true;}
    // else if(!value.match(/[0-9a-zA-Z]/)){
    //   error = true;}
    if(error){
      $('.nickname-error').show();
      $('#nickname-input').css({'border':'1px solid #ea352d'});
    }
  });
});


$(function(){
  //バリデーション　メールアドレス
  $('#email-input').on('blur',function(){
    let error;
    let value = $('#email-input').val();
    // console.log(value)
    if(value == ""){
      error = true;}
    // else if(!value.match(/[0-9a-zA-Z]/)){
    //   error = true;}
    if(error){
      $('.email-error').show();
      $('#email-input').css({'border':'1px solid #ea352d'});
    }
  });
});


$(function(){
  //バリデーション　パスワード
  $('#password-input').on('blur',function(){
    let error;
    let value = $('#password-input').val();
    // console.log(value)
    if(value == ""){
      error = true;}
    else if(!value.match(/[0-9a-zA-Z]/)){
      error = true;}
    if(error){
      $('.password-error1').show();
      $('#password-input').css({'border':'1px solid #ea352d'});
    }
  });
});


$(function(){
  //パスワード表示
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
  //バリデーション　生年月日
  $('.select-default').on('blur',function(){
    let error;
    let value = $('.select-default').val();
    // console.log(value)
    if(value == ""){
      error = true;}
    // else if(!value.match(/[0-9a-zA-Z]/)){
    //   error = true;}
    if(error){
      $('.birthday-error1').show();
      $('.select-default').css({'border':'1px solid #ea352d'});
    }
  });
});
