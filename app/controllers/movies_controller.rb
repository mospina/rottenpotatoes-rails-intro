class MoviesController < ApplicationController

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    @all_ratings = Movie.all_ratings
    if need_redirect?
      redirect_to movies_path(redirect_query_string)
      flash.keep
      return
    end

    @movies = Movie.with_ratings(rating_params).order(order_by_params)
  end
  
  def rating_params
    @ratings = params.key?(:ratings) ? params[:ratings].keys : session[:ratings]
    session[:ratings] = @ratings
  end

  def order_by_params
    @order_by = params.key?(:order_by) ? params[:order_by] : session[:order_by]
    session[:order_by] = @order_by
  end

  def need_redirect?
    if !params.key?(:order_by) && session.key?(:order_by)
      return true
    elsif !params.key?(:ratings) && session.key?(:ratings)
      return true
    else
      return false
    end
  end
    
  def redirect_query_string
    query_string = {}
    query_string[:order_by] = order_by_params if order_by_params.present?
    if rating_params.present?
      query_string[:ratings] = rating_params.reduce({}) { |acc, i| acc.merge({ i => '1'}) } 
    end
    query_string
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

end
