class RecipeDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  def description_preview
    if object.description.length > 80
      object.description[0..80] + '…'
    else
      object.description
    end
  end
end
