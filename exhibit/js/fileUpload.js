function previewFile(file) {
    // プレビュー画像を追加する要素
    const preview = document.getElementById("preview");

    // FileReaderオブジェクトを作成
    const reader = new FileReader();

    // URLとして読み込まれたときに実行する処理
    reader.onload = function (e) {
        const imageUrl = e.target.result; // URLはevent.target.resultで呼び出せる
        const img = document.createElement("img"); // img要素を作成
        img.src = imageUrl; // URLをimg要素にセット
        preview.appendChild(img); // #previewの中に追加
    };

    // いざファイルをURLとして読み込む
    reader.readAsDataURL(file);
}
// ファイルが選択されたときの処理
const fileInput = document.getElementById("exhibitImg");
const handleFileSelect = () => {
    const files = fileInput.files;
    if (files.length <= 5) {
        for (let i = 0; i < files.length; i++) {
            previewFile(files[i]);
            console.log(fileInput.files);
        }
    } else {
        alert('画像枚数は最大５枚までです');
        file.value = '';
        console.log(fileInput.files);
    }
};
fileInput.addEventListener("change", function () {
    previewDelete();
    handleFileSelect();
});

// ファイル削除機能
const file = document.getElementById('exhibitImg');
let preview = document.getElementById('preview');
document.getElementById('clear').addEventListener('click', function() {
    file.value = '';
    previewDelete();
})

function previewDelete() {
    while (preview.firstChild) {
        preview.removeChild(preview.firstChild);
    }
}