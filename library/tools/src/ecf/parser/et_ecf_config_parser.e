note

	description:

	"[
		ECF file parsers.
		Do not parse ECF files it depends on,
		nor ECF files being redirected to.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2019, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_CONFIG_PARSER

inherit

	ET_ECF_PARSER

create

	make, make_standard, make_with_factory

feature -- Access

	last_config: detachable ET_ECF_CONFIG
			-- ECF config being parsed
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
			l_result: DS_CELL [detachable ET_ECF_CONFIG]
		do
			last_config := Void
			create l_result.make (Void)
			parse_file_with_action (a_file, False, agent build_config (?, ?, ?, a_universe, l_result))
			last_config := l_result.item
		ensure
			universe_set: attached last_config as l_last_config implies l_last_config.universe = a_universe
		end

end
