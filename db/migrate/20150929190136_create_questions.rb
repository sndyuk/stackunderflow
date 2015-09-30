class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name, null: false
      t.text :post_text, null: false, limit: 10000

      t.timestamps null: false
    end
  end
end
