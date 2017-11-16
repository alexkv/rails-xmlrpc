module ActionController
	module Acts
		module RailsXmlrpc
			def self.included(controller)
				controller.extend(ClassMethods)
			end

			module ClassMethods
				def exposes_xmlrpc_methods(options = {})
					configuration = { :method_prefix => nil }
					configuration.update(options) if options.is_a?(Hash)

					before_action(:add_method_handlers, :only => [:xe_index])
					class_eval <<-EOV
						require 'xmlrpc/server'
						include ActionController::Acts::RailsXmlrpc::InstanceMethods

						def xe_method_prefix
							'#{configuration[:method_prefix]}'
						end

						def self.add_method name, &block
							@method_list ||= []
							lambda_block = lambda &block
							@method_list << { :name => name, :block => lambda_block}
						end

						def self.xe_method_list
							@method_list ||= []
							@method_list
						end

						def self.method_size
							@method_list
						end
					EOV
				end
			end

			module InstanceMethods
				# TODO: add route automatically for this?
				def xe_index
					result = @xmlrpc_server.process(request.body.read) # add .read to guarantee correct source for REXML
					puts "\n\n----- BEGIN RESULT -----\n#{result}----- END RESULT -----\n\n"
					render :text => result, :content_type => 'text/xml'
				end

				private

				def add_method_handlers
					@xmlrpc_server = XMLRPC::BasicServer.new
					# loop through all the methods, adding them as handlers
					self.class.xe_method_list.each do |method|
						puts "Adding XMLRPC method for #{method[:name].to_s}"
						@xmlrpc_server.add_handler method[:name], &method[:block]
							# method[:block].call
						# end
					end

					@xmlrpc_server.add_handler 'demo3' do
						self.class.method_size[0][:name]
					end

					self.class.instance_methods(false).each do |method|
						unless ['xe_index', 'xe_method_prefix', 'xe_method_list'].member?(method)
							puts "Adding XMLRPC method for #{method.to_s}"
							@xmlrpc_server.add_handler(xe_method_prefix + method.to_s) do |*args|
								self.send(method.to_sym, *args)
							end
						end
					end
				end
			end
		end
	end
end
