class AddSafeToRefineryEmployerInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_employer_inquiries, :safe, :boolean
  end
end
