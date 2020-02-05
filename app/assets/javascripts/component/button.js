$(function(){
  // サイドバーのボタン色変化
  
  $('.sideBar__item a').each(function(){
    var $href = $(this).prop('href');
    if(location.href.match($href)) {
      $('.sideBar__item').removeClass('isSideButton');
      $(this).parent().addClass('isSideButton');
    } else {
      $(this).removeClass('isSideButton');
    }
  });

  // $(".sideBar__item").on('click', function(){
  //   $('.sideBar__item').removeClass('isSideButton');
  //   $(this).addClass('isSideButton');
  // });
  
  // タブ切り替え色変化
  $(".mypageNews__tab").on('click', function(e){
    e.preventDefault();
    $('.mypageNews__tab').removeClass('isMypageButton');
    $(this).toggleClass('isMypageButton');
  });
    $(".mypagePurchase__tab").on('click', function(e){
    e.preventDefault();
    $('.mypagePurchase__tab').removeClass('isMypageButton');
    $(this).toggleClass('isMypageButton');
  });
});
