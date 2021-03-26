class Product < ApplicationRecord
  belongs_to :user
  #belongs_to :category

  validates :name, :quantity, :details, presence: true
end
