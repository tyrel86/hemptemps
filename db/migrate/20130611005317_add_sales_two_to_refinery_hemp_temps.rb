class AddSalesTwoToRefineryHempTemps < ActiveRecord::Migration
  def change
    add_column :refinery_hemp_temps, :bud_tender_sales, :boolean
    add_column :refinery_hemp_temps, :budtender_sales_years, :integer
  end
end
