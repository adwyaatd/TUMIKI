class RemoveGoalsColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column:goals,:content,:text
  end
end
