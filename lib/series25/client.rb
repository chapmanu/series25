module Series25
	# @author James Kerr
	# @abstract The http client that will be connecting to the 
	# 	Series25 Web Services API.  This is powered by the Faraday
	# 	Ruby gem.
	class Client

		attr_accessor :base_url, :user, :password

		# You can create a new client by passing a block
		# or by passing a hash of options
		#
		# @param options [Hash]
		# @return [Series25::Client]
		def initialize(options = {})
			options.each do |key, value|
				send(:"#{key}=", value)
			end
			yield(self) if block_given?
		end

		# Get an event with options
		#
		# @param query_params [Hash] the standard Webservices query params
		# @return [Series25::Event]
		def event(query_params = {})
			string_data = get('event.xml', query_params).body
			parsed_xml  = Nokogiri::XML(string_data).xpath('.//r25:events/r25:event')
			Event.new(parsed_xml)
		end

		# Get a listing of events
		#
		# @param query_params [Hash] the standard Webservices query params
		# @return [Series25::Events]
		def events(query_params = {})
			string_data = get('events.xml', query_params).body
			parsed_xml  = Nokogiri::XML(string_data).xpath('.//r25:events')
			events_list = Events.new(parsed_xml)
			events_list.respond_to?(:events) ? events_list.events : []
		end

		# Perform a get request
		# 
		# @param path [string]
		# @param params [Hash]
		# @return [Faraday::Env]
		def get(path, params = {})
			request(:get, path, params)
		end

	private
		# Returns a Faraday::Connection object
		#
		# @return [Faraday::Connection]	
		def connection
			@connection ||= Faraday.new(url: base_url, ssl: {verify: false}) do |f|
				f.basic_auth user, password
				f.request :url_encoded
				f.adapter Faraday.default_adapter
			end
		end

		# The helper method for making all requests
		# 
		# @param method [Symbol]
		# @param path [String]
		# @param params [Hash]
		# @return [Faraday::Env]
		def request(method, path, params)
			response = connection.send(method.to_sym, path, params)
			response.env
		end
	end
end



