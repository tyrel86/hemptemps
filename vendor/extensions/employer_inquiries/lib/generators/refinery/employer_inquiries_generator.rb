module Refinery
  class EmployerInquiriesGenerator < Rails::Generators::Base

    def rake_db
      rake "refinery_employer_inquiries:install:migrations"
      rake "refinery_settings:install:migrations"
    end

    def append_load_seed_data
      create_file 'db/seeds.rb' unless File.exists?(File.join(destination_root, 'db', 'seeds.rb'))
      append_file 'db/seeds.rb', :verbose => true do
        <<-EOH

Refinery::EmployerInquiries::Engine.load_seed
        EOH
      end
    end

  end
end
