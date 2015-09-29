class AddQuestionToImage < ActiveRecord::Migration
  def change
    add_reference :images, :question, index: true, foreign_key: true
  end
end
