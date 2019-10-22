class RemoveUsersColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column:users,:goal,:string
    remove_column:users,:purpose,:string
    remove_column:users,:date,:date
  end
end
