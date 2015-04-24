class CreatePitches < ActiveRecord::Migration
  def change
    create_table :pitches do |t|
      t.text :one_liner
      t.text :synopsis
      t.text :team
      t.json :links
      t.json :images
      t.text :references
      t.text :company_name
      t.text :approach
      t.text :look_and_feel
      t.text :previous_work
      t.text :past_clients
      t.json :videos

      t.timestamps
    end
  end
end
