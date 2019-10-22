class AddGoalToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column:users,:goal,:string
    add_column:users,:purpose,:string
    add_column:users,:date,:date
  end
end
