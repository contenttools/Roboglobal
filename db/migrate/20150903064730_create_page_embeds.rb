class CreatePageEmbeds < ActiveRecord::Migration
  def change
    create_table :page_embeds do |t|
      t.string :title
      t.text :description
      t.text :embed_code
      t.string :role

      t.timestamps null: false
    end
  end
end
