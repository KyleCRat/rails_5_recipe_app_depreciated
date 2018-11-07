# frozen_string_literal: true

class UserPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @user = model
  end

  def home?
    @current_user.auth_tier_0?
  end

  def index?
    @current_user.auth_tier_0?
  end

  def show?
    @current_user.auth_tier_5? || @current_user == @user
  end

  def update?
    @current_user.auth_tier_5?
  end

  def destroy?
    return false if @current_user == @user
    @current_user.auth_tier_5?
  end
end
