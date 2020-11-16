if (document.URL.match( /new/) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-area');
    //選択した画像を表示
    const createImageHTML = (blob) => {
      //画像表示のdiv生成
      const imageElement = document.createElement('div');
      const nameElement = document.createElement('name')
      //表示する画像を生成
      const blobImage = document.createElement('img');
      blobImage.width = 300;
      blobImage.height = 180;
      blobImage.setAttribute('src', blob);
      //生成したHTMLの要素をブラウザに表示させる
      nameElement.appendChild(blobImage);
      imageElement.appendChild(nameElement);
      ImageList.appendChild(imageElement);
    };

    document.getElementById('item-image').addEventListener('change', function(e){
      //画像が表示されていれれば既存を削除
      const imageContent = document.querySelector('name');
      console.log(imageContent)
      if (imageContent){
        imageContent.remove();
      }
      
      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}