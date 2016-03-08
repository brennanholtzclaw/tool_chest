class RenameUserColumnToToolsId < ActiveRecord::Migration
  def change
    rename_column :users, :tool_id, :tools_id
  end
end
