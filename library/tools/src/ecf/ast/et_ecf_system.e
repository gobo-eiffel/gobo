note

	description:

		"ECF Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2006-2018, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_SYSTEM

inherit

	ET_SYSTEM
		rename
			make as make_system
		redefine
			name,
			is_read_only,
			universe
		end

	ET_ECF_INTERNAL_UNIVERSE
		undefine
			preparse_recursive,
			parse_all_recursive,
			preparse,
			parse_all,
			set_none_type,
			default_read_only_value,
			kind_name
		redefine
			make,
			name,
			is_read_only,
			universe
		end

create

	make

feature {NONE} -- Initialization

	make (a_name, a_filename: STRING)
			-- Create a new ECF system.
		do
			name := a_name
			filename := a_filename
			make_system (a_name)
		end

feature -- Status report

	is_read_only: BOOLEAN
			-- Is current system a read-only system?
			-- In other words, are changes in this system and in its classes
			-- not taken into account when repreparsing or reparsing
			-- universes depending on it?

feature -- Access

	name: STRING
			-- Name of system

	universe: ET_ECF_INTERNAL_UNIVERSE
			-- Universe of current system config.
			-- It might be different from the current system config itself when
			-- using parent targets with an 'extension_location' attribute.

end
