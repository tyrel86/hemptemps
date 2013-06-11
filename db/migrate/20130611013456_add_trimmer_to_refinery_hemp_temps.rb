class AddTrimmerToRefineryHempTemps < ActiveRecord::Migration
  def change
    add_column :refinery_hemp_temps, :trimmer_harvesting_experience, :boolean
    add_column :refinery_hemp_temps, :trimmer_harvesting_years, :integer
  end
end
