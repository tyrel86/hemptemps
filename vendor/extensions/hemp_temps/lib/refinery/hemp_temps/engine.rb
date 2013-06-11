module Refinery
  module HempTemps
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::HempTemps

      engine_name :refinery_hemp_temps

      initializer "register refinerycms_hemp_temps plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "hemp_temps"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.hemp_temps_admin_hemp_temps_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/hemp_temps/hemp_temp',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::HempTemps)
      end
    end
  end
end
