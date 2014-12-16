require 'middleman/graphviz/helpers'
require 'middleman/csv/page'

module Middleman
  module Graphviz
    cattr_accessor :options

    class Extension < Middleman::Extension
      def initialize( app, options_hash = {}, &block)
        super

        app.helpers Middleman::Graphviz::Helpers
      end

      def after_configuration
        @csv_pages = Middleman::CSV::Page.new( @app, self )
        @app.sitemap.register_resource_list_manipulator(:"csv_pages", @csv_pages, false)
      end
    end
  end
end
