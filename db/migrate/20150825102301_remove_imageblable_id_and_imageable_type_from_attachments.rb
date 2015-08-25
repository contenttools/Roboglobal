class RemoveImageblableIdAndImageableTypeFromAttachments < ActiveRecord::Migration
  def up
    remove_index :attachments, [:imageable_type, :imageable_id]
    remove_column :attachments, :imageable_id
    remove_column :attachments, :imageable_type
  end

  def down
    add_column :attachments, :imageable_id, :integer
    add_column :attachments, :imageable_type, :string
    add_index :attachments, [:imageable_type, :imageable_id]
  end
end
