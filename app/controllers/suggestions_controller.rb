class SuggestionsController < ApplicationController
  before_action :set_bicycle
  before_action :set_suggestion, only: %i(edit update)

  def index
    @suggestions = Suggestion.where(bicycle_id: @bicycle.id).paginate(page: params[:page], per_page: 5)
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    current_user.suggestions.create(suggestion_params)

    redirect_to @bicycle, notice: 'Suggested!'
  end

  def edit
  end

  def update
    @bicycle.update_attributes(suggestion_params.except(:bicycle))
    @suggestion.destroy

    redirect_to bicycle_suggestions_path(@bicycle)
  end

  private

  def set_bicycle
    @bicycle = Bicycle.find(params[:bicycle_id])
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end

  def suggestion_params
    params.require(:suggestion).permit(
        :name,
        :description
    ).merge(
         bicycle: @bicycle
    )
  end
end
