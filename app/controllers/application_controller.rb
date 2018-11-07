# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :create_body_id
  before_action :create_site_theme

  ##################################################
  # Site Initalizing actions
  ##################################################

  # Set the body id to 'controller-action'
  def create_body_id
    @body_id = "#{params[:controller].gsub('_','-')}-#{params[:action].gsub('_','-')}"
  end

  # Set the body class to the site theme name default theme: 'theme-default',
  #   make sure this name matches that in app/assets/stylesheets/themes/themes.scss
  def create_site_theme
    @site_theme = 'theme-default'
  end

  ##################################################
  # Custom pathing for devise sign in and sign out redirects
  ##################################################

  # def after_sign_in_path_for(resource)
  #   '/'
  # end

  def after_sign_out_path_for(resource)
    '/'
  end


  ##################################################
  # Rescue from Pundit unauthorized Errors
  ##################################################

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized
    flash[:warning] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
