module Refinery
  module HempTemps
    class HempTempsController < ::ApplicationController

      before_filter :find_page, :only => [:create, :new]

      def index
        redirect_to :action => "new"
      end

      def thank_you
        @page = Refinery::Page.find_by_link_url("/hemp_temps/thank_you", :include => [:parts])
      end

      def new
        @hemp_temp = HempTemp.new
      end

      def create
        @hemp_temp = HempTemp.new(params[:hemp_temp])

        if @hemp_temp.save
          begin
            Mailer.notification(@hemp_temp, request).deliver
          rescue => e
            logger.warn "There was an error delivering the hemp_temp notification.\n#{e.message}\n"
          end

          if HempTemp.column_names.map(&:to_s).include?('email')
            begin
              Mailer.confirmation(@hemp_temp, request).deliver
            rescue => e
              logger.warn "There was an error delivering the hemp_temp confirmation:\n#{e.message}\n"
            end
          else
            logger.warn "Please add an 'email' field to HempTemp if you wish to send confirmation emails when forms are submitted."
          end

          redirect_to refinery.thank_you_hemp_temps_hemp_temps_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_page
        @page = Refinery::Page.find_by_link_url('/hemp_temps/new', :include => [:parts])
      end

    end
  end
end
