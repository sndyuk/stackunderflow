class User < ActiveRecord::Base
  has_many :own_questions, foreign_key: :owner_id, class_name: Question
end
