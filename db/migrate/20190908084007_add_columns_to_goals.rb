class AddColumnsToGoals < ActiveRecord::Migration[5.0]
  def change
    add_column:goals,:goal,:string
    add_column:goals,:purpose,:string
    add_column:goals,:date,:date
  end
end
