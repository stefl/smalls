class AddBrandToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :project_lead, :text
  end
end
