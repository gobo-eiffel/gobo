note

	description:

		"ECF external linker flags"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_EXTERNAL_LINKER_FLAG

inherit

	ET_ECF_EXTERNAL_FLAG
		rename
			fill_external_values as fill_external_linker_flags
		end

create

	make

feature {NONE} -- Implementation

	add_external_value (a_value: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add `a_value' to `a_universe.current_system'.
		do
			a_universe.current_system.external_linker_flags.force_last (a_value)
		end

end
