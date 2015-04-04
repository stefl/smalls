class AddMoreDetailsToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :destination, :text
    add_column :briefs, :technical_specification, :text
  end
end
