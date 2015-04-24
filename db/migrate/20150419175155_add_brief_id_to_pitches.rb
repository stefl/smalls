class AddBriefIdToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :brief_id, :integer
  end
end
