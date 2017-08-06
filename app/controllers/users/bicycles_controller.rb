module Users
  class BicyclesController < ApplicationController
    before_action :initialize_categories, only: %i(new edit)

    def index
      @bicycles = current_user.bicycles.paginate(page: params[:page], per_page: 10)
    end

    def new
      @bicycle = Bicycle.new
    end

    def edit
      @bicycle = Bicycle.find(params[:id])
    end

    private

    def initialize_categories
      @categories = Category.all
    end
  end
end
