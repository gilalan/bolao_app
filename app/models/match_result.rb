class MatchResult < ActiveRecord::Base
  
  default_scope order('team_id ASC')

  attr_accessible :game_id, :goals, :team_id

  belongs_to :team
  belongs_to :game

end
