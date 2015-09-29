class AddQuestionToComment < ActiveRecord::Migration
  def change
    add_reference :comments, :question, index: true, foreign_key: true
  end
end
