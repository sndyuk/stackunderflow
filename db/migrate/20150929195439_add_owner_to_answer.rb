class AddOwnerToAnswer < ActiveRecord::Migration
  def change
    add_reference :answers, :owner, index: true, foreign_key: true
  end
end
