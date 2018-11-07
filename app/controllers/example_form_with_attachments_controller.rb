# frozen_string_literal: true

class ExampleFormWithAttachmentsController < ApplicationController

  def new
  @form = ExampleFormWithAttachments.new
  end

  def create
    @form = ExampleFormWithAttachments.new(message_params)

    if @form.valid? and not_bot?
      @form.first_name = @form.ex_f_n
      @form.last_name = @form.ex_l_n
      Notifier.form(@form).deliver
      render :create
    else
      flash[:alert] = "An error occurred while delivering this message."
      render :new
    end
  end

private

  def message_params
    params.require(:form).permit(:first_name, :ex_f_n, :last_name, :ex_l_n, :email, :phone_primary, :phone_cell, :message).tap do |whitelisted|
      whitelisted[:attachments] = params[:form][:attachments]
    end
  end

  def not_bot?
    @form.first_name.blank?
    @form.last_name.blank?
  end

end
