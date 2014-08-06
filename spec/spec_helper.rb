require 'bundler/setup'

require 'series25'

SPEC_ROOT = File.dirname(__FILE__)
SAMPLES   = File.join(SPEC_ROOT, 'samples')

# Helper functions
def event_xml
	Nokogiri::XML(File.read(File.join(SAMPLES, 'event.xml'))).xpath('.//r25:events/r25:event')
end