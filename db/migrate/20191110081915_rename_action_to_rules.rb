class RenameActionToRules < ActiveRecord::Migration[5.0]
  def change
  	rename_table :actions, :rules
  end
end
