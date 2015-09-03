class RemoveAttachableIdAndAttachableTypeFromEmbeddedAttachments < ActiveRecord::Migration
  def change
    remove_column :embedded_attachments, :attachable_id, :integer
    remove_column :embedded_attachments, :attachable_type, :string
  end
end
