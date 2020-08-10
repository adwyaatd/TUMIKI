class AddStatusToGoals < ActiveRecord::Migration[5.2]
  def change
    add_column :goals, :status, :string
  end
end
