class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.integer :home_goals
      t.integer :away_goals
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
