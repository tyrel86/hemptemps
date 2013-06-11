module Refinery
  module EmployerInquiries
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::EmployerInquiries

      engine_name :refinery_employer_inquiries

      initializer "register refinerycms_employer_inquiries plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "employer_inquiries"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.employer_inquiries_admin_employer_inquiries_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/employer_inquiries/employer_inquiry',
            :title => 'company_name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::EmployerInquiries)
      end
    end
  end
end
