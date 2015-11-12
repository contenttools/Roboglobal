class CreateIndices < ActiveRecord::Migration
  def change
    create_table :indices do |t|
      t.string :index_type, null: false
      t.string :category, null: false

      t.timestamps null: false
    end
  end
end
