$(document)
    .on('cocoon:before-insert', '.ingredient-association', function(e, obj) {
      $(e.currentTarget).find('.ingredient-select-fields').hide();
    })
    .on('cocoon:before-remove', '.ingredient-association', function(e, obj) {
      $(e.currentTarget).find('.ingredient-select-fields').show();
    });
