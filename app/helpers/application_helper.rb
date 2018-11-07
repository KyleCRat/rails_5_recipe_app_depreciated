# frozen_string_literal: true

module ApplicationHelper
  def content_editable?
    'content-editable' if user_signed_in? && user.auth_tier_4?
  end

  # render a svg img as inline code
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/#{name.gsub('.svg', '')}"
    svg = "#{file_path}.svg"
    return File.read(svg).html_safe if File.exist?(svg)
    png_path = "#{file_path}.png"
    png = "#{name}.png"
    puts png
    return image_tag(png) if File.exist?(png_path)
    "No SVG or PNG found at: #{file_path}"
  end

  # helper method for defining page titles
  def title(title = nil)
    if title.present? && !ENV['DEFAULT_META_TITLE'].blank?
      content_for :title, title + ' | ' + ENV['DEFAULT_META_TITLE']
    elsif title.present?
      content_for :title, title
    else
      content_for :title, ENV['DEFAULT_META_TITLE']
    end
  end

  # helper method for defining meta descriptions
  def meta_description(desc = nil)
    if desc.present?
      content_for :meta_description, desc
    elsif content_for?(:meta_description)
      content_for :meta_description
    else
      ENV['DEFAULT_META_DESCRIPTION']
    end
  end
end
