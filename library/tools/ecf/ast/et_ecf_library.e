indexing

	description:

		"ECF Eiffel libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_LIBRARY

inherit

	ET_LIBRARY
		rename
			make as make_library
		redefine
			name
		end

	ET_ECF_INTERNAL_UNIVERSE
		rename
			make as make_config
		redefine
			name
		end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING; a_system: ET_SYSTEM) is
			-- Create a new ECF library.
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_system_not_void: a_system /= Void
		do
			make_config (a_name, a_filename)
			make_library (a_system)
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
			current_system_set: current_system = a_system
		end

feature -- Access

	name: STRING
			-- Name
			
end
