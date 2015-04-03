class Brief < ActiveRecord::Base
  belongs_to :brief_type
  belongs_to :user
end
