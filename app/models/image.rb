class Image < ActiveRecord::Base
  belongs_to :question
  attachment :file
end