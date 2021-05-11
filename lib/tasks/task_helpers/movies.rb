require 'csv'

module Movies
  def import_movies_and_reviews
    import_movies
    import_reviews

  rescue ActiveRecord::RecordInvalid => e
    puts "#{e.message}"
  end

  def import_movies
    CSV.parse(file_content("movies"), headers: true) do |row|
      movie = Movie.find_or_create_by(name: row[0], description: row[1], year: row[2], director: row[3])
      movie.actors.push(actor: row[4])
      movie.filming_locations.push(location: row[5])
      movie.countries.push(country: row[6])

      movie.save!
    end
  end

  def import_reviews
    CSV.parse(file_content("reviews"), headers: true) do |row|
      movie = Movie.find_by(name: row[0])
      user = User.find_or_create_by(name: row[1])
      return "The movie you tried to rate does not exist please try again" unless movie.present?

      Review.create!(star_rating: row[2], comment: row[3], movie: movie, user: user)
    end
  end

  private

  def file_content(item)
    base_path = Rails.root.join("lib", "assets")
    File.read(base_path.join("#{item}.csv").to_s)
  end
end
