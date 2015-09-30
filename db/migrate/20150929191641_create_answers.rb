class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :post_text, null: false, limit: 10000

      t.timestamps null: false
    end
  end
end
