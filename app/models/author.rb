class Author < ApplicationRecord
  validates_presence_of :name
  has_and_belongs_to_many :books

  def average_pages
    self.books.average(:pages)
  end
end
