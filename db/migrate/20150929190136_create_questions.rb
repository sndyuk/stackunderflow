class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name
      t.text :post_text, limit: 10000

      t.timestamps null: false
    end
  end
end
