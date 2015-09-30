class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file_id, null: false
      t.string :file_filename
      t.integer :file_size
      t.string :file_content_type

      t.timestamps null: false
    end
  end
end
