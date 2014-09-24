require 'bundler/setup'

require 'series25'

SPEC_ROOT = File.dirname(__FILE__)
SAMPLES   = File.join(SPEC_ROOT, 'samples')

# Helper functions
def single_event_xml
	Nokogiri::XML(File.read(File.join(SAMPLES, 'single_event.xml'))).xpath('.//r25:events/r25:event')
end

def recurring_event_xml
  Nokogiri::XML(File.read(File.join(SAMPLES, 'recurring_event.xml'))).xpath('.//r25:events/r25:event')
end

def no_reservations_event_xml
  Nokogiri::XML(File.read(File.join(SAMPLES, 'no_reservations_event.xml'))).xpath('.//r25:events/r25:event')
end