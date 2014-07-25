require 'bcrypt'

class User < ActiveRecord::Base

  include BCrypt

  has_many :samples, foreign_key: :voter_id 
  has_many :surveys, foreign_key: :creator_id
  has_many :responses, through: :samples

  validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password_hash

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    user if user && user.password == password
  end

end

