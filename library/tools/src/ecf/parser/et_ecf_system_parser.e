note

	description:

		"ECF Eiffel system parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM_PARSER

inherit

	ET_ECF_PARSER

create

	make, make_standard, make_with_factory

feature -- Status report

	finalize_mode: BOOLEAN
			-- Is system to be compiled in finalize mode?

feature -- Status setting

	set_finalize_mode (b: BOOLEAN)
			-- Set `finalize_mode' to `b'.
		do
			finalize_mode := b
		ensure
			finalize_mode_set: finalize_mode = b
		end

feature -- Access

	last_system: detachable ET_ECF_SYSTEM
			-- Eiffel system being parsed
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse ECF file `a_file'.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_result: DS_CELL [detachable ET_ECF_SYSTEM]
		do
			last_system := Void
			create l_result.make (Void)
			parse_file_with_action (a_file, agent build_system (?, ?, ?, finalize_mode, l_result))
			last_system := l_result.item
		end

end
