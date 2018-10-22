class Post < ApplicationRecord
  accepts_nested_attributes_for :comments
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy
end
