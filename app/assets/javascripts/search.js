
$(document).on('turbolinks:load', function(){
// searching-formを定義するよ
const inputForm = $('#searching-form');
// location.hrefはURLの取得、画面遷移
const url = location.href;
// .result ul を定義
const searchResult = $('.result ul');

function builtHTML(data){
    let html = `
    <li>${data.name}</li>
    `
    searchResult.append(html);
    }

    function NoResult(message){
    let html = `
    <li>${message}</li>
    `
    searchResult.append(html);
}

    // フォームに入力すると発火する
    inputForm.on('keyup', function(){
        const target = $(this).val();
        search(target);
    });

    // ajax処理
    function search(target){
    $.ajax({
        type: 'GET',
        url: 'goods/search',
        data: {keyword: target},
        dataType: 'json'
    })
    .done(function(data){
        searchResult.empty(); //再度検索した際に前のデータを消す処理
        if (data.length === 0){
            searchResult.empty();
        }
        else if(data.length !== 0) {
        data.forEach(function(data) { //dataは配列型に格納されているのでEach文で回す
            builtHTML(data)
        });
        } else  {
        NoResult('該当する商品はありません')
        }
    })
    .fail(function(data){
        alert('非同期通信に失敗しました');
    })
    }
});