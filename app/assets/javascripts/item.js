$(function(){
  // 使用する変数
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // 画像の複数投稿
  $('#image-box').on('change', '.js-file', function(e) {
    const file = e.target.files[0];
    const url = window.URL.createObjectURL(file);
    $('#previews').append(buildFileField(fileIndex[0], url));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
    $('.isTmpArea').remove();
  });

  $('.hidden-destroy').hide();
  

  // 投稿予定画像の削除
  $(document).on('click', '.js-remove', function(){
    $(this).parent().remove();
  })

  $('#image-box').on('click', '.js-remove', function() {
    const targetIndex = $(this).parent().data('index');
    // 該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
    // もしチェックボックスが存在すればチェックを入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);

    $(this).parent().remove();
    $(`img[data-index="${targetIndex}"]`).remove();

    // 画像入力欄が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });



  // 画像のプレビュー表示
  const buildFileField = (index, url)=> { 
    tmpIndex = Math.floor(parseInt(index)/5)
    const sizeIndex = index - tmpIndex*5;
    const html = `<div data-index="${index}" class="js-file_group">
                    <div>
                      <img data-index="${index}"
                      class="secondBoxFileSelect"
                      src="${url}"
                      width="120px" height="120px"
                      style="margin-right: 10px;">
                    </div>
                    <div class='js-remove'>
                      delete
                    </div>
                  </div>
                  <label class="label${index}" style="width: calc(100% - ${sizeIndex}*130px);">
                    <p class="boxFileSelect" id="item_images_attributes_${index}_image_url">
                      <i class="fa fa-camera">
                        <input class="js-file input-default" type="file"
                        name="item[images_attributes][${index}][image_url]"
                        >
                      </i>
                    </p>
                  </label>
                  `;

    $(document).on('change', `#item_images_attributes_${index}_image_url`, function(){
      $(`#item_images_attributes_${index}_image_url`).css('display','none')
      $(`.label${index}`).css('display','none')
    })

    return html;
  }
});