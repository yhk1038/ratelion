class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :apply_id
      t.integer :total
      t.integer :num
      t.integer :score
      t.timestamps null: false
    end
  end
end
