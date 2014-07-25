class Sample < ActiveRecord::Base
  belongs_to :voter, class_name: "User"
  belongs_to :survey
  has_many :responses
end
