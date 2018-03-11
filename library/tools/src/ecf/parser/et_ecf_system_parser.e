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

	ET_ECF_SYSTEM_CONFIG_PARSER
		rename
			last_system_config as last_system
		redefine
			last_system,
			parse_file,
			build_system_config
		end

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
		do
			last_system := Void
			precursor (a_file)
			parsed_libraries.wipe_out
			parsed_dotnet_assemblies.wipe_out
		end

feature {NONE} -- Element change

	build_system_config (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING)
			-- Build system config from `an_element'.
		local
			l_system: detachable ET_ECF_SYSTEM
			l_state: ET_ECF_STATE
			l_targets: detachable ET_ECF_TARGETS
			l_target: detachable ET_ECF_TARGET
		do
			l_system := new_system (an_element, a_position_table, a_filename)
			if l_system = Void then
					-- Error already reported in `new_system'.
			else
				l_targets := l_system.targets
-- TODO: we need to be able to select the target.
				if l_targets /= Void and then not l_targets.is_empty then
						-- Use last target as default target.
					l_target := l_targets.target (l_targets.count)
				else
						-- No target found in the ECF file.
						-- Error already reported in `fill_system_config'.
				end
				if l_target /= Void then
					create l_state.make (l_target, ise_version)
					l_state.set_finalize_mode (finalize_mode)
					l_target.update_state (l_state)
					l_system.select_target (l_target, l_state)
					parse_libraries (l_system, l_state)
					from parsed_libraries.start until parsed_libraries.after loop
						parse_libraries (parsed_libraries.item_for_iteration, l_state)
						parsed_libraries.forth
					end
					l_system.libraries.do_adapted (agent {ET_ADAPTED_LIBRARY}.propagate_read_only)
					l_target.fill_root (l_system)
					l_target.fill_settings (l_system)
					l_target.fill_capabilities (l_system)
					l_target.fill_options (l_system)
					parse_dotnet_assemblies (l_system, l_state)
					from parsed_libraries.start until parsed_libraries.after loop
						parse_dotnet_assemblies (parsed_libraries.item_for_iteration, l_state)
						parsed_libraries.forth
					end
					last_system := l_system
				end
			end
		end

end
