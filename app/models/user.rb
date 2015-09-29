class User < ActiveRecord::Base
  acts_as_paranoid

  has_many :own_questions, foreign_key: :owner_id, class_name: Question
  has_many :own_comments, foreign_key: :owner_id, class_name: Comment
end
