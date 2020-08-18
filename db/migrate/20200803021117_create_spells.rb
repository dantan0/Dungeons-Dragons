class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :name, null:false
      t.integer :level, null:false
      t.string :school, null:false
      t.boolean :concentration, null:false
      t.text :description, null:false

      t.timestamps
    end
  end
end
