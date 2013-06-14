class AddPointsToHints < ActiveRecord::Migration
  def change
    add_column :hints, :points, :integer
  end
end
