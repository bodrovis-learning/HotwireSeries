# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 5.times do
#   Image.create title: FFaker::CheesyLingo.word, url: FFaker::Image.url
# end

# 5.times do
#   Folder.create title: FFaker::CheesyLingo.word,
#                 description: FFaker::Lorem.sentence
# end

# User.create name: 'fake'

10.times do
  User.create name: FFaker::CheesyLingo.word
end

5.times do |i|
  Room.create title: "#{FFaker::CheesyLingo.word} #{i + 1}"
end
