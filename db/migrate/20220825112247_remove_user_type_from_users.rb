class RemoveUserTypeFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :type, :string
    add_column :users, :type, :integer
  end
end
