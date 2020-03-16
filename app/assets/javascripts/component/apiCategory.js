$(function(){
  $('#item_category_id').on('change', apiMainCategory);
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

  $(document).on('change', '#middleCategory', apiSubCategory);
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

    function subSubCategory(data){
      var selectData = document.getElementById("item_category_id").value
      var selectSubData = document.getElementById("middleCategory").value
      var ancestryNumber2 = data.filter(function(item){
        if (item.ancestry === `1/${selectData}/${selectSubData}`) return true;
      })

      var html = '';
      ancestryNumber2.forEach(
        element => html += (`<option value=${element.id}>${element.name}</option>`)
        )
      $('#subSubCategory').css('display','block').append(html)
    }
  }
})