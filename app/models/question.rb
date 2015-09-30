class Question < ActiveRecord::Base
  belongs_to :owner, class_name: User, foreign_key: :owner_id
  belongs_to :owner_with_deleted, -> { with_deleted }, class_name: User, foreign_key: :owner_id
  has_many :comments, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :images, dependent: :destroy

  accepts_attachments_for :images, attachment: :file

  def self.search(query)
    if query.blank? then
      all
    else
      where(post_text: query)
    end
  end

  REGEX_CACHED_IMG_URL = /(!\[.*?\]\(\/attachments\/.*\/)cache(\/.*\))/
  def post_text=(text)
    super(text.gsub(REGEX_CACHED_IMG_URL, '\store\2'))
  end
end