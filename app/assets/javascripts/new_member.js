$(function(){
  //バリデーション　ニックネーム
  $('#user_nick_name').on('blur',function(){
    let error;
    let value = $('#user_nick_name').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.nickname-error').show();
      $('#user_nick_name').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.nickname-error').hide();
      $('#user_nick_name').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //バリデーション　メールアドレス
  $('#user_email').on('blur',function(){
    let error;
    let value = $('#user_email').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.email-error').show();
      $('#user_email').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.email-error').hide();
      $('#user_email').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //バリデーション　パスワード
  $('#user_password').on('blur',function(){
    let error;
    let value = $('#user_password').val();
    if(value == ""){
      error = true;}
    else if(!value.match(/[0-9a-zA-Z]/)){
      error = true;}
    if(error){
      $('.password-error1').show();
      $('#user_password').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.password-error1').hide();
      $('#user_password').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //パスワード表示
  $('.passcheck').click(function(){
    $('.passshow').toggle();
    // passcheckをクッリクしたら
    var text = $('#user_password').val();
    // valで#password-inputの値を取ってきて、変数textに入れる
    $('.passshow').text(text);
    // pssshowにtextメソッドでtextを入れる
  });
});





$(function() {
  // 現在の年月日を取得
  var time = new Date();
  var year = time.getFullYear();
  var month = time.getMonth() + 1;
  var date = time.getDate();

  // 選択された年月日を取得
  var selected_year = document.getElementById("year").value;
  var selected_month = document.getElementById("month").value;

  // 年(初期): 1900〜現在の年 の値を設定
  for (var i = year; i >= 1900 ; i--) {
      $('#year').append('<option value="' + i + '">' + i + '</option>');
  }

  // 月(初期): 1~12 の値を設定
  for (var j = 1; j <= 12; j++) {
      $('#month').append('<option value="' + j + '">' + j + '</option>');
  }

  // 日(初期): 1~31 の値を設定
  for (var k = 1; k <= 31; k++) {
      $('#date').append('<option value="' + k + '">' + k + '</option>');
  }

  // 月(変更)：選択された年に合わせて、適した月の値を選択肢にセットする
  $('#year').change(function() {
      selected_year = $('#year').val();

      // 現在の年が選択された場合、月の選択肢は 1~現在の月 に設定
      // それ以外の場合、1~12 に設定
      var last_month = 12;
      if (selected_year == year) {
          last_month = month;
      }
      $('#month').children('option').remove();
      $('#month').append('<option value="' + 0 + '">--</option>');
      for (var n = 1; n <= last_month; n++) {
          $('#month').append('<option value="' + n + '">' + n + '</option>');
      }
  });

  // 日(変更)：選択された年・月に合わせて、適した日の値を選択肢にセットする
  $('#year,#month').change(function() {
      selected_year = $('#year').val();
      selected_month = $('#month').val();

      // 現在の年・月が選択された場合、日の選択肢は 1~現在の日付 に設定
      // それ以外の場合、各月ごとの最終日を判定し、1~最終日 に設定
      if (selected_year == year && selected_month == month ) {
          var last_date = date;
      }else{
          // 2月：日の選択肢は1~28日に設定
          // ※ ただし、閏年の場合は29日に設定
          if (selected_month == 2) {
              if((Math.floor(selected_year%4 == 0)) && (Math.floor(selected_year%100 != 0)) || (Math.floor(selected_year%400 == 0))){
                  last_date = 29;
              }else{
                  last_date = 28;
              }

          // 4, 6, 9, 11月：日の選択肢は1~30日に設定
          }else if(selected_month == 4 || selected_month == 6 || selected_month == 9 || selected_month == 11 ){
              last_date = 30;

          // 1, 3, 5, 7, 8, 10, 12月：日の選択肢は1~31日に設定
          }else{
              last_date = 31;
          }
      }

      $('#date').children('option').remove();
      $('#date').append('<option value="' + 0 + '">--</option>');
      for (var m = 1; m <= last_date; m++) {
          $('#date').append('<option value="' + m + '">' + m + '</option>');
      }
  });
});





$(function(){
  //バリデーション　生年月日
  $('.p-member-form__birthday--select').on('click',function(){
    let error;
    let value = $('#date').val();
    if(value == "0"){
      error = true;}
    if(error){
      $('.birthday-error').show();
      $('.p-member-form__birthday--select').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.birthday-error').hide();
      $('.p-member-form__birthday--select').css({'border':'1px solid #0099e8'});
    }
  });
});
