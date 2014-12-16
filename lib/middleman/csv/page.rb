module Middleman
  module CSV
    class Page
      # include UriTemplates

      def initialize(app, controller)
        @sitemap = app.sitemap
        @page_link_template = "pages/{page}.html"
        @page_template = "page.html"
      end

      # Update the main sitemap resource list
      # @return [void]
      def manipulate_resource_list(resources)
        resources + ::CSV.open( "pages.csv" ).collect do |row|
          create_page_resource( row[0], row )
        end
      end

      private

      def link(page)
        ::Middleman::Util.normalize_path @page_link_template.gsub( /\{page\}/, page )
      end

      def create_page_resource( page, row )
        Sitemap::Resource.new(@sitemap, link(page)).tap do |p|
          p.proxy_to( @page_template )

          p.add_metadata locals: {
            row: row
          }
        end
      end
    end
  end
end