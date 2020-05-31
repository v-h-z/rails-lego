class CreateGamesets < ActiveRecord::Migration[6.0]
  def change
    create_table :gamesets do |t|
      t.string :ref
      t.string :name
      t.string :img

      t.timestamps
    end
  end
end
