class Api::MoviesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:make_favourite]  
  before_action :set_movie, only: [:show, :make_favourite]

  def index
    render json: { movies: Movie.all }, status: 200
  end

  def show
    unless @movie
      return render json: { message: 'Movie not found' }, status: 404
    end
    render json: { movie: @movie }, status: 200
  end
  
  def make_favourite
    user = User.find_by_id(params[:user_id])
    if @movie.present? && user.present?
      user.favourite_movies << @movie
      @movie.update_column(:favorited, (@movie.favorited + 1))
      return render json: { message: 'Movie is made favourite for this user.' }, status: 200
    end
    render json: { message: 'Movie or user not found.' }, status: 200
  end

  private
  def set_movie
    @movie = Movie.find_by_id(params[:id])
  end
end