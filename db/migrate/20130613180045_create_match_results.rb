class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :game_id
      t.integer :team_id
      t.integer :goals

      t.timestamps
    end
  end
end
