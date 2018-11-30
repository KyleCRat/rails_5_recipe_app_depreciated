$(document)
.on('cocoon:before-insert', '.ingredient-association', function(e, obj) {
  $(e.currentTarget).find('.new-ingredient').hide();
  $(e.currentTarget).find('.add-ingredient').hide();
})
.on('cocoon:before-remove', '.ingredient-association', function(e, obj) {
  $(e.currentTarget).find('.new-ingredient').show();
  $(e.currentTarget).find('.add-ingredient').show();
});
