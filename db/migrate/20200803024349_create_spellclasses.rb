class CreateSpellclasses < ActiveRecord::Migration[6.0]
  def change
    create_table :spellclasses do |t|
      t.string :name, null:false
      t.references :spell, null:false, foreign_key: true

      t.timestamps
    end
  end
end
