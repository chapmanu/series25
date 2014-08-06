Symbol.class_eval do
	def to_underscored_s
		word = self.to_s
		word.gsub!(/::/, '/')
		word.gsub!(/([A-Z]+)([A-Z][a-z])/,'\1_\2')
		word.gsub!(/([a-z\d])([A-Z])/,'\1_\2')
		word.tr!("-", "_")
		word.downcase!
		word
	end
end