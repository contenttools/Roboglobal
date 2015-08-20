class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title, limit: 32

      t.timestamps null: false
    end
  end
end
