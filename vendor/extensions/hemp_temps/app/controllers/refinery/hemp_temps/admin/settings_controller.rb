module Refinery
  module HempTemps
    module Admin
      class SettingsController < Refinery::AdminController

        before_filter :check_setting, :only => [:edit, :update]
        after_filter :save_subject_for_confirmation, :save_message_for_confirmation, :only => :update

        def edit
          @setting = Refinery::Setting.find(params[:id])
        end

        def update
          @setting = Refinery::Setting.find(params[:id])

          if @setting.update_attributes(params[:setting])
            flash[:notice] = t('refinery.crudify.updated', :what => @setting.name.gsub("hemp_temp_", "").titleize)

            unless request.xhr? or from_dialog?
              redirect_back_or_default(refinery.hemp_temps_admin_hemp_temps_path)
            else
              render :text => "<script type='text/javascript'>parent.window.location = '#{refinery.hemp_temps_admin_hemp_temps_path}';</script>"
            end
          end
        end

      protected
        def check_setting
          setting = params[:id].gsub("hemp_temp_", "")

          Refinery::HempTemps::Setting.send(setting) if Refinery::HempTemps::Setting.respond_to?(setting)
        end

        def save_subject_for_confirmation
          Refinery::HempTemps::Setting.confirmation_subject = params[:subject] if params.keys.include?('subject')
        end

        def save_message_for_confirmation
          Refinery::HempTemps::Setting.confirmation_message = params[:message] if params.keys.include?('message')
        end

      end
    end
  end
end
