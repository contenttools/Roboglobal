class CreateIndexRecords < ActiveRecord::Migration
  def change
    create_table :index_records do |t|
      t.string :value, limit: 16
      t.date :index_date

      t.timestamps null: false
    end
  end
end
