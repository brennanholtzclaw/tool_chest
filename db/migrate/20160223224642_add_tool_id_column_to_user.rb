class AddToolIdColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :tool_id, :integer
  end
end
