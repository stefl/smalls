class AddSlugToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :slug, :text
  end
end
