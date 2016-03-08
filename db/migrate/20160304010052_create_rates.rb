class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      
      ## BASE
      t.integer :apply_id
      t.string  :user_name
      
      
      ## 평가기준
      t.integer :point1
      t.integer :point2
      t.integer :point3
      t.integer :point4
      t.integer :point5
      t.integer :point6
      t.integer :point7
      t.integer :point8
      t.integer :point9
      t.integer :point10
      
      
      ## 심사평
      t.text    :comment
      
      t.timestamps null: false
    end
  end
end
