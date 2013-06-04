module Refinery
  module ContactTypes
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::ContactTypes

      engine_name :refinery_contact_types

      initializer "register refinerycms_contact_types plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "contact_types"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.contact_types_admin_contact_types_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/contact_types/contact_type',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ContactTypes)
      end
    end
  end
end
