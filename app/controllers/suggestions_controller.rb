class SuggestionsController < ApplicationController
  load_and_authorize_resource

  before_action :authenticate_user!
  before_action :set_bicycle
  before_action :set_suggestion, only: %i(edit update destroy)

  def index
    @suggestions = @bicycle.suggestions.paginate(page: params[:page], per_page: 5)
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

    destroy
  end

  def destroy
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
