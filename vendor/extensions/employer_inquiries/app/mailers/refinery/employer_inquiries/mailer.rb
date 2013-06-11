module Refinery
  module EmployerInquiries
    class Mailer < ActionMailer::Base

      def confirmation(employer_inquiry, request)
        @employer_inquiry = employer_inquiry
        mail :subject  => Refinery::EmployerInquiries::Setting.confirmation_subject,
             :to       => employer_inquiry.email,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>",
             :reply_to => Refinery::EmployerInquiries::Setting.notification_recipients.split(',').first
      end

      def notification(employer_inquiry, request)
        @employer_inquiry = employer_inquiry
        mail :subject  => Refinery::EmployerInquiries::Setting.notification_subject,
             :to       => Refinery::EmployerInquiries::Setting.notification_recipients,
             :from     => "\"#{Refinery::Core.site_name}\" <no-reply@#{request.domain}>"
      end

    end
  end
end
