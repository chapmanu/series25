module Series25
	class Event < Base

    # Checks if there are multiple reservations with this event
    #
    # @return [Boolean]
    def has_recurrences?
      profiles && profiles[0] && profiles[0].reservations && profiles[0].reservations.length > 1
    end
	end
end