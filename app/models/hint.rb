class Hint < ActiveRecord::Base

  default_scope order('team_id ASC')

  attr_accessible :goals, :game_id, :user_id, :team_id, :points

  belongs_to :game
  belongs_to :team
  belongs_to :user

end
