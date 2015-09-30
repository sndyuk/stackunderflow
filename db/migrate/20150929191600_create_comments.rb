class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :post_text, null: false, limit: 1000

      t.timestamps null: false
    end
  end
end
