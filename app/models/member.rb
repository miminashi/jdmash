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

  def self.fight(opts)
    raise unless opts[:winner] and opts[:loser]
    _winner = opts[:winner]
    _loser = opts[:loser]

    winner = Elo::Player.new(:rating => _winner.rating)
    loser = Elo::Player.new(:rating => _loser.rating)
    
    game = winner.versus(loser)
    game.winner = winner
    
    _winner.update(:rating => winner.rating)
    _loser.update(:rating => loser.rating)
  end

  def name
    self.family_name + self.first_name
  end
end
