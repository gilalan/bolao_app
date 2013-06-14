class AddDetailsToHints < ActiveRecord::Migration
  def change
    add_column :hints, :team_id, :integer
    add_column :hints, :goals, :integer
  end
end
