module RecipeStepsHelper
  def render_recipe_step_ajax_edit_field(step)
    model_name = step.model_name.human
    param_key  = step.model_name.param_key
    route_key  = step.model_name.route_key
    id         = step.id
    html_key   = "recipe_step_edit_#{param_key}_#{id}"
    btn_key    = html_key + '_btn'

    html = content_tag(:div) do
      if step.is_a? Step
        content_tag(:div, render(step).html_safe, id: html_key) +
          link_to("Edit #{model_name}", edit_step_path(step), remote: true, id: btn_key)
      else
        link_to("View #{model_name}",
                "/#{route_key}/#{id}/edit",
                onclick: "return confirm('Are you sure you want to quit editing this recipe?')")
      end
    end

    html.html_safe
  end
end
