class Game < ActiveRecord::Base
  
  attr_accessible :finished, :computed, :gamedate, :gametime, :local, :closed

  has_many :match_results
  has_many :teams, :through => :match_results

  has_many :hints

  def self.checkForExpiredGames
  	games = Game.all
  	
  	games.each do |game|
  		if (game.gamedate - Date.today).to_i == 0
  			mins_countdown = (g1.gametime.hour*60 + g1.gametime.min) - (Time.now.hour*60 + Time.now.min)
  			if mins_countdown > 0 && mins_countdown < 30
  				game.update_attributes(:closed => true)
  			end
  		else

  		end
  	end

  end

end
