$(function(){
  // サイドバーのボタン色変化
  $(".sideBar__item").on('click', function(e){
    e.preventDefault();
    $('.sideBar__item').removeClass('isSideButton');
    $(this).toggleClass('isSideButton');
  });

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
