module Refinery
  module ContactTypes
    class ContactType < Refinery::Core::BaseModel
      self.table_name = 'refinery_contact_types'

      attr_accessible :name, :inputs, :position

      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
    end
  end
end
