class RemoveDocIdAndDocTypeFromPdfAttachment < ActiveRecord::Migration
  def change
    remove_column :pdf_attachments, :doc_id, :integer
    remove_column :pdf_attachments, :doc_type, :string
  end
end
