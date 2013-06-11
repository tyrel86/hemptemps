module Refinery
  module HempTemps
    class HempTemp < Refinery::Core::BaseModel
      self.table_name = 'refinery_hemp_temps'

      attr_accessible :name, :phone, :email, :address, :badged, :license_number, :exp_date, :job_type, :bud_tender_experience, :bud_tender_years, :bud_tender_strains, :bud_tender_edibles, :bud_tender_extracts, :bud_tender_clones, :bud_tender_register, :bud_tender_ailments, :grower_experience, :grower_years, :grower_fifty_pounds, :grower_hydro_orgainics, :grower_organics, :grower_lighting, :grower_enjoyment, :grower_nutrient_lines, :grower_methods, :grower_largest_grow_room, :grower_media, :grower_environmental_controll, :grower_environmental_brands, :reception_experience, :reception_software, :reception_badged, :reception_work_history, :trimmer_experience, :trimmer_years, :trimmer_grams_per_day, :position, :bud_tender_sales, :budtender_sales_years, :trimmer_harvesting_experience, :trimmer_harvesting_years

      acts_as_indexed :fields => [:name, :phone, :email, :address, :license_number, :grower_hydro_orgainics, :grower_organics, :grower_lighting, :grower_enjoyment, :grower_nutrient_lines, :grower_methods, :grower_largest_grow_room, :grower_media, :grower_environmental_brands, :reception_software, :reception_work_history]

      alias_attribute :message, :grower_enjoyment

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :name, :presence => true
      validates :phone, :presence => true
			validates :badged, acceptance: { accept: true }

      JOB_TYPES = ["Bud Tender", "Grower", "Reception/Front Desk", "Trimming"]
    end
  end
end
