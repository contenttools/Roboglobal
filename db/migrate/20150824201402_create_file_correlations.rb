class CreateFileCorrelations < ActiveRecord::Migration
  def change
    create_table :file_correlations do |t|
      t.integer :pdf_attachment_id
      t.integer :document_id
      t.string :document_type

      t.timestamps null: false
    end
    add_index :file_correlations, [:document_type, :document_id]
  end
end
