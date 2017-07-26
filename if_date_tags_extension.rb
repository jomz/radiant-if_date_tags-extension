# Uncomment this if you reference any of your controllers in activate
# require_dependency "application_controller"
require "radiant-if_date_tags-extension"

class IfDateTagsExtension < Radiant::Extension
  version     RadiantIfDateTagsExtension::VERSION
  description RadiantIfDateTagsExtension::DESCRIPTION
  url         RadiantIfDateTagsExtension::URL

  # See your config/routes.rb file in this extension to define custom routes

  extension_config do |config|
    # config is the Radiant.configuration object
  end

  def activate
    # tab 'Content' do
    #   add_item "If Date Tags", "/admin/if_date_tags", :after => "Pages"
    # end
  end
end
