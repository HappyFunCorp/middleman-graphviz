module Middleman
  module Graphviz
    module Helpers
      def basic_helper_example( param )
        "<h1>#{param}</h1>".html_safe
      end

      def block_helper_example( type, &block )
        if block_given?
          data = capture_html(&block)

          data = data.upcase

          concat_content(data.html_safe)
        end
      end
    end
  end
end