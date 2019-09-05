class RecipeDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  def description_preview
    if object.description.to_plain_text.length > 80
      object.description.to_plain_text[0..80] + '…'
    else
      object.description.to_plain_text
    end
  end
end
