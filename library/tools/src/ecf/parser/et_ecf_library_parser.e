note

	description:

		"ECF Eiffel library parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_LIBRARY_PARSER

inherit

	ET_ECF_PARSER

create

	make, make_standard, make_with_factory

feature -- Access

	last_library: detachable ET_ECF_LIBRARY
			-- Eiffel library being parsed
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF library will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_adapted_library: ET_ECF_ADAPTED_LIBRARY)
			-- Parse ECF file `a_file'.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF library will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_adapted_library_not_void: a_adapted_library /= Void
		local
			l_result: DS_CELL [detachable ET_ECF_LIBRARY]
		do
			last_library := Void
			create l_result.make (Void)
			parse_file_with_action (a_file, True, agent build_library (?, ?, ?, a_adapted_library, l_result))
			last_library := l_result.item
		ensure
			system_set: attached last_library as l_last_library implies a_adapted_library.library = l_last_library
		end

end
