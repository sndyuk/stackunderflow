class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable, :validatable
  acts_as_paranoid

  has_many :questions, foreign_key: :owner_id, class_name: Question
  has_many :comments, foreign_key: :owner_id, class_name: Comment
  has_many :answers, foreign_key: :owner_id, class_name: Answer
end
