note

	description:

		"ECF Eiffel class libraries"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_LIBRARY

inherit

	ET_LIBRARY
		rename
			make as make_library,
			pathname as filename
		undefine
			filename
		redefine
			name,
			library,
			is_read_only
		end

	ET_ECF_INTERNAL_UNIVERSE
		rename
			make as make_config,
			universe as library,
			has_class as has_class_by_name
		undefine
			kind_name,
			preparse
		redefine
			name,
			library,
			is_read_only
		end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING; a_system: ET_SYSTEM)
			-- Create a new ECF library.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
			a_system_not_void: a_system /= Void
		do
			make_config (a_name, a_filename)
			make_library (a_name, a_system)
		ensure
			name_set: name = a_name
			filename_set: filename = a_filename
			current_system_set: current_system = a_system
		end

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current library a read-only library?
			-- In other words, are changes in this library and in its classes
			-- not taken into account when repreparsing or reparsing
			-- universes depending on it?

feature -- Access

	name: STRING
			-- Name

	library: ET_LIBRARY
			-- Eiffel library being adapted

end
