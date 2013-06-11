class AddSalesToRefineryHempTemps < ActiveRecord::Migration
  def change
    add_column :refinery_hemp_temps, :budtender_salse, :boolean
    add_column :refinery_hemp_temps, :budtender_salse_years, :integer
  end
end
