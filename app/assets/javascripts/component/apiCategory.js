$(function(){
  // 子カテゴリ、孫カテゴリにname属性を設定しないと、DBに保存されない
  $('#middleCategory').attr('name', "item[category_id]");
  $('#subSubCategory').attr('name', "item[category_id]");

  // 親カテゴリ選択時の挙動
  $('#item_category_id').on('change', apiMainCategory);

  // 親カテゴリ再選択時に前のデータを削除
  $('#item_category_id').on('change', function(){
    $('#middleCategory').val('');
    $('#middleCategory').children().remove();
  })

  // 子カテゴリ選択時の挙動
  $(document).on('change', '#middleCategory', apiSubCategory);

  // 子カテゴリ再選択時に前のデータを削除
  $(document).on('change', '#middleCategory', function(){
    $('#subSubCategory').val('');
    $('#subSubCategory').children().remove();
  })

  // 親カテゴリのAPI処理
  function apiMainCategory(){
    $.ajax({
      method: 'GET',
      url: '/api/categories',
      dataType: 'json'
    })
    .done(subCategory)
    .fail(function(){
      console.log('Error')
    })

    // 子カテゴリの生成
    function subCategory(data){
      var selectData = document.getElementById("item_category_id").value
      var ancestryNumber = data.filter(function(item){
        if (item.ancestry === `1/${selectData}`) return true;
      })
      var html = '';
      ancestryNumber.forEach(
        element => html += (`<option value=${element.id}>${element.name}</option>`)
        )
      $('#middleCategory').css('display', 'block').append(html)
    }
  }

  // 子カテゴリーのAPI処理
  function apiSubCategory(){
    $.ajax({
      method: 'GET',
      url: '/api/categories',
      dataType: 'json'
    })
    .done(subSubCategory)
    .fail(function(){
      console.log('Error')
    })

    // 孫カテゴリの生成
    function subSubCategory(data){
      var selectData = document.getElementById("item_category_id").value
      var selectSubData = document.getElementById("middleCategory").value
      var subAncestryNumber = data.filter(function(item){
        if (item.ancestry === `1/${selectData}/${selectSubData}`) return true;
      })
      var html = '';
      subAncestryNumber.forEach(
        element => html += (`<option value=${element.id}>${element.name}</option>`)
        )
      $('#subSubCategory').css('display','block').append(html)
    }
  }
})