Site.recipeEdit = function() {
    // $(document).on('click', '.stepable-select', function(e) {
    //     html = $(e.currentTarget).data('type');
    //     $(e.currentTarget).siblings('.stepable-select-fields').html(html);
    // });

    $(document).on("click", ".stepable-select", function(e) {
        html = $(e.currentTarget).data("type");
        $(e.currentTarget).siblings(".stepable-select-fields").html(html);
    });

    set_positions();

    $(document).on("mousedown", ".handle", function(e){
        $(e.currentTarget).parents(".order-recipe-steps").height($(".order-recipe-steps").outerHeight() + 16);
    });

    $(".order-recipe-steps").sortable({
        placeholder: "sortable-placeholder",
        handle: ".handle",
        start(e, ui) {
            ui.placeholder.height(ui.item.outerHeight() + 4);
            $(this).height($(this).height());
        },
        stop(e, ui) {
            $(this).height("auto");
        }
    }).bind("sortupdate", function(e, ui) {
        // array to store new order
        updatedOrder = [];
        // set the updated positions
        set_positions();

        // populate the updatedOrder array with the new task positions
        $(".order-recipe-steps .recipe-step").each( function(i) {
            updatedOrder.push( { id: $(this).data("id"), position: i + 1 } );
        });

        // send the updated order via ajax
        $.ajax({
            type: "PUT",
            url: "/recipe_steps/sort",
            data: { recipe_steps: updatedOrder }
        });
    });
};

set_positions = function() {
    $(".order-recipe-steps .recipe-step").each( function(i) {
        $(this).attr("data-pos", i + 1);
    });
};
