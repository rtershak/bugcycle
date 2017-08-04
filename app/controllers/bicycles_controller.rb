class BicyclesController < ApplicationController
  before_action :initialize_bicycle, except: %i(index create)

  def index
    @bicycles = Bicycle.paginate(page: params[:page], per_page: 2)
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

  private

  def bicycle_params
    params.require(:bicycle).permit(
        :name,
        :description,
        :image
    ).merge(
        user_id: current_user.id,
        category_id: Category.first.id
    )
  end

  def initialize_bicycle
    @bicycle = Bicycle.find(params[:id])
  end
end
