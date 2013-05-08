class MoviesController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
 
  def index
    @movies = Movie.paginate(:page => params[:page] ? params[:page] : 1).order("updated_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @movies }
    end
  end

  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render json: @movie, status: :created, location: @movie }
      else
        format.html { render action: "new" }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  def play
    @movie = Movie.find(params[:id])
    @bdhd = @movie.bdhds.find_by_text(params[:text])

    record_not_found unless @bdhd
    
    if logged_in?
      @bdhd.watched_by(current_user)
    end

    @other_bdhds = @movie.bdhds.delete_if {|b| b.text == params[:text]}

    @comment = Comment.new

    render layout: "application_without_sidebar"
  end

  def search
    @movies = Movie.where("name like ?", "%" + params[:key].to_s + "%");
  end

  private
 
  def record_not_found
    render :file => "#{Rails.root}/public/404.html", :status => :not_found
  end
end
