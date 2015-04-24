class AddIsPublicToBrief < ActiveRecord::Migration
  def change
    add_column :briefs, :is_public, :boolean
  end
end
