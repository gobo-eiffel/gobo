note

	description:

		"ECF values to be passed for external compilations"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_EXTERNAL_VALUE

inherit

	ET_ECF_CONDITIONED

feature {NONE} -- Initialization

	make (a_value: like value)
			-- Create a new external value.
		require
			a_value_not_void: a_value /= Void
		do
			value := a_value
		ensure
			value_set: value = a_value
		end

feature -- Access

	value: STRING
			-- Value

	description: detachable STRING
			-- Description

feature -- Setting

	set_description (a_description: like description)
			-- Set `description' to `a_description'.
		do
			description := a_description
		ensure
			description_set: description = a_description
		end

feature -- Element change

	fill_external_values (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Add to `a_universe.current_system' the current external value
			-- of conditions satisfy `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		do
			if is_enabled (a_state) then
				add_external_value (value, a_universe)
			end
		end

feature {NONE} -- Implementation

	add_external_value (a_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add `a_value' to `a_universe.current_system'.
		require
			a_value_not_void: a_value /= Void
			a_universe_not_void: a_universe /= Void
		deferred
		end

invariant

	value_not_void: value /= Void

end
