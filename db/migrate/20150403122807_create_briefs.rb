class CreateBriefs < ActiveRecord::Migration
  def change
    create_table :briefs do |t|
      t.text :name
      t.integer :brief_type_id
      t.text :description
      t.text :objectives
      t.text :values
      t.text :aesthetic
      t.text :location
      t.text :practicalities
      t.integer :budget_low
      t.integer :budget_high
      t.text :brand_name
      t.text :budget_description
      t.text :company_name
      t.text :email
      t.text :telephone
      t.text :twitter_handle

      t.timestamps
    end
  end
end
