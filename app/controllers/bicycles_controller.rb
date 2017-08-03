class BicyclesController < ApplicationController
  def index
    @bicycles = Bicycle.paginate(page: params[:page], per_page: 3)
  end
end
