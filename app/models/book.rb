class Book < ApplicationRecord
  validates_presence_of :title, :pages, :published
  has_and_belongs_to_many :authors
end
