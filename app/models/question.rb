class Question < ActiveRecord::Base
  belongs_to :owner, class_name: User, foreign_key: :owner_id
  belongs_to :owner_with_deleted, -> { with_deleted }, class_name: User, foreign_key: :owner_id
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy

  def self.search(query)
    if query.blank? then
      all
    else
      where(post_text: query)
    end
  end
end