$(function(){
  //バリデーション ニックネーム
  $('.nick_name').on('blur',function(){
    let error;
    let value = $('.nick_name').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.nickname-error').show();
      $('.nick_name').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.nickname-error').hide();
      $('.nick_name').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //バリデーション メールアドレス
  $('.email').on('blur',function(){
    let error;
    let value = $('.email').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.email-error').show();
      $('.email').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.email-error').hide();
      $('.email').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //バリデーション パスワード
  $('.password').on('blur',function(){
    let error;
    let value = $('.password').val();
    if(value == ""){
      error = true;}
    else if(!value.match(/[0-9a-zA-Z]/)){
      error = true;}
    if(error){
      $('.password-error1').show();
      $('.password').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.password-error1').hide();
      $('.password').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //パスワード表示
  $('.passcheck').click(function(){
    $('.passshow').toggle();
    // passcheckをクッリクしたら
    var text = $('.password').val();
    // valで#password-inputの値を取ってきて、変数textに入れる
    $('.passshow').text(text);
    // pssshowにtextメソッドでtextを入れる
  });
});

$(function(){
  //バリデーション 姓
  $('.first_name').on('blur',function(){
    let error;
    let value = $('.first_name').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.first_name-error').show();
      $('.first_name').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.first_name-error').hide();
      $('.first_name').css({'border':'1px solid #ccc'});
    }
  });
});
$(function(){
  //バリデーション 名
  $('.last_name').on('blur',function(){
    let error;
    let value = $('.last_name').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.last_name-error').show();
      $('.last_name').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.last_name-error').hide();
      $('.last_name').css({'border':'1px solid #ccc'});
    }
  });
});


$(function(){
  //バリデーション 姓カナ
  $('.first_name_kana').on('blur',function(){
    let error;
    let value = $('.first_name_kana').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.first_name_kana-error').show();
      $('.first_name_kana').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.first_name_kana-error').hide();
      $('.first_name_kana').css({'border':'1px solid #ccc'});
    }
  });
});
$(function(){
  //バリデーション 名カナ
  $('.last_name_kana').on('blur',function(){
    let error;
    let value = $('.last_name_kana').val();
    if(value == ""){
      error = true;}
    if(error){
      $('.last_name_kana-error').show();
      $('.last_name_kana').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.last_name_kana-error').hide();
      $('.last_name_kana').css({'border':'1px solid #ccc'});
    }
  });
});





$(function() {
  // 現在の年月日を取得
  var time = new Date();
  var birth_year = time.getFullYear();
  var birth_month = time.getMonth() + 1;
  var birth_day = time.getDate();

  // 選択された年月日を取得
  var selected_year = document.getElementById("birth_year");
  var selected_month = document.getElementById("birth_month");

  // 年(初期): 1900〜現在の年 の値を設定
  for (var i = birth_year; i >= 1900 ; i--) {
      $('.birth_year').append('<option value="' + i + '">' + i + '</option>');
  }

  // 月(初期): 1~12 の値を設定
  for (var j = 1; j <= 12; j++) {
      $('.birth_month').append('<option value="' + j + '">' + j + '</option>');
  }

  // 日(初期): 1~31 の値を設定
  for (var k = 1; k <= 31; k++) {
      $('.birth_day').append('<option value="' + k + '">' + k + '</option>');
  }

  // 月(変更)：選択された年に合わせて、適した月の値を選択肢にセットする
  $('.birth_year').change(function() {
      selected_year = $('.birth_year').val();

      // 現在の年が選択された場合、月の選択肢は 1~現在の月 に設定
      // それ以外の場合、1~12 に設定
      var last_month = 12;
      if (selected_year == birth_year) {
          last_month = birth_month;
      }
      $('.birth_month').children('option').remove();
      $('.birth_month').append('<option value="' + 0 + '">--</option>');
      for (var n = 1; n <= last_month; n++) {
          $('.birth_month').append('<option value="' + n + '">' + n + '</option>');
      }
  });

  // 日(変更)：選択された年・月に合わせて、適した日の値を選択肢にセットする
  $('.birth_year,#birth_month').change(function() {
      selected_year = $('.birth_year').val();
      selected_month = $('.birth_month').val();

      // 現在の年・月が選択された場合、日の選択肢は 1~現在の日付 に設定
      // それ以外の場合、各月ごとの最終日を判定し、1~最終日 に設定
      if (selected_year == birth_year && selected_month == birth_month ) {
          var last_date = birth_day;
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

      $('.birth_day').children('option').remove();
      $('.birth_day').append('<option value="' + 0 + '">--</option>');
      for (var m = 1; m <= last_date; m++) {
          $('.birth_day').append('<option value="' + m + '">' + m + '</option>');
      }
  });
});





$(function(){
  //バリデーション 生年月日
  $('select').on('blur',function(){
    let error;
    let value = $('#birth_day').val();
    if(value == "0"){
      error = true;}
    if(error){
      $('.birthday-error').show();
      $('select').css({'border':'1px solid #ea352d'});
    }
    else if(!error){
      $('.birthday-error').hide();
      $('select').css({'border':'1px solid #ccc'});
    }
  });
});
