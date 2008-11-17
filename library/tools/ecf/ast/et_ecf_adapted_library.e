indexing

	description:

		"ECF adapted libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_ADAPTED_LIBRARY

inherit

	ET_ADAPTED_LIBRARY
		rename
			make as make_adapted_library
		end

	ET_ECF_CONDITIONED

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: ET_IDENTIFIER; a_universe: like universe) is
			-- Create a new ECF adapted library.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			name := a_name
			filename := a_filename
			universe := a_universe
			make_adapted_library (tokens.empty_library)
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
			universe_set: universe = a_universe
		end

feature -- Access

	name: ET_IDENTIFIER
			-- Name

	filename: ET_IDENTIFIER
			-- ECF filename

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- ECF universe containing the current reference to `library'

feature -- Setting

	set_library (a_library: like library) is
			-- Set `library' to `a_library'.
		require
			a_library_not_void: a_library /= Void
		do
			library := a_library
		ensure
			library_set: library = a_library
		end

invariant

	name_not_void: name /= Void
	filename_not_void: filename /= Void
	universe_not_void: universe /= Void

end
