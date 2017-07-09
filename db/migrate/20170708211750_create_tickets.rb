class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.date :closed_at
      t.references :agent,    foreign_key: { to_table: :users }
      t.references :customer, foreign_key: { to_table: :users }, null: false

      t.timestamps
    end
  end
end
