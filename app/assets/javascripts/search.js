$('#searching-form').on('keyup', function(e){
  var input = $("#searching-form").val();

  $.ajax({
      type: 'GET',                // HTTPメソッドはGETで
      url:  '/posts',             // /usersのURLに (これによりusersコントローラのindexアクションが起動)
      data: { keyword: input},    // keyword: inputを送信する
      dataType: 'json'            // サーバから値を返す際はjsonである
  })

  .done(function(users){                // usersにjson形式のuser変数が代入される。複数形なので配列型で入ってくる

      if (input.length === 0) {         // フォームの文字列長さが0であれば、インクリメンタルサーチ結果を表示しないようにする
          $('#user-search-result').empty();
        }

      else if (input.length !== 0){     // 値が等しくないもしくは型が等しくなければtrueを返す。
          $('#user-search-result').empty();
          users.forEach(function(user){ // users情報をひとつずつとりだしてuserに代入
              appendUser(user)
          });
      }

      else {
          $('#user-search-result').empty(); // ユーザーが見つからなければ「見つからない」を返す。
          appendErrMsgToHTML("一致するユーザーが見つかりません");
      }
  })

  .fail(function() {
      alert('ユーザー検索に失敗しました');
  });
});