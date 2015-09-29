class AddOwnerToQuestion < ActiveRecord::Migration
  def change
    add_reference :questions, :owner, index: true, foreign_key: true
  end
end
