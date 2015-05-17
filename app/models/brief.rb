class Brief < ActiveRecord::Base
  include AASM
  belongs_to :brief_type
  belongs_to :user

  has_many :pitches

  extend FriendlyId
  friendly_id :name, use: :slugged

  def name_with_id
    "#{self.name.to_param}-#{self.id}"
  end

  def fake!
    self.name = [
      "Music video for The #{FFaker::HipsterIpsum.word.pluralize.titleize}",
      "#{rand(8)+2}x Vines for #{FFaker::HipsterIpsum.word.titleize}",
      "Short ad campaign with #{FFaker::Company.name}",
      FFaker::Company.catch_phrase.titleize,
      FFaker::Company.bs.titleize,
      "Event video for #{FFaker::Education.school}",
      "Short film about #{FFaker::Education.major }",
      "#{FFaker::Product.product_name  } launch",
      "Branded video for #{FFaker::Product.brand}",
      "Social content for #{FFaker::Product.product }"
    ].sample
    self.project_lead = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
    #t.integer  "brief_type_id"
    self.description = FFaker::Lorem.paragraphs(rand(3)+1).join("\n\n")
    self.objectives = FFaker::Lorem.paragraphs(rand(5)+1).join("\n\n")
    self.values = FFaker::Lorem.paragraphs(rand(2)+1).join("\n\n")
    self.aesthetic = FFaker::Lorem.paragraphs(rand(4)+1).join("\n\n")
    self.location = FFaker::Address.country
    self.practicalities = FFaker::Lorem.paragraphs(rand(4)+1).join("\n\n")
    self.budget_low = (rand(250) + 1) * 1000
    self.budget_high = [self.budget_low + (rand(50) * 1000),nil].sample
    self.brand_name = [FFaker::Product.brand,FFaker::Company.name].sample
    self.budget_description = ["Budget not negotiable", "Budget negotiable", nil, "Including taxes"].sample
    self.company_name = [self.brand_name,FFaker::Company.name].sample
    self.email = "#{self.project_lead.parameterize.gsub("-",".")}@#{self.company_name.parameterize + ".com"}"
    self.telephone = FFaker::PhoneNumber.phone_number
    self.twitter_handle = self.company_name.parameterize
    self.why_commissioning = FFaker::Lorem.paragraphs(rand(4)+1).join("\n\n")
    self.success_criteria = FFaker::Lorem.paragraphs(rand(2)+1).join("\n\n")
    self.pitch_deadline = Date.today + rand(30).days
    self.delivery_deadline = Date.today + rand(90).days
    self.destination = FFaker::Lorem.paragraphs(1).to_s
    self.technical_specification = FFaker::Lorem.paragraphs(rand(2)+1).join("\n\n")
    self.is_public = [true, false].sample
    self
  end

  aasm do
    state :draft, :initial => true
    state :for_review
    state :active
    state :in_moderation
    state :archived

    event :submit do
      transitions :to => :for_review
    end

    event :approve do
      transitions :to => :active
    end

    event :moderate do
      transitions :to => :in_moderation
    end

    event :archive do
      transitions :to => :archived
    end

    event :draft do
      transitions :to => :draft
    end

  end
end
