module Users
  class BicyclesController < ApplicationController
    def index
      @bicycles = current_user.bicycles.paginate(page: params[:page], per_page: 10)
    end

    def new
      @bicycle = Bicycle.new
    end

    def edit
      @bicycle = Bicycle.find(params[:id])
    end
  end
end
