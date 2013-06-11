module Refinery
  module HempTemps
    module Admin
      class HempTempsController < Refinery::AdminController

        crudify :'refinery/hemp_temps/hemp_temp', 
                :title_attribute => "name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_hemp_temps
          else
            search_all_hemp_temps
          end

          @grouped_hemp_temps = group_by_date(@hemp_temps)
        end

      end
    end
  end
end
