require 'middleman/graphviz/helpers'

module Middleman
  module Graphviz
    cattr_accessor :options

    class Extension < Middleman::Extension
      def initialize( app, options_hash = {}, &block)
        super

        app.helpers Middleman::Graphviz::Helpers
      end
    end
  end
end
