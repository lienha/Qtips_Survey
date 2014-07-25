class User < ActiveRecord::Base
  has_many :samples, foreign_key: :voter_id 
  has_many :surveys, foreign_key: :creator_id
  has_many :responses, through: :samples
end
