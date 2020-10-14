class CreateMoves < ActiveRecord::Migration[6.0]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :accuracy
      t.integer :power
      t.integer :pp

      t.timestamps
    end
  end
end
