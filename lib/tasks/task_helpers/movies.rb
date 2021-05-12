require 'csv'

module Movies
  def import_movies_and_reviews
    import_movies
    import_reviews

  rescue ActiveRecord::RecordInvalid => e
    puts "#{e.message}"
  end

  private

  def import_movies
    CSV.parse(file_content("movies"), headers: true) do |row|
      movie = Movie.find_or_create_by(name: row[0], description: row[1], year: row[2], director: row[3])
      movie.actors.push(actor: row[4]) unless attribute_exists?(movie.actors, "actor", row[4])
      movie.filming_locations.push(location: row[5]) unless attribute_exists?(movie.filming_locations, "location", row[5])
      movie.countries.push(country: row[6]) unless attribute_exists?(movie.countries, "country", row[6])

      movie.save!
    end
  end

  def import_reviews
    CSV.parse(file_content("reviews"), headers: true) do |row|
      movie = Movie.find_by(name: row[0])
      user = User.find_or_create_by(name: row[1])
      return "The movie you tried to rate does not exist please try again" unless movie.present?

      movie.reviews << Review.(star_rating: row[2], comment: row[3], user: user)
    end
  end

  def file_content(item)
    base_path = Rails.root.join("lib", "assets")
    File.read(base_path.join("#{item}.csv").to_s)
  end

  def attribute_exists?(model_attribute, locator, attribute)
    model_attribute.map {|sen| sen[locator]}.include? attribute
  end
end
