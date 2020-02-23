$(document).on('turbolinks:load',function(){
  const priceInput = '#good_fee';

  // 価格入力時に手数料、利益計算
  $(priceInput).on('input', function(){   //リアルタイムで表示したいのでinputを使う｡入力の度にイベントが発火するようになる｡
    var data = $('#good_fee').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.margin-ten').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.margin-ten').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.profit-hyphen').html(profit)
    $('.profit-hyphen').prepend('¥')
    if(profit == '') {   // もし､計算結果が''なら表示は"-"｡
    $('.profit-hyphen').html('-');
    $('.margin-ten').html('-');
    }
  })
  
  // 編集時の手数料、利益計算
  $(priceInput).ready(function(){   //リアルタイムで表示したいのでinputを使う｡表示の度にイベントが発火するようになる｡
    var data = $('#good_fee').val(); // val()でフォームのvalueを取得(数値)
    var profit = Math.round(data * 0.9)  // 手数料計算を行う｡dataにかけているのが0.9なのは単に引きたい手数料が10%のため｡
    var fee = (data - profit) // 入力した数値から計算結果(profit)を引く｡それが手数料となる｡
    $('.margin-ten').html(fee) //  手数料の表示｡html()は追加ではなく､上書き｡入力値が変わる度に表示も変わるようにする｡
    $('.margin-ten').prepend('¥') // 手数料の前に¥マークを付けたいので
    $('.profit-hyphen').html(profit)
    $('.profit-hyphen').prepend('¥')
    if(profit == '') {   // もし､計算結果が''なら表示は"-"｡
    $('.profit-hyphen').html('-');
    $('.margin-ten').html('-');
    }
  })
});