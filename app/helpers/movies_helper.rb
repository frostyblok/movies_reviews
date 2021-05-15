module MoviesHelper
  def display_movie_attributes(model_attribute, locator)
    model_attribute.map {|attr| attr[locator]}.join(', ')
  end
end
