class Team < ActiveRecord::Base

  attr_accessible :logotipo, :name, :abbrev

  has_many :match_results
  has_many :games, :through => :match_results

  has_many :hints

end
