require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :pages }
    it { should validate_presence_of :published }
  end

  before :each do
    @book1 = Book.create!(title: "All the President's Men", pages: 349, published: 1974)
    @book2 = Book.create!(title: 'Loyalties', pages: 262, published: 1990)
    @book3 = Book.create!(title: 'The Secret Man', pages: 256, published: 2005)
    @author1 = @book1.authors.create!(name: 'Carl Bernstein')
    @author2 = @book1.authors.create!(name: 'Bob Woodward')
    @author1 = @book2.authors.create!(name: 'Carl Bernstein')
    @author2 = @book3.authors.create!(name: 'Bob Woodward')
  end

  describe "average_pages" do
    it "returns the average number of pages for all of a particular author's books" do
      expect(@author_1.average_pages).to eq(305)
    end
  end
end
