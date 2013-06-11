module Refinery
  module EmployerInquiries
    class EmployerInquiriesController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/employer_inquiries/thank_you", :include => [:parts])
      end

      def new
        @employer_inquiry = EmployerInquiry.new
      end

      def create
        @employer_inquiry = EmployerInquiry.new(params[:employer_inquiry])

        if @employer_inquiry.save
          begin
            Mailer.notification(@employer_inquiry, request).deliver
          rescue => e
            logger.warn "There was an error delivering the employer_inquiry notification.\n#{e.message}\n"
          end

          if EmployerInquiry.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@employer_inquiry, request).deliver
            rescue => e
              logger.warn "There was an error delivering the employer_inquiry confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to EmployerInquiry if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_employer_inquiries_employer_inquiries_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/employer_inquiries/new', :include => [:parts])
      end

    end
  end
end
