class MoviesController < ApplicationController
  def index
    @movies = if params[:query]
                search_movie
                 else
                   Movie.includes(reviews: :user).order(created_at: :asc)
                 end
  end

  private

  def search_movie
    Movie.query_movie(query: params[:query])
  end
end
