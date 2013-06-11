module Refinery
  module HempTemps
    class Setting < Refinery::Core::BaseModel

      class << self
        def confirmation_body
          Refinery::Setting.find_or_set(:hemp_temp_confirmation_body,
            "Thank you for your hemp temp %name%,\n\nThis email is a receipt to confirm we have received your hemp temp and we'll be in touch shortly.\n\nThanks."
          )
        end

        def confirmation_subject
          Refinery::Setting.find_or_set(:hemp_temp_confirmation_subject,
                                        "Thank you for your hemp temp")
        end

        def confirmation_subject=(value)
          Refinery::Setting.set(:hemp_temp_confirmation_subject, value)
        end

        def notification_recipients
          Refinery::Setting.find_or_set(:hemp_temp_notification_recipients,
                                        (Role[:refinery].users.first.try(:email) if defined?(Role)).to_s)
        end

        def notification_subject
          Refinery::Setting.find_or_set(:hemp_temp_notification_subject,
                                        "New hemp temp from your website")
        end
      end

    end
  end
end
