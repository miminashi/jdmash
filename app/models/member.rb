require 'open-uri'

class Member < ActiveRecord::Base
  def self.random(count)
    Member.where('url is not null').order('random()').limit(count)
  end

  def self.import_from_api(url)
    json = JSON(open(url).read)
    json.each do |m|
      first_name = m['first_name']
      family_name = m['familly_name']
      url = m['hp']
      Member.create(:first_name => first_name, :family_name => family_name, :url => url)
    end
  end

  def name
    self.family_name + self.first_name
  end
end
