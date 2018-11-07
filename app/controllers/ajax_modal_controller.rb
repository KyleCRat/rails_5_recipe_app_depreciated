# frozen_string_literal: true

class AjaxModalController < ApplicationController
  respond_to do |format|
    format.js  { render 'new' }
    format.all { render nothing: true, status: 200 } # for bots
  end

  def index

  end

  def new

  end

  def create

  end
end
