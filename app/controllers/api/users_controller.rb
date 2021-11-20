class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    user = User.find_or_initialize_by(user_params)
    if !user.new_record? 
      render json: { message: 'User already exists' }, status: 200
    elsif user.save
      render json: { message: 'User is created successfully' }, status: 201
    else
      render json: { message: user.errors.full_messages }, status: 422
    end
  end

  def favourite_movies
    user = User.find_by_id(params[:id])
    if user.nil?
      render json: { message: "User not found" }, status: 404
    elsif
      if user.favourite_movies.any?
        render json: { movies: user.favourite_movies }, status: 200
      else
        render json:  { message: "User does not have any favourite movie." }, status: 200
      end
    end
  end

  private
  def user_params
    params.require(:user).permit(:username)
  end
end