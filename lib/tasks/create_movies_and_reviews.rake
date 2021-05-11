require_relative "./task_helpers/movies.rb"

include Movies

desc "Create Movies and Revies"
task create_movies_and_reviews: :environment do
  puts "Creating league table..."

  import_movies_and_reviews

  puts "Done!"
end
