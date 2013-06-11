module Refinery
  module EmployerInquiries
    class EmployerInquiry < Refinery::Core::BaseModel
      self.table_name = 'refinery_employer_inquiries'

      attr_accessible :company_name, :contact_name, :phone, :email, :grow_facility_address, :website, :positions_to_fill, :job_types, :other_job_types, :any_chemicals, :tools, :help_with_tools, :position, :safe

      acts_as_indexed :fields => [:company_name, :contact_name, :phone, :email, :grow_facility_address, :website, :other_job_types, :help_with_tools]

      alias_attribute :message, :other_job_types

      alias_attribute :name, :company_name

      # Add some validation here if you want to validate the user's input
      # We have validated the first string field for you.
      validates :contact_name, :presence => true
      validates :phone, :presence => true

    end
  end
end
