require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TestAngularRails
  class Application < Rails::Application
    I18n.enforce_available_locales = true
    
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.ico)
    config.assets.precompile += %w(*.eot *.woff *.ttf *.svg)
  
    config.autoload_paths += %W(\#{config.root}/lib)
  end
end
