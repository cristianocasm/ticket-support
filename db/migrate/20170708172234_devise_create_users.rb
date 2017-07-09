class DeviseCreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Authentication token
      t.string :authentication_token, limit: 30

      ## Another fields
      t.boolean :admin, default: false, null: false
      t.boolean :active, default: true, null: false
      t.string  :type, null: false

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :authentication_token, unique: true
  end
end
