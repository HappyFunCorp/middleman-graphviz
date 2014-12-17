require 'open3'

module Middleman
  module Graphviz
    module Helpers
      def graphviz( &block )
        if block_given?
          data = capture_html(&block)

          data = data.upcase
          out, err, status = Open3.capture3( "dot -Tsvg", stdin_data: data )

          # puts "Status = #{status}"
          # puts err

          svg = out.gsub( /.*<svg/m, "<svg" )

          concat_content(svg.html_safe)
        end
      end
    end
  end
end