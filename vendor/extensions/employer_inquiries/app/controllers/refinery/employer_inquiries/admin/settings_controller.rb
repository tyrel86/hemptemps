module Refinery
  module EmployerInquiries
    module Admin
      class SettingsController < Refinery::AdminController

        before_filter :check_setting, :only => [:edit, :update], :modify_params
        after_filter :save_subject_for_confirmation, :save_message_for_confirmation, :only => :update

        def edit
          @setting = Refinery::Setting.find(params[:id])
        end

        def update
          @setting = Refinery::Setting.find(params[:id])

          if @setting.update_attributes(params[:setting])
            flash[:notice] = t('refinery.crudify.updated', :what => @setting.name.gsub("employer_inquiry_", "").titleize)

            unless request.xhr? or from_dialog?
              redirect_back_or_default(refinery.employer_inquiries_admin_employer_inquiries_path)
            else
              render :text => "<script type='text/javascript'>parent.window.location = '#{refinery.employer_inquiries_admin_employer_inquiries_path}';</script>"
            end
          end
        end

      protected
				def modify_params
					debugger
					true
				end
        def check_setting
          setting = params[:id].gsub("employer_inquiry_", "")

          Refinery::EmployerInquiries::Setting.send(setting) if Refinery::EmployerInquiries::Setting.respond_to?(setting)
        end

        def save_subject_for_confirmation
          Refinery::EmployerInquiries::Setting.confirmation_subject = params[:subject] if params.keys.include?('subject')
        end

        def save_message_for_confirmation
          Refinery::EmployerInquiries::Setting.confirmation_message = params[:message] if params.keys.include?('message')
        end

      end
    end
  end
end
