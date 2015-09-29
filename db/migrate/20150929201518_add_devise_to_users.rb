class AddDeviseToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ''

      ## Rememberable
      t.datetime :remember_created_at
    end
  end
end