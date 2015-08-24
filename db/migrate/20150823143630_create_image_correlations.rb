class CreateImageCorrelations < ActiveRecord::Migration
  def change
    create_table :image_correlations do |t|
      t.integer :attachment_id
      t.integer :imageable_id
      t.string :imageable_type

      t.timestamps null: false
    end
    add_index :image_correlations, [:imageable_type, :imageable_id]
  end
end
