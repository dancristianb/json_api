class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :comments
end
