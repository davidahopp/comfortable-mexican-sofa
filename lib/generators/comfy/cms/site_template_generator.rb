module Comfy
  module Generators
    module Cms
      class SiteTemplateGenerator < Rails::Generators::Base

        def generate_site_template
          site = Comfy::Cms::Site.create(label: 'Hello World', identifier: 'hello_world', path: nil, hostname: 'localhost:3000')

          base_layout_file = File.open("#{Rails.root}/lib/boostrap_views/base_layout.html")
          base_layout = base_layout_file.read
          base_layout_file.close
          layout = Comfy::Cms::Layout.create(site: site, label: 'Base', identifier: 'base', content: base_layout)

          base_page_file = File.open("#{Rails.root}/lib/boostrap_views/base_page.html")
          base_page = base_page_file.read
          base_page_file.close
          page = Comfy::Cms::Page.create(site: site, layout: layout, label: 'home')

          Comfy::Cms::Block.create(identifier: 'content', content: base_page, blockable: page)
        end

      end
    end
  end
end