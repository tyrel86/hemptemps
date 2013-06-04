module Refinery
  module ContactTypes
    class ContactTypesController < ::ApplicationController

      before_filter :find_all_contact_types
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact_type in the line below:
        present(@page)
      end

      def show
        @contact_type = ContactType.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @contact_type in the line below:
        present(@page)
      end

    protected

      def find_all_contact_types
        @contact_types = ContactType.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/contact_types").first
      end

    end
  end
end
