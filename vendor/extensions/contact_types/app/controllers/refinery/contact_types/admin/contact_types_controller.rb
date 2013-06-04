module Refinery
  module ContactTypes
    module Admin
      class ContactTypesController < ::Refinery::AdminController

        crudify :'refinery/contact_types/contact_type',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
