class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :msg, null: false
      t.references :agent, foreign_key: { to_table: :users }
      t.references :customer, foreign_key: { to_table: :users }
      t.references :ticket, null: false

      t.timestamps
    end
  end
end
