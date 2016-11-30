require 'middleman-core'

# Extension namespace
module Humans
  class Extension < ::Middleman::Extension

    HUMANS_LAYOUT_TEMPLATE = "humans.txt.erb"

    option :path, "humans.txt", "Path to humans.txt"
    option :team, [], "The team members within humans.txt"
    option :thanks, [], "People you wish to thank"
    option :site, {}, "Site information"

    expose_to_template :humans_tag

    def initialize(app, options_hash={}, &block)
      puts "Setting up Humans extension"
      super
    end

    def manipulate_resource_list(resources)
      resources << humans_resource
    end

    def humans_tag
      "<link rel=\"author\" href=\"/#{humans_path}\" />"
    end

    private

    def humans_resource
      resource = Middleman::Sitemap::ProxyResource.new(app.sitemap, humans_path, humans_layout_path)
      resource.add_metadata(options: { layout: false }, locals: humans_locals)
      resource
    end

    def humans_path
      options.path
    end

    def humans_layout_path
      dir = File.expand_path("../", __FILE__)
      path = File.join(dir, HUMANS_LAYOUT_TEMPLATE)
      raise "Template #{path} not found" if !File.exists?(path)
      path
    end

    def humans_locals
      {
        team: options.team,
        thanks: options.thanks,
        site: options.site
      }
    end
  end
end
