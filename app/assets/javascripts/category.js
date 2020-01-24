$(document).on('turbolinks:load',function(){
  function appendOption(category){
    var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = ` <div class="children__box">
                          <select class="category" id="child_category" name="">
                            <option value="--" data-category="--">--</option>
                            ${insertHTML}
                          <select>
                        </div>`;
    $('.children').append(childSelectHtml);
  }

  function appendGrandchidrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `  <div class="grandchildren__box">
                                <select class="category" id="grandchild_category" name="good[category_id]">
                                  <option value="--" data-category="--">--</option>
                                  ${insertHTML}
                                </select>
                              </div>`;
    $('.grandchildren').append(grandchildSelectHtml);
  }

  function appendSizeBox(){
    var sizeSelectHtml = '';
    sizeSelectHtml = `    <div class="append-box__wrapper">
                            <div class="upload-box__head upload-box__condition">
                              <h3 class="smaller">サイズ</h3>
                              <span>必須</span>
                            </div>
                            <div class="upload-box__input">
                              <div class="upload-box__input__select">
                                <select name="good[size]">
                                  <option value="--" data-category="--">--</option>
                                  <option value="S" data-category="S">S</option>
                                  <option value="M" data-category="M">M</option>
                                  <option value="L" data-category="L">L</option>
                                </select>
                              </div>
                            </div>
                          </div>
                            <div class="upload-box__head upload-box__condition">
                              <h3 class="smaller">ブランド</h3>
                              <span class="brand-span">任意</span>
                            </div>
                            <div class="upload-box__input">
                              <div class="upload-box__input__select">
                                <input type="text" placeholder="例)シャネル"name="good[brand]">
                              </div>
                            </div>
                          </div>`;
    $('.append-box').append(sizeSelectHtml);
  }

  $('#parent_category').on('change', function(){
    var parentCategory = document.getElementById('parent_category').value;
    if (parentCategory != "--"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        $('.children__box').remove();
        $('.grandchildren__box').remove();
        $('.append-box__wrapper').remove();
        $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('.children__box').remove();
      $('.grandchildren__box').remove();
      $('.append-box__wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
 
  $('.children').on('change', '#child_category', function(){
    var childId = $('#child_category option:selected').data('category');
    if (childId != "--"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_id: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if (grandchildren.length != 0) {
          $('.grandchildren__box').remove();
          $('.append-box__wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchidrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('.grandchildren__box').remove();
      $('.append-box__wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });

  $('.grandchildren').on('change', '#grandchild_category', function(){
    var grandchildId = $('#grandchild_category option:selected').data('category');
    if (grandchildId != "--"){
      $('.append-box__wrapper').remove();
      appendSizeBox()
    }else{
      $('.append-box__wrapper').remove();
    }
  });
});