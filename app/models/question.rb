class Question < ActiveRecord::Base
  belongs_to :owner, class_name: User, foreign_key: :owner_id
  belongs_to :owner_with_deleted, -> { with_deleted }, class_name: User, foreign_key: :owner_id
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy

  validates :owner, presence: true
  validates :name, presence: true, length: { minimum: 5, maximum: 200 }
  validates :post_text, presence: true, length: { minimum: 5, maximum: 9999 }

  def self.search(query)
    if query.blank? then
      all
    else
      where(post_text: query)
    end
  end
end