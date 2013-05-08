class CategoryController < ApplicationController
  def show
    @movies = Movie.paginate(:page => params[:page] ? params[:page] : 1).find_all_by_category(params[:category_name])
    if params[:page].nil?
      @category_total_count = Movie.find_all_by_category(params[:category_name]).size
    end
  end
end