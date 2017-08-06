class BicyclesController < ApplicationController
  load_and_authorize_resource

  before_action :initialize_bicycle, except: %i(index create)
  before_action :initialize_categories, only: %i(index show)

  def index
    @bicycles = Bicycle.search(params[:param], bicycles).paginate(page: params[:page], per_page: 2)
  end

  def show
  end

  def create
    @bicycle = Bicycle.create(bicycle_params)

    redirect_to users_bicycles_path
  end

  def update
    @bicycle.update_attributes(bicycle_params)

    redirect_to users_bicycles_path
  end

  def destroy
    @bicycle.destroy

    redirect_to users_bicycles_path
  end

  def use
    current_user.usages.create(bicycle_id: @bicycle.id)

    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

  def bicycles
    bicycles = Bicycle.where.not(id: current_user&.usages&.pluck(:bicycle_id))
    return bicycles.where(category_id: params[:category_id]) if params.key?(:category_id)

    bicycles
  end

  def bicycle_params
    params.require(:bicycle).permit(
        :name,
        :description,
        :image,
        :category_id
    ).merge(
        user_id: current_user.id
    )
  end

  def initialize_bicycle
    @bicycle = Bicycle.find(params[:id])
  end

  def initialize_categories
    @categories = Category.all
  end
end
