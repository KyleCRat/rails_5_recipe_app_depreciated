module RecipeStepsHelper
  # take a stepable relation to a recipe and render the correct html to edit
  #   the relationship on the recipes edit page
  def render_recipe_step_ajax_edit_field(stepable)
    model_name = stepable.model_name.human
    param_key  = stepable.model_name.param_key
    route_key  = stepable.model_name.route_key
    id         = stepable.id
    html_key   = "recipe_step_edit_#{param_key}_#{id}"
    btn_key    = html_key + '_btn'

    if stepable.is_a? Step
      html = content_tag(:div, render(stepable).html_safe, id: html_key) +
             link_to("Edit #{model_name}", edit_step_path(stepable), remote: true, id: btn_key)
    else
      html = link_to("View #{model_name}",
                     "/#{route_key}/#{id}/edit",
                     onclick: "return confirm('Are you sure you want to quit editing this recipe?')")
    end

    html.html_safe
  end
end
