class CreateBlogPosts < ActiveRecord::Migration
  def change
    create_table :blog_posts do |t|
      t.string :title
      t.text :description
      t.text :tags
      t.date :published_date
      t.integer :views

      t.timestamps null: false
    end
  end
end
