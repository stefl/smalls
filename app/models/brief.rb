class Brief < ActiveRecord::Base
  belongs_to :brief_type
  belongs_to :user

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name_with_id
    "#{self.name.to_param}-#{self.id}"
  end
end
