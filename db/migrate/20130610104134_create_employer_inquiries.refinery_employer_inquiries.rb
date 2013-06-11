# This migration comes from refinery_employer_inquiries (originally 1)
class CreateEmployerInquiries < ActiveRecord::Migration

  def self.up
    create_table :refinery_employer_inquiries do |t|
      t.string :company_name
      t.string :contact_name
      t.string :phone
      t.string :email
      t.string :grow_facility_address
      t.string :website
      t.integer :positions_to_fill
      t.boolean :job_types
      t.text :other_job_types
      t.boolean :any_chemicals
      t.boolean :tools
      t.text :help_with_tools

      t.timestamps
    end

    add_index :refinery_employer_inquiries, :id

    if (seed = Rails.root.join('db', 'seeds', 'employer_inquiries.rb')).exist?
      load(seed)
    end
  end

  def self.down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "employer_inquiries"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/employer_inquiries"})
    end

    drop_table :refinery_employer_inquiries
  end

end
