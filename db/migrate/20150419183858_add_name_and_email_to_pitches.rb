class AddNameAndEmailToPitches < ActiveRecord::Migration
  def change
    add_column :pitches, :name, :text
    add_column :pitches, :email, :text
  end
end
