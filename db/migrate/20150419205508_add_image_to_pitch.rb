class AddImageToPitch < ActiveRecord::Migration
  def change
    add_column :pitches, :image, :json
  end
end
