class RenameState < ActiveRecord::Migration
  def change
    rename_column :briefs, :state, :aasm_state
  end
end
