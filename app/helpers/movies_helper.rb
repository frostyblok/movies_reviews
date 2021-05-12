module MoviesHelper
  def display_movie_attributes(model_attribute, locator)
    model_attribute.map {|sen| sen[locator]}.join(', ')
  end
end
