class FixIndexOfAttachments < ActiveRecord::Migration
  def up
    remove_index :attachments, [:imageable_id]
    remove_index :pdf_attachments, [:doc_id]
    add_index :attachments, [:imageable_type, :imageable_id]
    add_index :pdf_attachments, [:doc_type, :doc_id]
  end

  def down
    remove_index :attachments, [:imageable_type, :imageable_id]
    remove_index :pdf_attachments, [:doc_type, :doc_id]
    add_index :attachments, [:imageable_id]
    add_index :pdf_attachments, [:doc_id]
  end
end
