class MoviesController < ApplicationController
  def show
    @movie = Movie.find(params[:id])
    @actors = @movie.actors
  end
  def update
    @movie = Movie.find(params[:id])
    @movie.actors << Actor.find_by(name: params[:name])
    redirect_to "/movies/#{@movie.id}"
  end
end
