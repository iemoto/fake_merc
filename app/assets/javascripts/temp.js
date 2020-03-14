$(function(){
  //画像用のinputを生成する関数
  const buildFileField = (index)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image_url]"
                    id="item_images_attributes_${index}_image_url">
                    <div class="js-remove">削除</div>
                  </div>`;
    return html;
  }

  const buildingImg = (index, url) => {
    const html = `<img data-index="${index}" src="${url}" width="100px" height="100px">`;
    return html;
  }

  //file_fieldのnameに動的なindexをつける為の配列
  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  //既に使われているindexを除外
  //:last==セレクタ指定で最後の要素を取得
  //.spliceメソッド古い要素を削除して、新しい要素を追加で配列の内容を変更
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);
  $('.hidden-destroy').hide();
  $('#image-box').on('change', '.js-file', function(e) {
    const targetIndex = $(this).parent().data('index');
    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);
    //fileIndexの先頭の数字をinputを作る
    $('.boxFileSelect').append(buildFileField(fileIndex[0]));
    fileIndex.shift();
    //末尾の数に１足した数を追加する
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#image-box').on('click', '.js-remove', function(){
    const targetIndex = $(this).parent().data('index')
    //該当indexを振られているチェックボックスを取得する
    const hiddenCheck = $(`input[data-index"${targetIndex}").hidden-destroy`);
    //もしチェックボックスが存在すればチェックが入れる
    if (hiddenCheck) hiddenCheck.prop('checked', true);
    $(this).parent().remove();
    //画像入力蘭が0個にならないようにしておく
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });
});