class Pitch < ActiveRecord::Base
  belongs_to :brief

  def fake!
    self.one_liner = FFaker::Movie.title
    self.synopsis = "#{FFaker::HipsterIpsum.words(20).join(" ")}.\n\n#{FFaker::Lorem.paragraphs(rand(5) + 1).join("\n\n")}"
    self.team = (3.times.collect do
      "#{FFaker::Name.first_name} #{FFaker::Name.last_name}\n#{FFaker::Job.title}"
    end).join("\n\n")
    self.links = rand(6).times.collect {|t| FFaker::Internet.http_url }
    #t.json     "images"

    self.references = FFaker::Lorem.paragraphs(rand(8) + 1).join("\n\n")
    self.company_name = FFaker::Company.name
    self.approach = FFaker::Lorem.paragraphs(3).join("\n\n")
    self.look_and_feel = "#{FFaker::HipsterIpsum.words(20).join(" ")}.\n\n#{FFaker::Lorem.paragraphs(rand(5) + 1).join("\n\n")}"
    self.previous_work = FFaker::Lorem.paragraphs(rand(4) + 1).join("\n\n")
    self.past_clients = FFaker::Lorem.paragraphs(rand(4) + 1).join("\n\n")
    #t.json     "videos"
    
    self.name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
    self.email = FFaker::Internet.email
    true
  end
end
