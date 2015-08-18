class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.attachment :image
      t.integer :imageable_id
      t.string :imageable_type
      t.timestamps null: false
    end
    add_index :attachments, :imageable_id
  end
end
