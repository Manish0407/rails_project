class ChangeUserTypeToInteger < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :user_type, :integer, using: 'user_type::integer'
  end
  def down
    change_column :users, :user_type, :string
  end
end
