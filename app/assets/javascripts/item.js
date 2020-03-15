$(function(){
  // 画像の複数投稿
  $('#image-box').on('change', '.js-file', function(e) {
    const file = e.target.files[0];
    const url = window.URL.createObjectURL(file);
    // $('input-default').remove()
    $('#previews').append(buildFileField(fileIndex[0], url));
    fileIndex.shift();
    fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
  });

  $('#previews').on('click', '.js-remove', function(){
    // const targetIndex = $(this).parent().data('index')
    // const hiddenCheck = $(`input[data-index"${targetIndex}").hidden-destroy`);
    $(this).parent().remove();
    // if (hiddenCheck) hiddenCheck.prop('checked', true);
    if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
  });



  //画像用のinputを生成する関数
  const buildFileField = (index, url)=> {
    const html = `<div data-index="${index}" class="js-file_group">
                    <div>
                    <img data-index="${index}"
                    class="boxFileSelect"
                    src="${url}"
                    width="100px" height="100px"
                    style="background-color: rgb(245, 245, 245);">
                    </div>
                    <input class="js-file" type="file"
                    name="item[images_attributes][${index}][image_url]"
                    id="item_images_attributes_${index}_image_url">
                    <div class="js-remove">削除!!!</div>
                  </div>`;
    $('.boxFileSelect').css('width',`100%/${index}`)
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];
  lastIndex = $('.js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  // $('.hidden-destroy').hide();

}); 

// $(function(){
  
//   var fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   $('#image-box').on('change', '.js-file', function(e){
//     var file = e.target.files[0];
//     $('.image-box').append(buildInputField(file))
//   })


//   function buildPreview() {
//   }

//   // function index(){
//     // var fileIndex = [1,2,3,4,5,6,7,8,9,10];
//     // var index = fileIndex.shift();
//   //   return index;
//   // }

//   function buildInputField(file) {
//     // var index = 0;
//     var index = fileIndex.shift();

//     // if (index = 0){
//     //   index += 1;
//     // }
//     // const index = 1;
//     const url = window.URL.createObjectURL(file);
//     const html = `<div data-index="${index}" class="js-file_group">
//                     <input 
//                       class="js-file input-default"
//                       type="file" 
//                       name="item[images_attributes][${index}][image_url]" 
//                       id="item_images_attributes_${index}_image_url"
//                     >
//                     <div>
//                       <img data-index="${index}" 
//                         class="boxFileSelect" 
//                         src="${url}" 
//                         width="100px" height="100px" 
//                         style="background-color: rgb(245, 245, 245);">
//                     </div>
//                     <div class="js-remove">
//                       削除!!
//                     </div>
//                   </div>
//                   `;
//     return html;
//   }







//   // // file_fieldのnameに動的なindexをつける為の配列
//   // let fileIndex = [1,2,3,4,5,6,7,8,9,10];
//   // // 既に使われているindexを除外
//   // lastIndex = $('.js-file_group:last').data('index');
//   // fileIndex.splice(0, lastIndex);

//   // $('.hidden-destroy').hide();

  
  
  
  
//   // $('#image-box').on('change', '.js-file', function(e) {
//   //   const targetIndex = $(this).parent().data('index');
//   //   // ファイルのブラウザ上でのURLを取得する
//   //   const file = e.target.files[0];
//   //   const blobUrl = window.URL.createObjectURL(file);
//   //   // 該当indexを持つimgがあれば取得して変数imgに入れる(画像変更の処理)
//   //   if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
//   //     img.setAttribute('src', blobUrl);
//   //   } else {  // 新規画像追加の処理
//   //     $('#previews').append(buildImg(targetIndex, blobUrl));
//   //     // fileIndexの先頭の数字を使ってinputを作る
//   //     $('#image-box').append(buildFileField(fileIndex[0]));
//   //     fileIndex.shift();
//   //     // 末尾の数に1足した数を追加する
//   //     fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
//   //   }
//   // });

  
  
  
  
//   // $('#image-box').on('click', '.js-remove', function() {
//   //   const targetIndex = $(this).parent().data('index');
//   //   // 該当indexを振られているチェックボックスを取得する
//   //   const hiddenCheck = $(`input[data-index="${targetIndex}"].hidden-destroy`);
//   //   // もしチェックボックスが存在すればチェックを入れる
//   //   if (hiddenCheck) hiddenCheck.prop('checked', true);

//   //   $(this).parent().remove();
//   //   $(`img[data-index="${targetIndex}"]`).remove();

//   //   // 画像入力欄が0個にならないようにしておく
//   //   if ($('.js-file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   // });
// });