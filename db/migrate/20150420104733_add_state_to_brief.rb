class AddStateToBrief < ActiveRecord::Migration
  def change
    add_column :briefs, :state, :text
    add_column :briefs, :image, :json
  end
end
