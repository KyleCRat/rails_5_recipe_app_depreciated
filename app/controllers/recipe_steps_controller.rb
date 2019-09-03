# frozen_string_literal: true

class RecipeStepsController < ApplicationController
  before_action :set_recipe_step, only: [:show, :edit, :update, :destroy]

  # GET /recipe_steps
  # GET /recipe_steps.json
  def index
    @recipe_steps = RecipeStep.all
  end

  # GET /recipe_steps/1
  # GET /recipe_steps/1.json
  def show
  end

  # GET /recipe_steps/new
  def new
    @recipe_step = RecipeStep.new
  end

  # POST /recipe_steps/build/:id
  def build
    @recipe = Recipe.find(params[:id])
    @recipe_step = RecipeStep.new(recipe: @recipe, stepable: Step.new)
    build_step_ingredient
    @new_uuid = SecureRandom.uuid
  end

  # GET /recipe_steps/1/edit
  def edit
    if @recipe_step.stepable.is_a?(Step)
      build_step_ingredient
    end
  end

  # POST /recipe_steps
  # POST /recipe_steps.json
  def create
    @recipe_step = RecipeStep.new(recipe_step_params)
    @new_uuid = recipe_step_params[:new_uuid]

    respond_to do |format|
      if @recipe_step.save
        format.html { redirect_to @recipe_step, notice: 'Recipe step was successfully created.' }
        format.js   { render :show }
        format.json { render :show, status: :created, location: @recipe_step }
      else
        format.html { render :new }
        format.js   { render :new }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_steps/1
  # PATCH/PUT /recipe_steps/1.json
  def update
    respond_to do |format|
      if @recipe_step.update(recipe_step_params)
        format.html { redirect_to @recipe_step, notice: 'Recipe step was successfully updated.' }
        format.json { render :show }
        format.js { render :show, status: :ok, location: @recipe_step }
      else
        format.html { render :edit }
        format.js   { render :edit }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_steps/1
  # DELETE /recipe_steps/1.json
  def destroy
    @recipe_step.destroy
    respond_to do |format|
      format.html { redirect_to recipe_steps_url, notice: 'Recipe step was successfully destroyed.' }
      format.js   { render :delete }
      format.json { head :no_content }
    end
  end

  # PUT /recipe_steps/sort
  def sort
    params[:recipe_steps].each do |_k, v|
      RecipeStep.find(v[:id]).update_attribute(:position, v[:position])
    end

    head :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe_step
      @recipe_step = RecipeStep.find(params[:id])
    end

    def build_step_ingredient
      unless @recipe_step.stepable.step_ingredients.any?
        @recipe_step.stepable.step_ingredients.build
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_step_params
      params.require(:recipe_step).permit(
        :id,
        :recipe_id,
        :stepable_id,
        :stepable_type,
        :position,
        :new_uuid,
        stepable_attributes: [
          :id,
          :title,
          :description,
          step_ingredients_attributes: [
            :id,
            :_destroy,
            :ingredient_id,
            :technique_id,
            measurements_attributes: [
              :id,
              :unit,
              :scalar,
              :purpose,
              :_destroy
            ],
            ingredient_attributes: [
              :id,
              :title,
              :description,
              :_destroy
            ],
            technique_attributes: [
              :id,
              :title,
              :description,
              :_destroy
            ]
          ]
        ]
      )
    end
end
