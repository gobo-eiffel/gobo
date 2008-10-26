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

	make (a_name, a_filename: STRING) is
			-- Create a new ECF adapted library.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
		do
			name := a_name
			filename := a_filename
			make_adapted_library (tokens.empty_library)
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
		end

feature -- Access

	name: STRING
			-- Name

	filename: STRING
			-- ECF filename

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

end
