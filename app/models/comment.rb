class Comment < ActiveRecord::Base
  belongs_to :owner, class_name: User, foreign_key: 'owner_id'
  belongs_to :owner_with_deleted, -> { with_deleted }, class_name: User, foreign_key: 'owner_id'
end
