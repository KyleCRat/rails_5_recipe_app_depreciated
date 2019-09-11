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

  # Render the stepable_type appropriate to the returned stepable object
  #   attached to the form_builder
  #
  # This method is used for rendering the appropriate form fields when creating
  #   a new step in recipes/edit. If a stepable object has a predefined type
  #   that means that a object is being passed back most likely with an error.
  #   we want to render that field with the error immedeatly visible. So this
  #   method takes the type of the stepable object and renders the appropriate
  #   form field for that object.
  def render_stepable_type(form_builder)
    case form_builder.object.stepable_type
    when 'Recipe'
      render 'recipe_steps/stepable_types/select_recipe', f: form_builder
    when 'Technique'
      render 'recipe_steps/stepable_types/select_technique', f: form_builder
    else
      render 'recipe_steps/stepable_types/build_step', f: form_builder
    end

    # render 'recipe_steps/stepable_types/select_step', f: form_builder
  end

  # This method takes a form_builder object and a type string and will render
  #   an approprite link to create that type's form. Recipe, Technique, and Step
  #   are available to be added to a recipe, if it's anything else (mainly nil)
  #   we are building a new step.
  def render_stepable_type_link(form_builder, type = nil)
    case type
    when 'Recipe'
      name    = 'Select Recipe'
      partial = 'recipe_steps/stepable_types/select_recipe'
    when 'Technique'
      name    = 'Select Technique'
      partial = 'recipe_steps/stepable_types/select_technique'
    when 'Step'
      name    = 'Select Step'
      partial = 'recipe_steps/stepable_types/select_step'
    else
      name    = 'Build Step'
      partial = 'recipe_steps/stepable_types/build_step'
    end

    build_stepable_type_link(name, partial, form_builder)
  end

  def build_stepable_type_link(name, partial, form_builder)
    html = CGI.escapeHTML(render(partial, f: form_builder).to_str).html_safe

    link_to(name,
            'javascript:void(0)',
            class: 'stepable-select',
            'data-type': html)
  end
end
