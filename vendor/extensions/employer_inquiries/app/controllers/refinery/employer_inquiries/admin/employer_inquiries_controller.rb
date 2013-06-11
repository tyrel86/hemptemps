module Refinery
  module EmployerInquiries
    module Admin
      class EmployerInquiriesController < Refinery::AdminController

        crudify :'refinery/employer_inquiries/employer_inquiry', 
                :title_attribute => "company_name", 
                :order => "created_at DESC"

        def index
          unless searching?
            find_all_employer_inquiries
          else
            search_all_employer_inquiries
          end

          @grouped_employer_inquiries = group_by_date(@employer_inquiries)
        end

      end
    end
  end
end
