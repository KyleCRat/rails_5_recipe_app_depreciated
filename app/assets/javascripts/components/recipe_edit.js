Site.recipeEdit = function() {
    $(document).on('click', '.stepable-select', function(e) {
        html = $(e.currentTarget).data('type');
        $(e.currentTarget).siblings('.stepable-select-fields').html(html);
    });

    set_positions();

    $('.order-recipe-steps').sortable({
        placeholder: "sortable-placeholder",
        start: function(e, ui) {
            ui.placeholder.height(ui.item.outerHeight() + 4);
        },
        stop: function(e, ui) {
        }
    });

    $('.order-recipe-steps').sortable({
        handle: '.handle'
    }).bind('sortupdate', function(e, ui) {
        // array to store new order
        updated_order = [];
        // set the updated positions
        set_positions();

        // populate the updated_order array with the new task positions
        $('.order-recipe-steps .recipe-step').each( function(i) {
            updated_order.push( { id: $(this).data("id"), position: i + 1 } );
        });

        // send the updated order via ajax
        $.ajax({
            type: 'PUT',
            url: '/recipe_steps/sort',
            data: { recipe_steps: updated_order }
        });
    });
};

set_positions = function() {
    $('.order-recipe-steps .recipe-step').each( function(i) {
        $(this).attr("data-pos", i + 1);
    });
};
