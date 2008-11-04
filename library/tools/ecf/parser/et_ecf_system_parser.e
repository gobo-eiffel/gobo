indexing

	description:

		"ECF Eiffel system parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_SYSTEM_PARSER

inherit

	ET_ECF_PARSER
		redefine
			parse_file
		end

create

	make, make_standard, make_with_factory

feature -- Access

	last_system: ET_ECF_SYSTEM
			-- Eiffel system being parsed

feature -- Parsing

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM) is
			-- Parse ECF file `a_file'.
		do
			last_system := Void
			precursor (a_file)
			parsed_libraries.wipe_out
		end

feature {NONE} -- Element change

	build_system_config (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING) is
			-- Build system config from `an_element'.
		local
			l_system: ET_ECF_SYSTEM
			l_state: ET_ECF_STATE
			l_targets: ET_ECF_TARGETS
			l_target: ET_ECF_TARGET
		do
			l_system := new_system (an_element, a_position_table, a_filename)
-- TODO: check that there is no cycles in targets.
			l_targets := l_system.targets
			if l_targets /= Void and then l_targets.count = 1 then
				l_target := l_targets.target (1)
			else
-- TODO: we need to select the target
			end
			if l_target /= Void then
				create l_state.make (l_target, ise_version)
				l_target.update_state (l_state)
				l_system.select_target (l_target, l_state)
				parse_libraries (l_system, l_state)
				from parsed_libraries.start until parsed_libraries.after loop
					parse_libraries (parsed_libraries.item_for_iteration, l_state)
					parsed_libraries.forth
				end
				l_target.fill_root (l_system)
				last_system := l_system
			end
		end

end
