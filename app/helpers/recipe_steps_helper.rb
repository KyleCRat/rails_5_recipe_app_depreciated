# frozen_string_literal: true

module RecipeStepsHelper
  def render_recipe_step_ajax_edit_field(step)
    model_name = step.model_name.human
    param_key  = step.model_name.param_key
    id         = step.id
    html_key   = "recipe_step_edit_#{param_key}_#{id}"

    html = content_tag(:div, id: html_key) do
      link_to model_name, remote_form_step_path(step), method: :post, remote: true
    end

    html.html_safe
  end
end
