class AddExtraQuestionsToBriefs < ActiveRecord::Migration
  def change
    add_column :briefs, :why_commissioning, :text
    add_column :briefs, :success_criteria, :text
    add_column :briefs, :pitch_deadline, :date
    add_column :briefs, :delivery_deadline, :date
  end
end
