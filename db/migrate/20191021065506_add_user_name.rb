class AddUserName < ActiveRecord::Migration[5.0]
  def change
  	add_column :goals, :user_name, :string
  end
end
