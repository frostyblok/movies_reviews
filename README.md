# README

### Table of Contents

1. [Introduction](#introduction)
2. [Setup](#setup)
3. [Running the Application](#running-the-application)

----

# Introduction
This app is written in Ruby on Rails.

### Problem Statement
Making improvements on movie reviews apps.

----


# Setup
Here's how to test the application on your local computer for development:


### Installation
Follow these instructions to setup your local development environment:

1. Clone the project and `cd` into the project directory

2. Run `bundle install` to all the project dependencies.

3. Edit the `config/application-example.yml` with your correct database credentials

4. Run `rails db:setup` to setup the database.

----

# Running the Application
1. Run `rake create_movies_and_reviews` to run the task that imports the movies and the reviews

2. Run `rails server` to start the rails server.

3. Visit `localhost:3000` to visit the app.
