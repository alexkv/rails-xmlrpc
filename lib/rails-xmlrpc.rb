# This file loads when the gem is included, and does plugin-style initialization

module ActionController::Acts
	autoload :RailsXmlrpc, "#{File.dirname(__FILE__)}/action_controller/acts/rails_xmlrpc.rb"
end

ActionController::Base.send(:include, ActionController::Acts::RailsXmlrpc )

