$(function(){
  $('#item_money').keyup(function(){
    console.log('hello')
    var getValue = $('#item_money').val()
    if (parseInt(getValue) > 300){
      var commisionValue = Math.round(parseInt(getValue) * 0.1)
      $('#sellCommision').html(`<div class='sellCommisionResult'>${commisionValue}</div>`)
      var benefitValue = Math.round(getValue - commisionValue)
      $('#sellBenefit').html(`<div>${benefitValue}</div>`)
    } else {
      $('#sellCommision').html(`<div> -- </div>`)
      $('#sellBenefit').html(`<div> -- </div>`)
    }
  })
})