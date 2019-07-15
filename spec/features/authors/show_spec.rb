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
      @author2 = @book3.authors.create!(name: 'Bob Woodward')
    end
    it 'I can see a list of all books' do
      visit '/books'

      within "#book-#{@book2.id}" do
        click_link(@author1.name)
      end

      expect(current_path).to eq("/authors/#{@author1.id}")
      expect(page).to have_content(@author1.name)
      expect(page).to have_content(@book2.title)
      expect(page).to have_content(@author1.average_pages)
    end
  end
end
