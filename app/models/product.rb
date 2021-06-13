class Product < ApplicationRecord
  belongs_to :user
  #belongs_to :category
  validates :name, presence: true, uniqueness: true
  validates :quantity, :details, presence: true
end
