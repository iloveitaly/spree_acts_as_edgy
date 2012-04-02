require 'spree_core'

module SpreeActsAsEdgy
  class Engine < Rails::Engine
    engine_name "spree_acts_as_edgy"
    
    config.autoload_paths += %W(#{config.root}/lib)

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.env.production? ? require(c) : load(c)
      end
      
      ActionView::Base.send(:include, EdgyHelper)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
