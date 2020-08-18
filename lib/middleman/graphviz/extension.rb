module Middleman
  module Graphviz

    class Extension < Middleman::Extension
      def initialize( app, options_hash = {}, &block)
        super
      end
      helpers do
        def graphviz( &block )
          if block_given?
            data = capture_html(&block)

            out, err, status = Open3.capture3( "dot -Tsvg", stdin_data: data )

            # puts "Status = #{status}"
            # puts err

            svg = out.gsub( /.*<svg/m, "<svg" ).gsub( /\n/m, "")

            concat_content(svg.html_safe)
          end
        end
      end
    end
  end
end
