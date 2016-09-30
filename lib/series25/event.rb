module Series25
	class Event < Base

    # Checks if there are multiple reservations with this event
    #
    # @return [Boolean]
    def has_recurrences?
      profiles && profiles[0] && profiles[0].reservations && profiles[0].reservations.length > 1
    end

    # Returns the active reservations in a recurring event
    #
    # @return [Array]
    def active_reservations
      profiles[0].reservations.delete_if { |res| res.reservation_state == '99' }
    end

    # Finds custom_attribute by id
    #
    # @param id [String]
    # @return [String, Nil]
    def custom_attribute(id)
      index = custom_attributes.index{|ca| ca.attribute_id == id.to_s}
      index ? custom_attributes[index] : nil
    end

    # Get the value of a custom attribute based on its attribute_id
    #
    # @param id [String]
    # @return [String, Nil]
    def custom_attribute_value(id)
      ca = custom_attribute(id)
      ca ? ca.attribute_value : nil
    end

    # Find a event text by its event_text_type_id
    #
    # @param id [String]
    # @return [String, Nil]
    def event_text(id)
      index = event_texts.index{|event_text| event_text.text_type_id == id.to_s}
      index ? event_texts[index] : nil
    end

    # Get the text from an event text given the event_text_type_id
    #
    # @param id [String]
    # @return [String, Nil]
    def event_text_text(id)
      text = event_text(id)
      text ? text.text : nil
    end
	end
end