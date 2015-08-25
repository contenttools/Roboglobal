class CreateVideoCorrelations < ActiveRecord::Migration
  def change
    create_table :video_correlations do |t|
      t.integer :embedded_attachment_id
      t.integer :video_id
      t.string :video_type

      t.timestamps null: false
    end
    add_index :video_correlations, [:video_type, :video_id]
  end
end
