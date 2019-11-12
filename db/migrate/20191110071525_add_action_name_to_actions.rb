class AddActionNameToActions < ActiveRecord::Migration[5.0]
  def change
  	add_column :actions, :name, :string
  end
end
