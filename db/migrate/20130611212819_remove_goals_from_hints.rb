class RemoveGoalsFromHints < ActiveRecord::Migration
  def up
    remove_column :hints, :home_goals
    remove_column :hints, :away_goals
  end

  def down
    add_column :hints, :away_goals, :integer
    add_column :hints, :home_goals, :integer
  end
end
