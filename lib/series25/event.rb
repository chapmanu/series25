module Series25
	class Event < Base

    # Checks if there are multiple reservations with this event
    #
    # @return [Boolean]
    def has_recurrences?
      profiles && profiles[0] && profiles[0].reservations && profiles[0].reservations.length > 1
    end

    # Finds custom_attribute by id
    def custom_attribute(id)
      index = custom_attributes.index{|ca| ca.attribute_id == id.to_s}
      index ? custom_attributes[index] : nil
    end

    def custom_attribute_value(id)
      ca = custom_attribute(id)
      ca ? ca.attribute_value : nil
    end
	end
end