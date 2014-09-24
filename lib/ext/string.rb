String.class_eval do

	# A very simple pluralize method that only works on
	# Series25 objects.
	#
	# @return [String] the plural of the string
	def s25_pluralize
		Series25::SPECIAL_PLURALS[self] ? Series25::SPECIAL_PLURALS[self] : self+'s'
	end

	# A very simple singularize method that only works on
	# Series25 objects
	#
	# @return[String] the singular of the string
	def s25_singularize
		reverse_plurals = Series25::SPECIAL_PLURALS.invert
		reverse_plurals[self] ? reverse_plurals[self] : self[0...-1]
	end

	# Checks to see if an underscored string is a series25 object.
	#
	# @return [Boolean]
	def series25_object?
		Series25.constants.map(&:to_underscored_s).include?(self)
	end

	# Creates a class constant from a string
	#
	# @return [Constant]
	def to_s25_class
		string = "series25/#{self}"
		string = string.sub(/^[a-z\d]*/) { $&.capitalize }
		string.gsub!(/(?:_|(\/))([a-z\d]*)/i) { "#{$1}#{$2.capitalize}" }
		string.gsub!('/', '::')
		Object.const_get(string)
	end
end