$(function(){
  result = document.getElementById('item_category_id').value
  $('#item_category_id').on('change', function(){
    document.getElementById('item_category_id').insertAdjacentHTML('afterend', '<select name="item[category_id]" id="item_category_id"></select>')
  })
})