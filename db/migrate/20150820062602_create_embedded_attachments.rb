class CreateEmbeddedAttachments < ActiveRecord::Migration
  def change
    create_table :embedded_attachments do |t|
      t.text :embed_code
      t.integer :attachable_id
      t.string :attachable_type, limit: 32

      t.timestamps null: false
    end
    add_index :embedded_attachments, [:attachable_type, :attachable_id]
  end
end
