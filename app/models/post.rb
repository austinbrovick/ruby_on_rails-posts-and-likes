class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes


  # validations
  validates :content, :presence => true
end
