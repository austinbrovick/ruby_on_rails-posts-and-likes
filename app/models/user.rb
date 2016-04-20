class User < ActiveRecord::Base
  has_secure_password

  # relationships
  has_many :posts
  has_many :likes


  # validations
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, :presence => true, :format => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  validates :alias, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :password, :presence => true, length: { minimum: 8 }


end
