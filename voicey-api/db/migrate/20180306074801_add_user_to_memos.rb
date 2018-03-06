class AddUserToMemos < ActiveRecord::Migration[5.1]
  def change
    add_column :memos, :user, :string
    add_column :memos, :references, :string
  end
end
