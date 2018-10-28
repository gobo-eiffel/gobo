note

	description:

	"[
		ECF file parsers.
		Do not parse ECF files it depends on.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2017-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM_CONFIG_PARSER

inherit

	ET_ECF_PARSER

create

	make, make_standard, make_with_factory

feature -- Access

	last_system_config: detachable ET_ECF_SYSTEM_CONFIG
			-- ECF system config being parsed
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system config will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM)
			-- Parse ECF file `a_file'.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system config will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
		local
			l_dummy_universe: ET_ECF_SYSTEM
		do
			create l_dummy_universe.make ("*dummy*", a_file.name)
			parse_file_with_universe (a_file, l_dummy_universe)
		end

	parse_file_with_universe (a_file: KI_CHARACTER_INPUT_STREAM; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Parse ECF file `a_file'.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system config will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_universe_not_void: a_universe /= Void
		local
			l_result: DS_CELL [detachable ET_ECF_SYSTEM_CONFIG]
		do
			last_system_config := Void
			create l_result.make (Void)
			parse_file_with_action (a_file, agent build_system_config (?, ?, ?, a_universe, l_result))
			last_system_config := l_result.item
		ensure
			universe_set: attached last_system_config as l_last_system_config implies l_last_system_config.universe = a_universe
		end

end
