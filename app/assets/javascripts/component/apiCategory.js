$(function(){
  $('#item_category_id').on('change',apiData);
  function apiData(){
    $.ajax({
      method: 'GET',
      url: '/api/categories',
      dataType: 'json'
    })
    .done(output)
    .fail(function(){
      console.log('Error')
    })

    function output(data){
      console.log(data);
      var selectData = document.getElementById("item_category_id").value
      console.log(selectData)
      var ancestryNumber = data.filter(function(item, index){
        if (item.ancestry === `1/${selectData}`) return true;
      })
      console.log(ancestryNumber);

      var html = '';
      var hoge = ancestryNumber.forEach(
        element => html += (`<option value=${element.id}>${element.name}</option>`)
        )
        console.log(html)
      $('#middleCategory').remove();
      $('#item_category_id').after("<select name='item[category_id]' id='middleCategory' style='margin-top:25px;width:100%;height:48px;color: #222;background-color: white;border-radius: 4px;border: 1px solid #ccc;font-size: 16px;'>","</select>").ready(function(){
        $('#middleCategory').append(html)
      })
      // $('#item_category_id').innerHTML = `<h1>hello</h1>`
      // $('#middleCategory').innerHTML = html;
      // $('#item_category_id').after('</select>')
      // console.log(data[0]);
      // console.log(data[categories][0]);
      // console.log(data[categories][0]);
    }
  }
})