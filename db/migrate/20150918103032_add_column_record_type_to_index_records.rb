class AddColumnRecordTypeToIndexRecords < ActiveRecord::Migration
  def change
    add_column :index_records, :record_type, :string, limit: 2
  end
end
