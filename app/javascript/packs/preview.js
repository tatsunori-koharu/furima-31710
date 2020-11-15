if (document.URL.match( /new/) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-area');
    document.getElementById('item-image').addEventListener('change', function(e){
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      //画像を表示させるためのdiv要素生成
      const imageElement = document.createElement('div');

      //表示する画像生成
      const blobImage = document.createElement('img');
      blobImage.width = 300;
      blobImage.height = 180;
      blobImage.setAttribute('src', blob);

      //生成したHTMLの要素をブラウザに表示させる
      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    });
  });
}