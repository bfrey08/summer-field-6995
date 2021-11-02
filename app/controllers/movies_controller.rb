class MoviesController < ApplicationController
  def show
    @movies = Studio.movies
  end
end
