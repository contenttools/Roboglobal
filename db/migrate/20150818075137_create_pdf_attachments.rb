class CreatePdfAttachments < ActiveRecord::Migration
  def change
    create_table :pdf_attachments do |t|
      t.integer :doc_id
      t.string :doc_type
      t.attachment :document
      t.timestamps null: false
    end
    add_index :pdf_attachments, :doc_id
  end
end
