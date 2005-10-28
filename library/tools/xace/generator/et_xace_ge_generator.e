indexing

	description:

		"Ace file generators for Gobo Eiffel compiler"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_GE_GENERATOR

inherit

	ET_XACE_ISE_GENERATOR
		redefine
			default_system_output_filename,
			default_library_output_filename
		end

create

	make

feature -- Access

	default_system_output_filename: STRING is
			-- Name of generated Ace file
		once
			Result := "ge.ace"
		end

	default_library_output_filename: STRING is
			-- Name of generated library Ace file
		once
			Result := "ge.ace"
		end

end
