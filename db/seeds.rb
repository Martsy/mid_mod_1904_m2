# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@book1 = Book.create!(title: "All the President's Men", pages: 349, published: 1974)
@book2 = Book.create!(title: 'Loyalties', pages: 262, published: 1990)
@book3 = Book.create!(title: 'The Secret Man', pages: 256, published: 2005)
@author1 = @book1.authors.create!(name: 'Carl Bernstein')
@author2 = @book1.authors.create!(name: 'Bob Woodward')
@author1 = @book2.authors.create!(name: 'Carl Bernstein')
@author2 = @book3.authors.create!(name: 'Bob Woodward')
