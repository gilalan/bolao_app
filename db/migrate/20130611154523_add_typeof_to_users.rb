class AddTypeofToUsers < ActiveRecord::Migration
  def change
    add_column :users, :typeof, :integer
  end
end
