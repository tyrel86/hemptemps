module Refinery
  module HempTemps
    class Mailer < ActionMailer::Base

      def confirmation(hemp_temp, request)
        @hemp_temp = hemp_temp
        mail :subject  => Refinery::HempTemps::Setting.confirmation_subject,
             :to       => hemp_temp.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::HempTemps::Setting.notification_recipients.split(',').first
      end

      def notification(hemp_temp, request)
        @hemp_temp = hemp_temp
        mail :subject  => Refinery::HempTemps::Setting.notification_subject,
             :to       => Refinery::HempTemps::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
