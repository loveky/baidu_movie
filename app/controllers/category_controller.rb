class CategoryController < ApplicationController
    def show
        @movies = Movie.paginate(:page => params[:page] ? params[:page] : 1).find_all_by_category(params[:category_name])
    end
end