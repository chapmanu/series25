module Series25
	# @author James Kerr
	# @abstract The Base class from which all Series25 Object inherit.
	# 	the methods of interest are the initialize, which every object
	# 	uses.  For the functionality specific to an individual object,
	# 	see its class definition.
	class Base

		# This initializer is used on every type of Series25 object.
		# It simply creates an instance variable using the name and
		# value of the XML node if the name of the node is not a
		# class in the Series25 module.  If it is a class in this module
		# and has children nodes, it creates an array of those objects.
		#
		# @param xml [Nokogiri::XML::Document, Nokogiri::XML::Node]
		# @return [Series25::Base] or a derived class
		def initialize(xml)
			xml.children.each do |child|
				if child.name.series25_object?
					push_into_or_create_attribute(child.name.s25_pluralize, child.name.to_s25_class.new(child))
				else
					create_attribute(child.name, child.text)
				end
			end
		end

		# Used to add attr_accessors dynamically
		#
		# @param new_attribute [String]
		# @param value [Object] can be anything
		# @return [Object] The value of value
		def create_attribute(new_attribute, value = nil)
			singleton_class.class_eval do; attr_accessor new_attribute.to_sym; end
			send("#{new_attribute}=", value)
		end

		# Adds a pluralized array attribute to the class if the
		# attribute doesn't exists yet.  Otherwise, it pushes value param
		# onto the existing array.
		#
		# @param attribute [String]
		# @param value [Array<Object>]
		# @return [Object]
		def push_into_or_create_attribute(attribute, value = nil)
			if respond_to?(attribute.to_sym)
				send("#{attribute}=", instance_variable_get("@#{attribute}").push(value))
			else
				create_attribute("#{attribute}", [value])
			end
		end

		def method_missing(method, *args, &block)
			method.to_s.s25_singularize.series25_object? ? [] : super
		end
	end
end