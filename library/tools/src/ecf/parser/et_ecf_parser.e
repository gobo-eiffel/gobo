note

	description:

		"ECF parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_PARSER

inherit

	ET_ECF_PARSER_SKELETON
		redefine
			make_with_factory
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

feature {NONE} -- Initialization

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create a new ECF parser using `a_factory' as AST factory.
		do
			precursor (a_factory, an_error_handler)
			create parsed_libraries.make_map (10)
			parsed_libraries.set_key_equality_tester (case_insensitive_string_equality_tester)
			create parsed_dotnet_assemblies.make_map (10)
			parsed_dotnet_assemblies.set_key_equality_tester (string_equality_tester)
			create redirected_locations.make (10)
			redirected_locations.set_equality_tester (string_equality_tester)
			create {XM_EIFFEL_PARSER} xml_parser.make
			xml_parser.set_string_mode_mixed
				-- The parser will build a tree.
			create tree_pipe.make
			xml_parser.set_callbacks (tree_pipe.start)
			tree_pipe.tree.enable_position_table (xml_parser)
		end

feature {NONE} -- Element change

	build_system_config (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_result: DS_CELL [detachable ET_ECF_SYSTEM_CONFIG])
			-- Build system config from `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_result_not_void: a_result /= Void
		do
			a_result.put (new_system_config (a_element, a_position_table, a_filename, a_universe))
		end

	build_config (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_result: DS_CELL [detachable ET_ECF_CONFIG])
			-- Build system or redirection config from `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_system_or_redirection: STRING_.same_case_insensitive (a_element.name, xml_system) or STRING_.same_case_insensitive (a_element.name, xml_redirection)
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_result_not_void: a_result /= Void
		do
			if STRING_.same_case_insensitive (a_element.name, xml_system) then
				a_result.put (new_system_config (a_element, a_position_table, a_filename, a_universe))
			else
				a_result.put (new_redirection_config (a_element, a_position_table, a_filename, a_universe))
			end
		end

	build_system (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_target_name: detachable STRING; a_override_target: detachable PROCEDURE [ET_ECF_TARGET]; a_result: DS_CELL [detachable ET_ECF_SYSTEM])
			-- Build system from `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
			a_result_not_void: a_result /= Void
		local
			l_system: detachable ET_ECF_SYSTEM
			l_state: ET_ECF_STATE
		do
			l_system := new_system (a_element, a_position_table, a_filename)
			if l_system = Void then
					-- Error already reported in `new_system'.
			else
				if not attached l_system.target_with_name (a_target_name) as l_target then
					if a_target_name /= Void then
						error_handler.report_etnu_error (a_target_name, element_name (a_element, a_position_table), l_system)
					end
				else
					if a_override_target /= Void then
						a_override_target.call ([l_target])
					end
					create l_state.make (l_target, ise_version)
					select_target (l_target, l_system, l_state)
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
					l_target.fill_class_mappings (l_system, l_state)
					parse_dotnet_assemblies (l_system, l_state)
					from parsed_libraries.start until parsed_libraries.after loop
						parse_dotnet_assemblies (parsed_libraries.item_for_iteration, l_state)
						parsed_libraries.forth
					end
				end
			end
			parsed_libraries.wipe_out
			parsed_dotnet_assemblies.wipe_out
			a_result.put (l_system)
		end

	build_library (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_filename: STRING; a_adapted_library: ET_ECF_ADAPTED_LIBRARY; a_result: DS_CELL [detachable ET_ECF_LIBRARY])
			-- Build library from `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_system: STRING_.same_case_insensitive (a_element.name, xml_system)
			a_filename_not_void: a_filename /= Void
			a_adapted_library_not_void: a_adapted_library /= Void
			a_result_not_void: a_result /= Void
		do
			a_result.put (new_library (a_element, a_position_table, a_filename, a_adapted_library))
		end

	select_target (a_target: ET_ECF_TARGET; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Select `a_target' in `a_state'.
			-- Validate (recursively) target parent of `a_target' if any.
		require
			not_selected_yet: a_universe.selected_target = Void
			a_target_not_void: a_target /= Void
			valid_target: attached a_universe.targets as l_targets and then l_targets.has (a_target)
			a_state_not_void: a_state /= Void
		local
			l_system_configs: DS_HASH_TABLE [ET_ECF_SYSTEM_CONFIG, STRING]
			l_targets_by_id: DS_HASH_TABLE [ET_ECF_TARGET, STRING]
			l_system_config: ET_ECF_SYSTEM_CONFIG
			l_parent_system_config: ET_ECF_SYSTEM_CONFIG
			l_system_config_id: STRING
			l_filename: STRING
			l_parent: detachable ET_ECF_TARGET_PARENT
			l_parent_target: detachable ET_ECF_TARGET
			l_current_target: ET_ECF_TARGET
			l_parent_id: STRING
			l_has_error: BOOLEAN
			l_current_capabilities: ET_ECF_CAPABILITIES
			l_parent_capabilities: ET_ECF_CAPABILITIES
			l_capability_name: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_result: DS_CELL [detachable ET_ECF_SYSTEM_CONFIG]
			l_cycle: DS_ARRAYED_LIST [STRING]
			l_same_system_config: BOOLEAN
			l_position: ET_POSITION
		do
			a_universe.select_target (a_target)
			l_parent := a_target.parent
			if l_parent /= Void and then l_parent.target = Void then
				from
					l_system_config := a_universe
					l_current_target := a_target
					l_system_config_id := l_system_config.filename
					if operating_system.is_windows then
						l_system_config_id := l_system_config_id.as_lower
					end
					create l_system_configs.make_default
					l_system_configs.force_last (l_system_config, l_system_config_id)
					create l_targets_by_id.make_default
					l_targets_by_id.force_last (a_target, l_system_config_id + "#" + a_target.name.as_lower)
					create l_result.make (Void)
				until
					l_parent = Void or l_has_error
				loop
					l_parent_target := Void
					l_parent_system_config := l_system_config
					if attached l_parent.location_id as l_parent_location then
							-- Switch to other ECF file.
						l_filename := full_filename (l_parent_location.name, l_current_target)
						l_system_config_id := l_filename
						if operating_system.is_windows then
							l_system_config_id := l_system_config_id.as_lower
						end
						l_system_configs.search (l_system_config_id)
						if l_system_configs.found then
							l_parent_system_config := l_system_configs.found_item
						else
							create l_file.make (l_filename)
							l_file.open_read
							if not l_file.is_open_read then
								l_has_error := True
								error_handler.report_epfe_error (l_parent_location, l_filename, l_system_config)
							else
								parse_file_with_action (l_file, True, agent build_system_config (?, ?, ?, a_universe, l_result))
								if attached l_result.item as l_last_system_config then
									l_parent_system_config := l_last_system_config
									l_system_configs.force_last (l_parent_system_config, l_system_config_id)
								else
										-- Error already reported in `parse_file_with_action'.
									l_has_error := True
								end
							end
						end
					end
					if l_has_error then
						-- Skip this step.
					elseif attached l_parent.name_id as l_parent_name_id then
						if attached l_parent_system_config.targets as l_targets and then attached l_targets.target_by_name (l_parent_name_id.name) as l_target then
							l_parent_target := l_target
						else
							l_has_error := True
							if attached l_parent.location_id then
								error_handler.report_epur_error (l_parent_name_id, l_parent_system_config.filename, l_system_config)
							else
								error_handler.report_epul_error (l_parent_name_id, l_system_config)
							end
						end
					elseif attached l_parent_system_config.library_target as l_target then
						l_parent_target := l_target
					else
						l_has_error := True
						if attached l_parent.location_id as l_parent_location_id then
							error_handler.report_epud_error (l_parent_location_id, l_parent_system_config.filename, l_system_config)
						else
								-- Internal error: should never occur according to the invariant
								-- of class ET_ECF_TARGET_PARENT where at least one of
								-- 'name_id' or 'parent_location_id' should be attached.
							error_handler.report_internal_error (create {ET_COMPRESSED_POSITION}.make_default, l_system_config)
						end
					end
					if l_parent_target /= Void then
							-- Note: the way ISE avoids cycle is to consider only targets
							-- which have been specified before the current one when looking
							-- for parent targets.
							-- So, a parent target specified in the 'extends' attribute may
							-- be reported as missing even if it is specified after the
							-- current target in the ECF file.
						l_parent_id := l_system_config_id + "#" + l_parent_target.name.as_lower
						if l_targets_by_id.has (l_parent_id) then
								-- Cycle.
							l_has_error := True
							create l_cycle.make (l_targets_by_id.count + 1)
							from
								from
									l_targets_by_id.start
								until
									l_targets_by_id.after or else STRING_.same_string (l_targets_by_id.key_for_iteration, l_parent_id)
								loop
									l_targets_by_id.forth
								end
								l_same_system_config := True
							until
								not l_same_system_config or l_targets_by_id.after
							loop
								l_same_system_config := l_targets_by_id.item_for_iteration.system_config = l_parent_system_config
								l_targets_by_id.forth
							end
							from
								from
									l_targets_by_id.start
								until
									l_targets_by_id.after or else STRING_.same_string (l_targets_by_id.key_for_iteration, l_parent_id)
								loop
									l_targets_by_id.forth
								end
							until
								l_targets_by_id.after
							loop
								if l_same_system_config then
									l_cycle.put_last (l_targets_by_id.item_for_iteration.name)
								else
									l_cycle.put_last (l_targets_by_id.item_for_iteration.name + " in " + l_targets_by_id.item_for_iteration.system_config.filename)
								end
								l_targets_by_id.forth
							end
							if l_same_system_config then
								l_cycle.put_last (l_parent_target.name)
							else
								l_cycle.put_last (l_parent_target.name + " in " + l_parent_target.system_config.filename)
							end
							if attached l_parent.name_id as l_parent_name_id then
								l_position := l_parent_name_id.position
							elseif attached l_parent.location_id as l_parent_location_id then
								l_position := l_parent_location_id.position
							else
								create {ET_COMPRESSED_POSITION} l_position.make_default
							end
							error_handler.report_epcy_error (l_position, l_cycle, l_system_config)
						else
							l_parent.set_target (l_parent_target)
							l_targets_by_id.force_last (l_parent_target, l_parent_id)
							l_current_target := l_parent_target
							l_parent := l_current_target.parent
							l_system_config := l_parent_system_config
						end
					end
				end
				if not l_has_error and then l_targets_by_id.count >= 2 then
					from
						l_targets_by_id.finish
						l_parent_target := l_targets_by_id.item_for_iteration
						l_targets_by_id.back
					until
						l_targets_by_id.before or l_has_error
					loop
						l_current_target := l_targets_by_id.item_for_iteration
						l_parent := l_current_target.parent
						if l_parent /= Void then
								-- Force variables, settings, capabilities and options to be linked correctly.
							l_current_target.set_parent (l_parent)
								-- Check capabilities compatibility.
							l_current_capabilities := l_current_target.capabilities
							l_parent_capabilities := l_parent_target.capabilities
							across valid_capabilities_latest as i_capability_name loop
								l_capability_name := @i_capability_name.key
								if attached l_parent_capabilities.primary_use_value_id (l_capability_name) as l_use_value then
									if not l_parent_capabilities.is_capability_supported (l_capability_name, l_use_value.name) then
										l_has_error := True
										error_handler.report_eadq_error (l_capability_name, l_use_value, l_parent_target.system_config)
									end
								end
								if attached l_current_capabilities.primary_support_value (l_capability_name) as l_capability_value then
									if not l_parent_capabilities.is_capability_supported (l_capability_name, l_capability_value) then
										l_has_error := True
										if attached l_parent.name_id as l_parent_name then
											if attached l_parent.location_id  then
												error_handler.report_epcr_error (l_capability_name, l_capability_value, l_parent_name, l_parent_target.system_config.filename, l_current_target.system_config)
											else
												error_handler.report_epcl_error (l_capability_name, l_capability_value, l_parent_name, l_current_target.system_config)
											end
										elseif attached l_parent.location_id as l_parent_location_id then
											error_handler.report_epcd_error (l_capability_name, l_capability_value, l_parent_location_id, l_parent_target.name, l_parent_target.system_config.filename, l_current_target.system_config)
										else
												-- Internal error: should never occur according to the invariant
												-- of class ET_ECF_TARGET_PARENT where at least one of
												-- 'name_id' or 'parent_location_id' should be attached.
											error_handler.report_internal_error (create {ET_COMPRESSED_POSITION}.make_default, l_system_config)
										end
									end
								end
							end
						end
						l_parent_target := l_current_target
						l_targets_by_id.back
					end
				end
			end
			if not l_has_error then
				l_current_capabilities := a_target.capabilities
				across valid_capabilities_latest as i_capability_name loop
					l_capability_name := @i_capability_name.key
					if attached l_current_capabilities.primary_use_value_id (l_capability_name) as l_use_value then
						if not l_current_capabilities.is_capability_supported (l_capability_name, l_use_value.name) then
							error_handler.report_eadq_error (l_capability_name, l_use_value, a_target.system_config)
						end
					end
				end
			end
			a_target.fill_universe (a_universe, a_state)
		ensure
			selected_target_set: a_universe.selected_target = a_target
		end

	parse_libraries (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Parse libraries referenced in `a_universe' when in `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_libraries: ET_ADAPTED_LIBRARIES
			l_library: detachable ET_ECF_LIBRARY
			i, nb: INTEGER
			l_file: KL_TEXT_INPUT_FILE
			l_result: DS_CELL [detachable ET_ECF_LIBRARY]
			l_target: detachable ET_ECF_TARGET
			l_filename: STRING
			l_current_capabilities: ET_ECF_CAPABILITIES
			l_library_capabilities: ET_ECF_CAPABILITIES
			l_capability_name: STRING
		do
			l_libraries := a_universe.libraries
			create l_result.make (Void)
			nb := l_libraries.count
			from i := 1 until i > nb loop
				if attached {ET_ECF_ADAPTED_LIBRARY} l_libraries.library (i) as l_adapted_library then
					l_filename := full_filename (l_adapted_library.pathname, l_adapted_library.target)
					create l_file.make (l_filename)
					l_file.open_read
					if not l_file.is_open_read then
						error_handler.report_eabv_error (l_adapted_library.filename_id, l_filename, l_adapted_library.target.system_config)
					else
						parse_file_with_action (l_file, True, agent build_library (?, ?, ?, l_adapted_library, l_result))
						l_file.close
						l_library := l_result.item
						if l_library = Void then
								-- The error has already been reported in the parser.
						else
							l_adapted_library.set_library (l_library)
							l_target := l_library.selected_target
							if l_target = Void then
									-- Get the library target.
								l_target := l_library.library_target
								if l_target = Void then
									error_handler.report_eabw_error (l_adapted_library.filename_id, l_filename, l_adapted_library.target.system_config)
								else
									select_target (l_target, l_library, a_state)
									l_target.fill_options (l_library)
									l_target.fill_class_mappings (l_library, a_state)
								end
							end
								-- Check capabilities compatibility.
							if attached a_universe.selected_target as l_current_target and l_target /= Void then
								l_current_capabilities := l_current_target.capabilities
								l_library_capabilities := l_target.capabilities
								across valid_capabilities_latest as i_capability_name loop
									l_capability_name := @i_capability_name.key
									if not attached l_current_capabilities.support_value (l_capability_name) as l_capability_value then
										-- OK.
									elseif l_library_capabilities.is_capability_supported (l_capability_name, l_capability_value) then
										-- OK.
									elseif attached l_adapted_library.conditions as l_conditions and then l_conditions.is_capability_supported (l_capability_name, l_current_capabilities, l_library_capabilities) then
										-- OK.
									else
										error_handler.report_eadp_error (l_capability_name, l_capability_value, l_adapted_library.name_id, l_adapted_library.target.system_config)
									end
								end
							end
						end
					end
				end
				i := i + 1
			end
		end

	parse_dotnet_assemblies (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Parse .NET assemblies referenced in `a_universe' when in `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_dotnet_assemblies: ET_ADAPTED_DOTNET_ASSEMBLIES
			l_dotnet_assembly: ET_ECF_DOTNET_ASSEMBLY
			i, nb: INTEGER
			l_filename: STRING
			l_parsed_dotnet_assemblies: like parsed_dotnet_assemblies
		do
			l_parsed_dotnet_assemblies := parsed_dotnet_assemblies
			l_dotnet_assemblies := a_universe.dotnet_assemblies
			nb := l_dotnet_assemblies.count
			from i := 1 until i > nb loop
				if attached {ET_ECF_ADAPTED_DOTNET_ASSEMBLY} l_dotnet_assemblies.dotnet_assembly (i) as l_adapted_dotnet_assembly then
					l_filename := full_filename (l_adapted_dotnet_assembly.pathname, l_adapted_dotnet_assembly.target)
					if operating_system.is_windows then
						l_filename := l_filename.as_lower
					end
					l_parsed_dotnet_assemblies.search (l_filename)
					if l_parsed_dotnet_assemblies.found then
							-- Already parsed.
						l_dotnet_assembly := l_parsed_dotnet_assemblies.found_item
						l_adapted_dotnet_assembly.set_dotnet_assembly (l_dotnet_assembly)
					else
						l_dotnet_assembly := ast_factory.new_dotnet_assembly (l_adapted_dotnet_assembly.name, l_filename, l_adapted_dotnet_assembly.universe.current_system)
						l_adapted_dotnet_assembly.set_dotnet_assembly (l_dotnet_assembly)
						l_parsed_dotnet_assemblies.force_last_new (l_dotnet_assembly, l_filename)
					end
				end
				i := i + 1
			end
		end

feature {NONE} -- Implementation

	parse_file_with_action (a_file: KI_CHARACTER_INPUT_STREAM; a_follow_redirection: BOOLEAN; a_build_system_config: PROCEDURE [TUPLE [element: XM_ELEMENT; position_table: detachable XM_POSITION_TABLE; filename: STRING]])
			-- Parse ECF file `a_file'.
			-- Use `a_build_system_config' to build the resulting system config.
			-- If the ECF file is of the type <redirection> and `a_follow_redirection'
			-- is True, then parse the ECF file being redirected to.
			--
			-- Note that when the ECF version of the file is old, the parsed
			-- ECF system config will contain old options/settings/capabilities
			-- as well as their equivalents in the most recent version of ECF.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_build_system_config_not_void: a_build_system_config /= Void
		local
			l_root_name: STRING
			l_document: XM_DOCUMENT
			l_root_element: XM_ELEMENT
			l_position_table: detachable XM_POSITION_TABLE
			l_unknown_universe: ET_ECF_SYSTEM
			l_full_filename: STRING
			l_position: ET_COMPRESSED_POSITION
			l_xm_position: XM_POSITION
			l_message: STRING
			l_file: KL_TEXT_INPUT_FILE
			l_filename: STRING
		do
				-- Make sure that the filename of the ECF system is a canonical absolute pathname.
			l_full_filename := a_file.name
				-- Make sure that the directory separator symbol is the
				-- one of the current file system. We take advantage of
				-- the fact that `windows_file_system' accepts both '\'
				-- and '/' as directory separator.
			l_full_filename := file_system.pathname_from_file_system (l_full_filename, windows_file_system)
			l_full_filename := file_system.absolute_pathname (l_full_filename)
			l_full_filename := file_system.canonical_pathname (l_full_filename)
			xml_parser.parse_from_stream (a_file)
			if xml_parser.is_correct then
				if not tree_pipe.error.has_error then
					l_document := tree_pipe.document
					l_root_element := l_document.root_element
					l_root_name := l_root_element.name
					l_position_table := tree_pipe.tree.last_position_table
					if STRING_.same_case_insensitive (l_root_name, xml_system) then
						a_build_system_config.call ([l_root_element, l_position_table, l_full_filename])
					elseif STRING_.same_case_insensitive (l_root_name, xml_redirection) then
						if not a_follow_redirection then
							a_build_system_config.call ([l_root_element, l_position_table, l_full_filename])
						elseif not attached l_root_element.attribute_by_name (xml_location) as l_location_attribute then
							l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
							error_handler.report_eadg_error (element_name (l_root_element, l_position_table), l_unknown_universe)
						elseif l_location_attribute.value.is_empty then
							l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
							error_handler.report_eadh_error (attribute_name (l_location_attribute, l_position_table), l_unknown_universe)
						else
							l_filename := l_location_attribute.value
								-- Make sure that the filename of the redirected ECF is a canonical absolute pathname.
							l_filename := Execution_environment.interpreted_string (l_filename)
								-- Make sure that the directory separator symbol is the
								-- one of the current file system. We take advantage of
								-- the fact that `windows_file_system' accepts both '\'
								-- and '/' as directory separator.
							l_filename := file_system.pathname_from_file_system (l_filename, windows_file_system)
							if file_system.is_relative_pathname (l_filename) then
								l_filename := file_system.pathname (file_system.dirname (l_full_filename), l_filename)
							end
							l_filename := file_system.canonical_pathname (l_filename)
							if redirected_locations.has (l_filename) then
									-- Cycle in redirected ECF files.
									-- First, remove filenames which are not part of the cycle.
								from
									redirected_locations.start
								until
									string_equality_tester.test (redirected_locations.item_for_iteration, l_filename)
								loop
									redirected_locations.remove (redirected_locations.item_for_iteration)
								end
								l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
								error_handler.report_eadi_error (attribute_name (l_location_attribute, l_position_table), redirected_locations, l_unknown_universe)
							else
								redirected_locations.force_last (l_filename)
								create l_file.make (l_filename)
								l_file.open_read
								if l_file.is_open_read then
									parse_file_with_action (l_file, True, a_build_system_config)
									l_file.close
								else
									l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
									error_handler.report_eadf_error (attribute_name (l_location_attribute, l_position_table), l_filename, l_unknown_universe)
								end
							end
							redirected_locations.wipe_out
						end
					else
						l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
						error_handler.report_eabx_error (element_name (l_root_element, l_position_table), l_unknown_universe)
					end
				else
					l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
					create l_position.make (0, 0)
					l_message := tree_pipe.last_error
					error_handler.report_syntax_error (l_message, l_position, l_unknown_universe)
				end
			else
				l_unknown_universe := ast_factory.new_system ("*unknown*", l_full_filename)
				l_xm_position := xml_parser.position
				create l_position.make (l_xm_position.row, l_xm_position.column)
				l_message := xml_parser.last_error_description
				if l_message = Void then
					l_message := "XML syntax error"
				end
				error_handler.report_syntax_error (l_message, l_position, l_unknown_universe)
			end
		end

	xml_parser: XM_PARSER
			-- XML parser

	tree_pipe: XM_TREE_CALLBACKS_PIPE
			-- Tree generating callbacks

	redirected_locations: DS_HASH_SET [STRING]
			-- Locations of redirected ECF files,
			-- used to detect cycles

	parsed_libraries: DS_HASH_TABLE [ET_ECF_LIBRARY, STRING]
			-- Already parsed ECF libraries, indexed by UUID

	parsed_dotnet_assemblies: DS_HASH_TABLE [ET_ECF_DOTNET_ASSEMBLY, STRING]
			-- Already parsed .NET assemblies, indexed by filenames

	full_filename (a_filename: STRING; a_target: ET_ECF_TARGET): STRING
			-- Canonical absolute filename of `a_filename' appearing in `a_target'.
		require
			a_filename_not_void: a_filename /= Void
			a_target_not_void: a_target /= Void
		local
			l_root_dir: STRING
		do
			Result := a_target.variables.interpreted_string (a_filename)
				-- Make sure that the directory separator symbol is the
				-- one of the current file system. We take advantage of
				-- the fact that `windows_file_system' accepts both '\'
				-- and '/' as directory separator.
			Result := file_system.pathname_from_file_system (Result, windows_file_system)
			if file_system.is_relative_pathname (Result) then
				if attached a_target.settings.value ({ET_ECF_SETTING_NAMES}.library_root_setting_name) as l_library_root then
					l_root_dir := l_library_root
				else
					l_root_dir := file_system.dirname (a_target.system_config.filename)
				end
				Result := file_system.pathname (l_root_dir, Result)
			end
			Result := file_system.canonical_pathname (Result)
		ensure
			full_filename_not_void: Result /= Void
		end

invariant

	xml_parser_not_void: xml_parser /= Void
	tree_pipe_not_void: tree_pipe /= Void
	position_table_enabled: tree_pipe.tree.is_position_table_enabled
	redirected_locations_not_void: redirected_locations /= Void
	no_void_redirected_location: not redirected_locations.has_void

end
