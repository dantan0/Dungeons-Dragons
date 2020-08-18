class CreateJoinTableBooksSpells < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :spells do |t|
      t.index [:spell_id, :book_id], unique: true
    end
  end
end
