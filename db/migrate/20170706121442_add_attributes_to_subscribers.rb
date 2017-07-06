class AddAttributesToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :firstname, :string
    add_column :subscribers, :lastname, :string
  end
end
