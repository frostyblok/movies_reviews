require 'rails_helper'

Rails.application.load_tasks

describe "Create movies and reviews" do
  it "it successfully creates Movies and reviews" do
    Rake::Task["create_movies_and_reviews"].invoke

    expect(Movie.all.size).to eq(2)
    expect(Review.all.size).to eq(9)
  end
end
