class ChangeDescriptionColumnInGames < ActiveRecord::Migration[7.1]
  def change
    rename_column :games, :descrption, :description
  end
end
