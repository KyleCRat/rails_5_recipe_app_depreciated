$(document)
    .on('cocoon:before-insert', '.technique-association', function(e, obj) {
        $(e.currentTarget).find('.technique-select-fields').hide();
    })
    .on('cocoon:before-remove', '.technique-association', function(e, obj) {
        $(e.currentTarget).find('.technique-select-fields').show();
    });
