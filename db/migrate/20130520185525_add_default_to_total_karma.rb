class AddDefaultToTotalKarma < ActiveRecord::Migration
  def change
    change_column :users, :total_karma, :integer, :default => 0
  end
end
