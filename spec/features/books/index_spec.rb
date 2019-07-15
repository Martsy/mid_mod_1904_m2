require 'rails_helper'

RSpec.describe 'Book Index Page' do
  describe 'As a visitor' do
    before :each do
      @book1 = Book.create!(title: "All the President's Men", pages: 349, published: 1974)
      @book2 = Book.create!(title: 'Loyalties', pages: 262, published: 1990)
      @book3 = Book.create!(title: 'The Secret Man', pages: 256, published: 2005)
      @author1 = @book1.authors.create!(name: 'Carl Bernstein')
      @author2 = @book1.authors.create!(name: 'Bob Woodward')
      @author1 = @book2.authors.create!(name: 'Carl Bernstein')
      @author2 = @book3.authors.create!(name: 'Carl Bernstein')
    end
    it 'I can see a list of all books' do
      visit '/books'

      within "#book-#{@book1.id}" do
        expect(page).to have_link("#{@book1.title}")
        expect(page).to have_content("Pages: #{@book1.pages}")
        expect(page).to have_content("Year Published: #{@book1.published}")
        expect(page).to have_link(@author1.name)
        expect(page).to have_link(@author2.name)

      end
    end
  end
end
