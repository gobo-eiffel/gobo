note

	description:

		"ECF parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2011, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_ECF_PARSER_SKELETON

inherit

	ANY

	ET_ECF_ELEMENT_NAMES
		export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_OPERATING_SYSTEM
		export {NONE} all end

	KL_SHARED_FILE_SYSTEM
		export {NONE} all end

feature {NONE} -- Initialization

	make_standard
			-- Create a new ECF parser.
			-- Error messages will be sent to standard files.
		local
			a_handler: ET_ECF_ERROR_HANDLER
		do
			create a_handler.make_standard
			make (a_handler)
		ensure
			ise_version_set: ise_version = ise_latest
		end

	make (an_error_handler: like error_handler)
			-- Create a new ECF parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create ast_factory.make
			make_with_factory (ast_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
			ise_version_set: ise_version = ise_latest
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create a new ECF parser using `a_factory' as AST factory.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
			ast_factory := a_factory
			ise_version := ise_latest
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
			ise_version_set: ise_version = ise_latest
		end

feature -- Access

	ast_factory: ET_ECF_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_ECF_ERROR_HANDLER
			-- Error handler

	parsed_libraries: DS_HASH_TABLE [ET_ECF_LIBRARY, STRING]
			-- Already parsed ECF libraries, indexed by UUID
		deferred
		ensure
			parsed_libraries_not_void: Result /= Void
			no_void_library: not Result.has_void_item
		end

	parsed_dotnet_assemblies: DS_HASH_TABLE [ET_ECF_DOTNET_ASSEMBLY, STRING]
			-- Already parsed .NET assemblies, indexed by filenames
		deferred
		ensure
			parsed_dotnet_assemblies_not_void: Result /= Void
			no_void_dotnet_assembly: not Result.has_void_item
		end

	library_parser: ET_ECF_LIBRARY_PARSER
			-- Library parser
		deferred
		ensure
			library_parser_not_void: Result /= Void
		end

	ise_version: UT_VERSION
			-- ISE version to be used when evaluating version conditions

feature -- Setting

	set_ise_version (a_version: like ise_version)
			-- Set `ise_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ise_version := a_version
		ensure
			ise_version_set: ise_version = a_version
		end

feature {NONE} -- AST factory

	new_adapted_dotnet_assembly (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			-- New .NET assembly built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_assembly: STRING_.same_case_insensitive (an_element.name, xml_assembly)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_filename: XM_ATTRIBUTE
			l_dotnet_assembly: ET_ECF_DOTNET_ASSEMBLY
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_old_name: XM_ATTRIBUTE
			l_new_name: XM_ATTRIBUTE
			l_renamings: DS_HASH_TABLE [STRING, STRING]
			l_readonly: XM_ATTRIBUTE
			l_prefix: XM_ATTRIBUTE
			l_bool: STRING
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_filename := an_element.attribute_by_name (xml_location)
			if l_name = Void then
				error_handler.report_eacx_error (element_name (an_element, a_position_table), a_universe)
			elseif l_filename = Void then
				error_handler.report_eacy_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eacz_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_filename.value.is_empty then
				error_handler.report_eada_error (attribute_name (l_filename, a_position_table), a_universe)
			else
				Result := ast_factory.new_adapted_dotnet_assembly (attribute_value (l_name, a_position_table), attribute_value (l_filename, a_position_table), a_universe)
				l_dotnet_assembly := new_dotnet_assembly (an_element, a_position_table, Result)
				Result.set_dotnet_assembly (l_dotnet_assembly)
				l_readonly := an_element.attribute_by_name (xml_readonly)
				if l_readonly /= Void then
					l_bool := l_readonly.value
					if is_true (l_bool) then
						Result.set_read_only (True)
					elseif is_false (l_bool) then
						Result.set_read_only (False)
					else
						error_handler.report_eacw_error (attribute_name (l_readonly, a_position_table), l_bool, a_universe)
					end
				end
				l_prefix := an_element.attribute_by_name (xml_prefix)
				if l_prefix /= Void then
					Result.set_classname_prefix (l_prefix.value)
				end
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_old_name := l_child.attribute_by_name (xml_old_name)
							l_new_name := l_child.attribute_by_name (xml_new_name)
							if l_old_name = Void then
								error_handler.report_eaco_error (element_name (l_child, a_position_table), a_universe)
							elseif l_old_name.value.is_empty then
								error_handler.report_eacp_error (attribute_name (l_old_name, a_position_table), a_universe)
							elseif l_new_name = Void then
								error_handler.report_eacq_error (element_name (l_child, a_position_table), a_universe)
							elseif l_new_name.value.is_empty then
								error_handler.report_eacr_error (attribute_name (l_new_name, a_position_table), a_universe)
							else
								if l_renamings = Void then
									create l_renamings.make_map (10)
									l_renamings.set_key_equality_tester (case_insensitive_string_equality_tester)
								end
								l_renamings.search (l_old_name.value)
								if l_renamings.found then
									error_handler.report_eacs_error (attribute_name (l_old_name, a_position_table), a_universe)
								end
								l_renamings.force_last (l_new_name.value, l_old_name.value)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_class_renamings (l_renamings)
				Result.set_condition (l_conditions)
			end
		end

	new_adapted_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_ADAPTED_LIBRARY
			-- New library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_case_insensitive (an_element.name, xml_library)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_filename: XM_ATTRIBUTE
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_old_name: XM_ATTRIBUTE
			l_new_name: XM_ATTRIBUTE
			l_renamings: DS_HASH_TABLE [STRING, STRING]
			l_readonly: XM_ATTRIBUTE
			l_prefix: XM_ATTRIBUTE
			l_bool: STRING
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_filename := an_element.attribute_by_name (xml_location)
			if l_name = Void then
				error_handler.report_eaaa_error (element_name (an_element, a_position_table), a_universe)
			elseif l_filename = Void then
				error_handler.report_eaab_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eaac_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_filename.value.is_empty then
				error_handler.report_eaad_error (attribute_name (l_filename, a_position_table), a_universe)
			else
				Result := ast_factory.new_adapted_library (attribute_value (l_name, a_position_table), attribute_value (l_filename, a_position_table), a_universe)
				l_readonly := an_element.attribute_by_name (xml_readonly)
				if l_readonly /= Void then
					l_bool := l_readonly.value
					if is_true (l_bool) then
						Result.set_read_only (True)
					elseif is_false (l_bool) then
						Result.set_read_only (False)
					else
						error_handler.report_eacv_error (attribute_name (l_readonly, a_position_table), l_bool, a_universe)
					end
				end
				l_prefix := an_element.attribute_by_name (xml_prefix)
				if l_prefix /= Void then
					Result.set_classname_prefix (l_prefix.value)
				end
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_renaming) then
							l_old_name := l_child.attribute_by_name (xml_old_name)
							l_new_name := l_child.attribute_by_name (xml_new_name)
							if l_old_name = Void then
								error_handler.report_eaco_error (element_name (l_child, a_position_table), a_universe)
							elseif l_old_name.value.is_empty then
								error_handler.report_eacp_error (attribute_name (l_old_name, a_position_table), a_universe)
							elseif l_new_name = Void then
								error_handler.report_eacq_error (element_name (l_child, a_position_table), a_universe)
							elseif l_new_name.value.is_empty then
								error_handler.report_eacr_error (attribute_name (l_new_name, a_position_table), a_universe)
							else
								if l_renamings = Void then
									create l_renamings.make_map (10)
									l_renamings.set_key_equality_tester (case_insensitive_string_equality_tester)
								end
								l_renamings.search (l_old_name.value)
								if l_renamings.found then
									error_handler.report_eacs_error (attribute_name (l_old_name, a_position_table), a_universe)
								end
								l_renamings.force_last (l_new_name.value, l_old_name.value)
							end
						end
					end
					l_cursor.forth
				end
				Result.set_class_renamings (l_renamings)
				Result.set_condition (l_conditions)
			end
		end

	new_build_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_BUILD_CONDITION
			-- New build condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_build: STRING_.same_case_insensitive (an_element.name, xml_build)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_excluded_value: XM_ATTRIBUTE
		do
			l_value := an_element.attribute_by_name (xml_value)
			l_excluded_value := an_element.attribute_by_name (xml_excluded_value)
			if l_value /= Void then
				if l_excluded_value /= Void then
					error_handler.report_eaae_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), a_universe)
				elseif l_value.value.is_empty then
					error_handler.report_eaaf_error (attribute_name (l_value, a_position_table), a_universe)
				else
					Result := ast_factory.new_build_condition (l_value.value, False)
				end
			elseif l_excluded_value = Void then
				error_handler.report_eaah_error (element_name (an_element, a_position_table), a_universe)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eaag_error (attribute_name (l_excluded_value, a_position_table), a_universe)
			else
				Result := ast_factory.new_build_condition (l_excluded_value.value, True)
			end
		end

	new_cluster (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_override: BOOLEAN; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CLUSTER
			-- New cluster built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: STRING_.same_case_insensitive (an_element.name, xml_cluster)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_pathname: XM_ATTRIBUTE
			l_recursive: XM_ATTRIBUTE
			l_readonly: XM_ATTRIBUTE
			l_bool: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_cluster: ET_ECF_CLUSTER
			l_subclusters: ET_ECF_CLUSTERS
			l_file_rule: ET_ECF_FILE_RULE
			l_file_rules: ET_ECF_FILE_RULES
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_pathname := an_element.attribute_by_name (xml_location)
			if l_name = Void then
				error_handler.report_eaai_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eaak_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_pathname = Void then
				error_handler.report_eaaj_error (element_name (an_element, a_position_table), a_universe)
			elseif l_pathname.value.is_empty then
				error_handler.report_eaal_error (attribute_name (l_pathname, a_position_table), a_universe)
			else
				Result := ast_factory.new_cluster (l_name.value, l_pathname.value, a_universe)
				Result.set_override (a_override)
				l_recursive := an_element.attribute_by_name (xml_recursive)
				if l_recursive /= Void then
					l_bool := l_recursive.value
					if is_true (l_bool) then
						Result.set_recursive (True)
					elseif is_false (l_bool) then
						Result.set_recursive (False)
					else
						error_handler.report_eaam_error (attribute_name (l_recursive, a_position_table), l_bool, a_universe)
					end
				end
				l_readonly := an_element.attribute_by_name (xml_readonly)
				if l_readonly /= Void then
					l_bool := l_readonly.value
					if is_true (l_bool) then
						Result.set_read_only (True)
					elseif is_false (l_bool) then
						Result.set_read_only (False)
					else
						error_handler.report_eact_error (attribute_name (l_readonly, a_position_table), l_bool, a_universe)
					end
				end
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_cluster) then
							l_cluster := new_cluster (l_child, a_position_table, a_override, a_universe)
							if l_cluster /= Void then
								if l_subclusters = Void then
									l_subclusters := ast_factory.new_clusters (l_cluster)
								else
									l_subclusters.put_last (l_cluster)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rule := new_file_rule (l_child, a_position_table, a_universe)
							if l_file_rule /= Void then
								if l_file_rules = Void then
									l_file_rules := ast_factory.new_file_rules (l_file_rule)
								else
									l_file_rules.put_last (l_file_rule)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						end
					end
					l_cursor.forth
				end
				Result.set_ecf_subclusters (l_subclusters)
				Result.set_ecf_file_rules (l_file_rules)
				Result.set_condition (l_conditions)
			end
		end

	new_concurrency_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CONCURRENCY_CONDITION
			-- New concurrency condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_concurrency: STRING_.same_case_insensitive (an_element.name, xml_concurrency)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_excluded_value: XM_ATTRIBUTE
		do
			l_value := an_element.attribute_by_name (xml_value)
			l_excluded_value := an_element.attribute_by_name (xml_excluded_value)
			if l_value /= Void then
				if l_excluded_value /= Void then
					error_handler.report_eadb_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), a_universe)
				elseif l_value.value.is_empty then
					error_handler.report_eadc_error (attribute_name (l_value, a_position_table), a_universe)
				else
					Result := ast_factory.new_concurrency_condition (l_value.value, False)
				end
			elseif l_excluded_value = Void then
				error_handler.report_eadd_error (element_name (an_element, a_position_table), a_universe)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eade_error (attribute_name (l_excluded_value, a_position_table), a_universe)
			else
				Result := ast_factory.new_concurrency_condition (l_excluded_value.value, True)
			end
		end

	new_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CONDITIONS
			-- New condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_condition: STRING_.same_case_insensitive (an_element.name, xml_condition)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_condition: ET_ECF_CONDITION
		do
			Result := ast_factory.new_condition
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_child ?= l_cursor.item
				if l_child /= Void then
					if STRING_.same_case_insensitive (l_child.name, xml_platform) then
						l_condition := new_platform_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_build) then
						l_condition := new_build_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_multithreaded) then
						l_condition := new_multithreaded_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_concurrency) then
						l_condition := new_concurrency_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_dotnet) then
						l_condition := new_dotnet_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_dynamic_runtime) then
						l_condition := new_dynamic_runtime_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_custom) then
						l_condition := new_custom_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_version) then
						l_condition := new_version_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					end
				end
				l_cursor.forth
			end
		end

	new_custom_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CUSTOM_CONDITION
			-- New custom condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_custom: STRING_.same_case_insensitive (an_element.name, xml_custom)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_value: XM_ATTRIBUTE
			l_excluded_value: XM_ATTRIBUTE
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_value := an_element.attribute_by_name (xml_value)
			l_excluded_value := an_element.attribute_by_name (xml_excluded_value)
			if l_name = Void then
				error_handler.report_eaan_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eaao_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_value /= Void then
				if l_excluded_value /= Void then
					error_handler.report_eaap_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), a_universe)
				elseif l_value.value.is_empty then
					error_handler.report_eaaq_error (attribute_name (l_value, a_position_table), a_universe)
				else
					Result := ast_factory.new_custom_condition (l_name.value, l_value.value, False)
				end
			elseif l_excluded_value = Void then
				error_handler.report_eaas_error (element_name (an_element, a_position_table), a_universe)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eaar_error (attribute_name (l_excluded_value, a_position_table), a_universe)
			else
				Result := ast_factory.new_custom_condition (l_name.value, l_excluded_value.value, True)
			end
		end

	new_dotnet_assembly (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_adapted_dotnet_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY): ET_ECF_DOTNET_ASSEMBLY
			-- New .NET assembly built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_assembly: STRING_.same_case_insensitive (an_element.name, xml_assembly)
			a_position_table_not_void: a_position_table /= Void
			a_adapted_dotnet_assembly_not_void: a_adapted_dotnet_assembly /= Void
		local
			l_parsed_dotnet_assemblies: like parsed_dotnet_assemblies
			l_filename: STRING
		do
			l_parsed_dotnet_assemblies := parsed_dotnet_assemblies
				-- Make sure that the filename of the .NET assembly is a canonical absolute pathname.
			l_filename := a_adapted_dotnet_assembly.filename.name
			l_filename := Execution_environment.interpreted_string (l_filename)
				-- Make sure that the directory separator symbol is the
				-- one of the current file system. We take advantage of
				-- the fact that `windows_file_system' accepts both '\'
				-- and '/' as directory separator.
			l_filename := file_system.pathname_from_file_system (l_filename, windows_file_system)
			if file_system.is_relative_pathname (l_filename) then
				l_filename := file_system.pathname (file_system.dirname (a_adapted_dotnet_assembly.universe.filename), l_filename)
			end
			l_filename := file_system.canonical_pathname (l_filename)
			if operating_system.is_windows then
				l_filename := l_filename.as_lower
			end
			l_parsed_dotnet_assemblies.search (l_filename)
			if l_parsed_dotnet_assemblies.found then
					-- Already parsed.
				Result := l_parsed_dotnet_assemblies.found_item
				a_adapted_dotnet_assembly.set_dotnet_assembly (Result)
			else
				Result := ast_factory.new_dotnet_assembly (a_adapted_dotnet_assembly.name, l_filename, a_adapted_dotnet_assembly.universe.current_system)
				a_adapted_dotnet_assembly.set_dotnet_assembly (Result)
				l_parsed_dotnet_assemblies.force_last_new (Result, l_filename)
			end
		end

	new_dotnet_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_DOTNET_CONDITION
			-- New dotnet condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_dotnet: STRING_.same_case_insensitive (an_element.name, xml_dotnet)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_bool: STRING
		do
			l_value := an_element.attribute_by_name (xml_value)
			if l_value = Void then
				error_handler.report_eaat_error (element_name (an_element, a_position_table), a_universe)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_dotnet_condition (True)
				elseif is_false (l_bool) then
					Result := ast_factory.new_dotnet_condition (False)
				else
					error_handler.report_eaau_error (attribute_name (l_value, a_position_table), l_bool, a_universe)
				end
			end
		end

	new_dynamic_runtime_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_DYNAMIC_RUNTIME_CONDITION
			-- New dynamic_runtime condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_dynamic_runtime: STRING_.same_case_insensitive (an_element.name, xml_dynamic_runtime)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_bool: STRING
		do
			l_value := an_element.attribute_by_name (xml_value)
			if l_value = Void then
				error_handler.report_eaav_error (element_name (an_element, a_position_table), a_universe)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_dynamic_runtime_condition (True)
				elseif is_false (l_bool) then
					Result := ast_factory.new_dynamic_runtime_condition (False)
				else
					error_handler.report_eaaw_error (attribute_name (l_value, a_position_table), l_bool, a_universe)
				end
			end
		end

	new_external_include (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_EXTERNAL_INCLUDE
			-- New external include built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_external_include: STRING_.same_case_insensitive (an_element.name, xml_external_include)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_pathname: XM_ATTRIBUTE
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
		do
			l_pathname := an_element.attribute_by_name (xml_location)
			if l_pathname = Void then
				error_handler.report_eaci_error (element_name (an_element, a_position_table), a_universe)
			elseif l_pathname.value.is_empty then
				error_handler.report_eacj_error (attribute_name (l_pathname, a_position_table), a_universe)
			else
				Result := ast_factory.new_external_include (l_pathname.value)
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						end
					end
					l_cursor.forth
				end
				Result.set_condition (l_conditions)
			end
		end

	new_external_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_EXTERNAL_LIBRARY
			-- New external library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_external_library: STRING_.same_case_insensitive (an_element.name, xml_external_library)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_pathname: XM_ATTRIBUTE
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
		do
			l_pathname := an_element.attribute_by_name (xml_location)
			if l_pathname = Void then
				error_handler.report_eack_error (element_name (an_element, a_position_table), a_universe)
			elseif l_pathname.value.is_empty then
				error_handler.report_eacl_error (attribute_name (l_pathname, a_position_table), a_universe)
			else
				Result := ast_factory.new_external_library (l_pathname.value)
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						end
					end
					l_cursor.forth
				end
				Result.set_condition (l_conditions)
			end
		end

	new_external_object (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_EXTERNAL_OBJECT
			-- New external object built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_external_object: STRING_.same_case_insensitive (an_element.name, xml_external_object)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_pathname: XM_ATTRIBUTE
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
		do
			l_pathname := an_element.attribute_by_name (xml_location)
			if l_pathname = Void then
				error_handler.report_eacm_error (element_name (an_element, a_position_table), a_universe)
			elseif l_pathname.value.is_empty then
				error_handler.report_eacn_error (attribute_name (l_pathname, a_position_table), a_universe)
			else
				Result := ast_factory.new_external_object (l_pathname.value)
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						end
					end
					l_cursor.forth
				end
				Result.set_condition (l_conditions)
			end
		end

	new_file_rule (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_FILE_RULE
			-- New file rule built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_file_rule: STRING_.same_case_insensitive (an_element.name, xml_file_rule)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_excluded: DS_HASH_SET [STRING]
			l_included: DS_HASH_SET [STRING]
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
			l_text: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
		do
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_child ?= l_cursor.item
				if l_child /= Void then
					if STRING_.same_case_insensitive (l_child.name, xml_exclude) then
						l_text := l_child.text
						if l_text /= Void and then not l_text.is_empty then
							if l_excluded = Void then
								create l_excluded.make (10)
							end
							l_excluded.force_last (l_text)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_include) then
						l_text := l_child.text
						if l_text /= Void and then not l_text.is_empty then
							if l_included = Void then
								create l_included.make (10)
							end
							l_included.force_last (l_text)
						end
					elseif STRING_.same_case_insensitive (l_child.name, xml_condition) then
						l_condition := new_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							if l_conditions = Void then
								l_conditions := ast_factory.new_conditions (l_condition)
							else
								l_conditions.put_last (l_condition)
							end
						end
					end
				end
				l_cursor.forth
			end
			Result := ast_factory.new_file_rule (l_excluded, l_included)
			Result.set_condition (l_conditions)
		end

	new_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING; a_adapted_library: ET_ECF_ADAPTED_LIBRARY): ET_ECF_LIBRARY
			-- New library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_case_insensitive (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_filename_not_void: a_filename /= Void
			a_adapted_library_not_void: a_adapted_library /= Void
		local
			l_name: XM_ATTRIBUTE
			l_uuid: XM_ATTRIBUTE
			l_unknown_library: ET_ECF_LIBRARY
			l_parsed_libraries: like parsed_libraries
			l_system: ET_SYSTEM
		do
			l_system := a_adapted_library.universe.current_system
			l_uuid := an_element.attribute_by_name (xml_uuid)
			if l_uuid = Void then
				l_name := an_element.attribute_by_name (xml_name)
				if l_name = Void then
					l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
				elseif l_name.value.is_empty then
					l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
				else
					l_unknown_library := ast_factory.new_library (l_name.value, a_filename, l_system)
				end
				a_adapted_library.set_library (l_unknown_library)
				error_handler.report_eabo_error (element_name (an_element, a_position_table), l_unknown_library)
			else
				l_parsed_libraries := parsed_libraries
				l_parsed_libraries.search (l_uuid.value)
				if l_parsed_libraries.found then
						-- Already parsed.
					Result := l_parsed_libraries.found_item
					a_adapted_library.set_library (Result)
				else
					l_name := an_element.attribute_by_name (xml_name)
					if l_name = Void then
						l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
						a_adapted_library.set_library (l_unknown_library)
						error_handler.report_eabm_error (element_name (an_element, a_position_table), l_unknown_library)
					elseif l_name.value.is_empty then
						l_unknown_library := ast_factory.new_library ("*unknown*", a_filename, l_system)
						a_adapted_library.set_library (l_unknown_library)
						error_handler.report_eabn_error (attribute_name (l_name, a_position_table), l_unknown_library)
					else
						Result := ast_factory.new_library (l_name.value, a_filename, l_system)
						a_adapted_library.set_library (Result)
						fill_system_config (Result, an_element, a_position_table, Result)
						l_parsed_libraries.force_last_new (Result, l_uuid.value)
					end
				end
			end
		end

	new_multithreaded_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_MULTITHREADED_CONDITION
			-- New multithreaded condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_multithreaded: STRING_.same_case_insensitive (an_element.name, xml_multithreaded)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_bool: STRING
		do
			l_value := an_element.attribute_by_name (xml_value)
			if l_value = Void then
				error_handler.report_eaax_error (element_name (an_element, a_position_table), a_universe)
			else
				l_bool := l_value.value
				if is_true (l_bool) then
					Result := ast_factory.new_multithreaded_condition (True)
				elseif is_false (l_bool) then
					Result := ast_factory.new_multithreaded_condition (False)
				else
					error_handler.report_eaay_error (attribute_name (l_value, a_position_table), l_bool, a_universe)
				end
			end
		end

	new_override (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CLUSTER
			-- New override built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_override: STRING_.same_case_insensitive (an_element.name, xml_override)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_pathname: XM_ATTRIBUTE
			l_recursive: XM_ATTRIBUTE
			l_readonly: XM_ATTRIBUTE
			l_bool: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_cluster: ET_ECF_CLUSTER
			l_subclusters: ET_ECF_CLUSTERS
			l_file_rule: ET_ECF_FILE_RULE
			l_file_rules: ET_ECF_FILE_RULES
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_pathname := an_element.attribute_by_name (xml_location)
			if l_name = Void then
				error_handler.report_eacd_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eacf_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_pathname = Void then
				error_handler.report_eace_error (element_name (an_element, a_position_table), a_universe)
			elseif l_pathname.value.is_empty then
				error_handler.report_eacg_error (attribute_name (l_pathname, a_position_table), a_universe)
			else
				Result := ast_factory.new_cluster (l_name.value, l_pathname.value, a_universe)
				Result.set_override (True)
				l_recursive := an_element.attribute_by_name (xml_recursive)
				if l_recursive /= Void then
					l_bool := l_recursive.value
					if is_true (l_bool) then
						Result.set_recursive (True)
					elseif is_false (l_bool) then
						Result.set_recursive (False)
					else
						error_handler.report_each_error (attribute_name (l_recursive, a_position_table), l_bool, a_universe)
					end
				end
				l_readonly := an_element.attribute_by_name (xml_readonly)
				if l_readonly /= Void then
					l_bool := l_readonly.value
					if is_true (l_bool) then
						Result.set_read_only (True)
					elseif is_false (l_bool) then
						Result.set_read_only (False)
					else
						error_handler.report_eacu_error (attribute_name (l_readonly, a_position_table), l_bool, a_universe)
					end
				end
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_cluster) then
							l_cluster := new_cluster (l_child, a_position_table, True, a_universe)
							if l_cluster /= Void then
								if l_subclusters = Void then
									l_subclusters := ast_factory.new_clusters (l_cluster)
								else
									l_subclusters.put_last (l_cluster)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rule := new_file_rule (l_child, a_position_table, a_universe)
							if l_file_rule /= Void then
								if l_file_rules = Void then
									l_file_rules := ast_factory.new_file_rules (l_file_rule)
								else
									l_file_rules.put_last (l_file_rule)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_condition) then
							l_condition := new_condition (l_child, a_position_table, a_universe)
							if l_condition /= Void then
								if l_conditions = Void then
									l_conditions := ast_factory.new_conditions (l_condition)
								else
									l_conditions.put_last (l_condition)
								end
							end
						end
					end
					l_cursor.forth
				end
				Result.set_ecf_subclusters (l_subclusters)
				Result.set_ecf_file_rules (l_file_rules)
				Result.set_condition (l_conditions)
			end
		end

	new_platform_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_PLATFORM_CONDITION
			-- New platform condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_platform: STRING_.same_case_insensitive (an_element.name, xml_platform)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: XM_ATTRIBUTE
			l_excluded_value: XM_ATTRIBUTE
		do
			l_value := an_element.attribute_by_name (xml_value)
			l_excluded_value := an_element.attribute_by_name (xml_excluded_value)
			if l_value /= Void then
				if l_excluded_value /= Void then
					error_handler.report_eaaz_error (attribute_name (l_value, a_position_table), attribute_name (l_excluded_value, a_position_table), a_universe)
				elseif l_value.value.is_empty then
					error_handler.report_eaba_error (attribute_name (l_value, a_position_table), a_universe)
				else
					Result := ast_factory.new_platform_condition (l_value.value, False)
				end
			elseif l_excluded_value = Void then
				error_handler.report_eabc_error (element_name (an_element, a_position_table), a_universe)
			elseif l_excluded_value.value.is_empty then
				error_handler.report_eabb_error (attribute_name (l_excluded_value, a_position_table), a_universe)
			else
				Result := ast_factory.new_platform_condition (l_excluded_value.value, True)
			end
		end

	new_root (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_ROOT
			-- New root built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_root: STRING_.same_case_insensitive (an_element.name, xml_root)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_root_class: ET_ECF_ROOT_CLASS
			l_all_classes: XM_ATTRIBUTE
			l_all_classes_true: BOOLEAN
			l_bool: STRING
			l_class_name: XM_ATTRIBUTE
			l_feature: XM_ATTRIBUTE
		do
			l_all_classes := an_element.attribute_by_name (xml_all_classes)
			l_class_name := an_element.attribute_by_name (xml_class)
			if l_all_classes /= Void then
				l_bool := l_all_classes.value
				if is_true (l_bool) then
					l_all_classes_true := True
				elseif not is_false (l_bool) then
					error_handler.report_eabz_error (attribute_name (l_all_classes, a_position_table), l_bool, a_universe)
				end
			end
			if l_all_classes_true then
				Result := ast_factory.new_root_all_classes
			elseif l_class_name = Void then
				error_handler.report_eaca_error (element_name (an_element, a_position_table), a_universe)
			elseif l_class_name.value.is_empty then
				error_handler.report_eacb_error (attribute_name (l_class_name, a_position_table), a_universe)
			else
				l_root_class := ast_factory.new_root_class (attribute_value (l_class_name, a_position_table))
				Result := l_root_class
				l_feature := an_element.attribute_by_name (xml_feature)
				if l_feature = Void then
						-- Do nothing.
				elseif l_feature.value.is_empty then
					error_handler.report_eacc_error (attribute_name (l_feature, a_position_table), a_universe)
				else
					l_root_class.set_creation_procedure_name (attribute_value (l_feature, a_position_table))
				end
			end
		end

	new_system (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING): ET_ECF_SYSTEM
			-- New system built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_case_insensitive (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_filename_not_void: a_filename /= Void
		local
			l_name: XM_ATTRIBUTE
			l_unknown_universe: ET_ECF_SYSTEM
		do
			l_name := an_element.attribute_by_name (xml_name)
			if l_name = Void then
				l_unknown_universe := ast_factory.new_system ("*unknown*", a_filename)
				error_handler.report_eabk_error (element_name (an_element, a_position_table), l_unknown_universe)
			elseif l_name.value.is_empty then
				l_unknown_universe := ast_factory.new_system ("*unknown*", a_filename)
				error_handler.report_eabl_error (element_name (an_element, a_position_table), l_unknown_universe)
			else
				Result := ast_factory.new_system (l_name.value, a_filename)
				fill_system_config (Result, an_element, a_position_table, Result)
			end
		end

	new_target (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_TARGET
			-- New target built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_target: STRING_.same_case_insensitive (an_element.name, xml_target)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_cluster: ET_ECF_CLUSTER
			l_clusters: ET_ECF_CLUSTERS
			l_library: ET_ECF_ADAPTED_LIBRARY
			l_libraries: ET_ECF_ADAPTED_LIBRARIES
			l_dotnet_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			l_dotnet_assemblies: ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			l_file_rule: ET_ECF_FILE_RULE
			l_file_rules: ET_ECF_FILE_RULES
			l_external_include: ET_ECF_EXTERNAL_INCLUDE
			l_external_includes: ET_ECF_EXTERNAL_INCLUDES
			l_external_object: ET_ECF_EXTERNAL_OBJECT
			l_external_objects: ET_ECF_EXTERNAL_OBJECTS
			l_external_library: ET_ECF_EXTERNAL_LIBRARY
			l_external_libraries: ET_ECF_EXTERNAL_LIBRARIES
			l_root: ET_ECF_ROOT
		do
			l_name := an_element.attribute_by_name (xml_name)
			if l_name = Void then
				error_handler.report_eabd_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eabe_error (attribute_name (l_name, a_position_table), a_universe)
			else
				Result := ast_factory.new_target (l_name.value)
				l_cursor := an_element.new_cursor
				from l_cursor.start until l_cursor.after loop
					l_child ?= l_cursor.item
					if l_child /= Void then
						if STRING_.same_case_insensitive (l_child.name, xml_cluster) then
							l_cluster := new_cluster (l_child, a_position_table, False, a_universe)
							if l_cluster /= Void then
								if l_clusters = Void then
									l_clusters := ast_factory.new_clusters (l_cluster)
								else
									l_clusters.put_last (l_cluster)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_override) then
							l_cluster := new_override (l_child, a_position_table, a_universe)
							if l_cluster /= Void then
								if l_clusters = Void then
									l_clusters := ast_factory.new_clusters (l_cluster)
								else
									l_clusters.put_last (l_cluster)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_library) then
							l_library := new_adapted_library (l_child, a_position_table, a_universe)
							if l_library /= Void then
								if l_libraries = Void then
									l_libraries := ast_factory.new_adapted_libraries (l_library)
								else
									l_libraries.put_last (l_library)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_assembly) then
							l_dotnet_assembly := new_adapted_dotnet_assembly (l_child, a_position_table, a_universe)
							if l_dotnet_assembly /= Void then
								if l_dotnet_assemblies = Void then
									l_dotnet_assemblies := ast_factory.new_adapted_dotnet_assemblies (l_dotnet_assembly)
								else
									l_dotnet_assemblies.put_last (l_dotnet_assembly)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_file_rule) then
							l_file_rule := new_file_rule (l_child, a_position_table, a_universe)
							if l_file_rule /= Void then
								if l_file_rules = Void then
									l_file_rules := ast_factory.new_file_rules (l_file_rule)
								else
									l_file_rules.put_last (l_file_rule)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_include) then
							l_external_include := new_external_include (l_child, a_position_table, a_universe)
							if l_external_include /= Void then
								if l_external_includes = Void then
									l_external_includes := ast_factory.new_external_includes (l_external_include)
								else
									l_external_includes.put_last (l_external_include)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_library) then
							l_external_library := new_external_library (l_child, a_position_table, a_universe)
							if l_external_library /= Void then
								if l_external_libraries = Void then
									l_external_libraries := ast_factory.new_external_libraries (l_external_library)
								else
									l_external_libraries.put_last (l_external_library)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_external_object) then
							l_external_object := new_external_object (l_child, a_position_table, a_universe)
							if l_external_object /= Void then
								if l_external_objects = Void then
									l_external_objects := ast_factory.new_external_objects (l_external_object)
								else
									l_external_objects.put_last (l_external_object)
								end
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_root) then
							if Result.root /= Void then
-- TODO: warning: several roots specified.
							end
							l_root := new_root (l_child, a_position_table, a_universe)
							if l_root /= Void then
								Result.set_root (l_root)
							end
						elseif STRING_.same_case_insensitive (l_child.name, xml_variable) then
							add_variable (Result.variables, l_child, a_position_table, a_universe)
						elseif STRING_.same_case_insensitive (l_child.name, xml_setting) then
							add_setting (Result.settings, l_child, a_position_table, a_universe)
						elseif STRING_.same_case_insensitive (l_child.name, xml_option) then
							add_option (Result.options, l_child, a_position_table, a_universe)
						end
					end
					l_cursor.forth
				end
				Result.set_clusters (l_clusters)
				Result.set_libraries (l_libraries)
				Result.set_dotnet_assemblies (l_dotnet_assemblies)
				Result.set_file_rules (l_file_rules)
				Result.set_external_includes (l_external_includes)
				Result.set_external_libraries (l_external_libraries)
				Result.set_external_objects (l_external_objects)
			end
		end

	new_version_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_VERSION_CONDITION
			-- New version condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_version: STRING_.same_case_insensitive (an_element.name, xml_version)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_type: XM_ATTRIBUTE
			l_min: XM_ATTRIBUTE
			l_max: XM_ATTRIBUTE
			l_min_version: UT_VERSION
			l_max_version: UT_VERSION
			l_version_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			l_min := an_element.attribute_by_name (xml_min)
			if l_min /= Void then
				create l_version_regexp.make
				l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_version_regexp.recognizes (l_min.value) then
					inspect l_version_regexp.match_count
					when 2 then
						create l_min_version.make_major (l_version_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_min_version.make_major_minor (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_min_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create l_min_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, l_version_regexp.captured_substring (7).to_integer)
					else
						error_handler.report_eabf_error (attribute_name (l_min, a_position_table), l_min.value, a_universe)
					end
				end
			end
			l_max := an_element.attribute_by_name (xml_max)
			if l_max /= Void then
				create l_version_regexp.make
				l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
				if l_version_regexp.recognizes (l_max.value) then
					inspect l_version_regexp.match_count
					when 2 then
						create l_max_version.make_major (l_version_regexp.captured_substring (1).to_integer)
					when 4 then
						create l_max_version.make_major_minor (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer)
					when 6 then
						create l_max_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, 0)
					when 8 then
						create l_max_version.make (l_version_regexp.captured_substring (1).to_integer, l_version_regexp.captured_substring (3).to_integer, l_version_regexp.captured_substring (5).to_integer, l_version_regexp.captured_substring (7).to_integer)
					else
						error_handler.report_eabg_error (attribute_name (l_max, a_position_table), l_max.value, a_universe)
					end
				end
			end
			if (l_min_version /= Void and l_max_version /= Void) and then l_max_version < l_min_version then
				error_handler.report_eabh_error (attribute_name (l_min, a_position_table), l_min.value, attribute_name (l_max, a_position_table), l_max.value, a_universe)
			end
			l_type := an_element.attribute_by_name (xml_type)
			if l_type = Void then
				error_handler.report_eabi_error (element_name (an_element, a_position_table), a_universe)
			elseif STRING_.same_case_insensitive (l_type.value, xml_compiler) then
				create {ET_ECF_COMPILER_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
			elseif STRING_.same_case_insensitive (l_type.value, xml_msil_clr) then
				create {ET_ECF_COMPILER_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
			else
				error_handler.report_eabj_error (attribute_name (l_type, a_position_table), l_type.value, a_universe)
			end
		end

feature {NONE} -- Element change

	fill_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Build system `a_system_config' from `an_element'
		require
			a_system_config_not_void: a_system_config /= Void
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_case_insensitive (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_uuid: STRING
			l_namespace: XM_NAMESPACE
			l_namespace_uri: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_target: ET_ECF_TARGET
			l_targets: ET_ECF_TARGETS
			l_target_name: XM_ATTRIBUTE
		do
			if an_element.has_attribute_by_name (xml_uuid) then
				l_uuid := an_element.attribute_by_name (xml_uuid).value
				a_system_config.set_uuid (l_uuid)
			end
			l_namespace := an_element.namespace
			check
					-- According to the invariant 'has_namespace' in XM_NAMED_NODE,
					-- the namespace of an element is not void.
				l_namespace_not_void: l_namespace /= Void
			end
			l_namespace_uri := l_namespace.uri
			a_system_config.set_ecf_namespace (l_namespace_uri)
			a_system_config.set_ecf_version (ecf_version (l_namespace_uri))
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_child ?= l_cursor.item
				if l_child /= Void then
					if STRING_.same_case_insensitive (l_child.name, xml_target) then
						l_target := new_target (l_child, a_position_table, a_universe)
						if l_target /= Void then
							if l_targets = Void then
								l_targets := ast_factory.new_targets (l_target)
							else
								l_targets.put_last (l_target)
							end
						end
					end
				end
				l_cursor.forth
			end
			if l_targets = Void or else l_targets.is_empty then
					-- No target found in the ECF file.
				error_handler.report_eaby_error (element_name (an_element, a_position_table), a_universe)
			end
			a_system_config.set_targets (l_targets)
			l_target_name := an_element.attribute_by_name (xml_library_target)
			if l_target_name /= Void then
				if l_target_name.value.is_empty then
					error_handler.report_eabp_error (attribute_name (l_target_name, a_position_table), a_universe)
				elseif l_targets = Void then
					error_handler.report_eabq_error (attribute_name (l_target_name, a_position_table), l_target_name.value, a_universe)
				else
					l_target := l_targets.target_by_name (l_target_name.value)
					if l_target = Void then
						error_handler.report_eabq_error (attribute_name (l_target_name, a_position_table), l_target_name.value, a_universe)
					else
						a_system_config.set_library_target (l_target)
					end
				end
			end
		end

	add_variable (a_variables: ET_ECF_VARIABLES; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add to `a_variables' the variable held in `an_element'.
		require
			a_variables_not_void: a_variables /= Void
			an_element_not_void: an_element /= Void
			is_variable: STRING_.same_case_insensitive (an_element.name, xml_variable)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_value: XM_ATTRIBUTE
			l_other_value: STRING
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_value := an_element.attribute_by_name (xml_value)
			if l_name = Void then
				error_handler.report_eabr_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_eabs_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_value = Void then
				error_handler.report_eabt_error (element_name (an_element, a_position_table), a_universe)
			elseif l_value.value.is_empty then
				error_handler.report_eabu_error (attribute_name (l_value, a_position_table), a_universe)
			else
				l_other_value := a_variables.primary_value (l_name.value)
				if l_other_value /= Void then
-- TODO: warning: several variables with the same name! (not reported by ISE: use the last one.)
				end
				a_variables.set_primary_value (l_name.value, l_value.value)
			end
		end

	add_setting (a_settings: ET_ECF_SETTINGS; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add to `a_settings' the setting held in `an_element'.
		require
			a_settings_not_void: a_settings /= Void
			an_element_not_void: an_element /= Void
			is_setting: STRING_.same_case_insensitive (an_element.name, xml_setting)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: XM_ATTRIBUTE
			l_value: XM_ATTRIBUTE
			l_other_value: STRING
		do
			l_name := an_element.attribute_by_name (xml_name)
			l_value := an_element.attribute_by_name (xml_value)
			if l_name = Void then
				error_handler.report_esnm_error (element_name (an_element, a_position_table), a_universe)
			elseif l_name.value.is_empty then
				error_handler.report_esne_error (attribute_name (l_name, a_position_table), a_universe)
			elseif l_value = Void then
				error_handler.report_esvm_error (element_name (an_element, a_position_table), a_universe)
			elseif l_value.value.is_empty then
				error_handler.report_esve_error (attribute_name (l_value, a_position_table), a_universe)
			else
				l_other_value := a_settings.primary_value (l_name.value)
				if l_other_value /= Void then
-- TODO: warning: several settings with the same name! (not reported by ISE: use the last one.)
				end
				a_settings.set_primary_value (l_name.value, l_value.value)
			end
		end

	add_option (a_options: ET_ECF_OPTIONS; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_ECF_INTERNAL_UNIVERSE)
			-- Add to `a_options' the setting held in `an_element'.
		require
			a_options_not_void: a_options /= Void
			an_element_not_void: an_element /= Void
			is_option: STRING_.same_case_insensitive (an_element.name, xml_option)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_attribute: XM_ATTRIBUTE
			l_other_value: STRING
		do
			l_name := xml_void_safety
			l_attribute := an_element.attribute_by_name (l_name)
			if l_attribute = Void then
				-- Option not specified.
			else
				l_other_value := a_options.primary_value (l_name)
				if l_other_value /= Void then
-- TODO: warning: several options with the same name! (not reported by ISE: use the last one.)
				end
				a_options.set_primary_value (l_name, l_attribute.value)
			end
			l_name := xml_is_attached_by_default
			l_attribute := an_element.attribute_by_name (l_name)
			if l_attribute = Void then
				-- Option not specified.
			else
				l_other_value := a_options.primary_value (l_name)
				if l_other_value /= Void then
-- TODO: warning: several options with the same name! (not reported by ISE: use the last one.)
				end
				a_options.set_primary_value (l_name, l_attribute.value)
			end
		end

	parse_libraries (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE)
			-- Parse libraries referenced in `a_universe' when in `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_libraries: ET_ADAPTED_LIBRARIES
			l_adapted_library: ET_ECF_ADAPTED_LIBRARY
			l_library: ET_ECF_LIBRARY
			i, nb: INTEGER
			l_file: KL_TEXT_INPUT_FILE
			l_library_parser: like library_parser
			l_target: ET_ECF_TARGET
			l_filename: STRING
		do
			l_libraries := a_universe.libraries
			if l_libraries /= Void then
				l_library_parser := library_parser
				nb := l_libraries.count
				from i := 1 until i > nb loop
					l_adapted_library ?= l_libraries.library (i)
					if l_adapted_library /= Void then
							-- Make sure that the filename of the ECF library is a canonical absolute pathname.
						l_filename := l_adapted_library.filename.name
						l_filename := Execution_environment.interpreted_string (l_filename)
							-- Make sure that the directory separator symbol is the
							-- one of the current file system. We take advantage of
							-- the fact that `windows_file_system' accepts both '\'
							-- and '/' as directory separator.
						l_filename := file_system.pathname_from_file_system (l_filename, windows_file_system)
						if file_system.is_relative_pathname (l_filename) then
							l_filename := file_system.pathname (file_system.dirname (a_universe.filename), l_filename)
						end
						l_filename := file_system.canonical_pathname (l_filename)
						create l_file.make (l_filename)
						l_file.open_read
						if not l_file.is_open_read then
							error_handler.report_eabv_error (l_adapted_library.filename, l_filename, a_universe)
						else
							l_library_parser.parse_adapted_library (l_file, l_adapted_library)
							l_file.close
							l_library := l_library_parser.last_library
							if l_library = Void then
									-- The error has already been reported in the parser.
							else
								l_adapted_library.set_library (l_library)
								l_target := l_library.selected_target
								if l_target = Void then
										-- Get the library target.
									l_target := l_library.library_target
									if l_target = Void then
										error_handler.report_eabw_error (l_adapted_library.filename, l_filename, a_universe)
									else
										l_library.select_target (l_target, a_state)
										l_target.fill_options (l_library)
									end
								end
							end
						end
					end
					i := i + 1
				end
			end
		end

feature {NONE} -- Implementation

	element_name (a_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_IDENTIFIER
			-- Element name
		require
			a_element_not_void: a_element /= Void
			a_position_table_not_void: a_position_table /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_element.name)
			l_position := a_position_table.item (a_element)
			Result.set_position (l_position.row, l_position.column)
		ensure
			element_name_not_void: Result /= Void
		end

	attribute_name (a_attribute: XM_ATTRIBUTE; a_position_table: XM_POSITION_TABLE): ET_IDENTIFIER
			-- Attribute name
		require
			a_attribute_not_void: a_attribute /= Void
			a_position_table_not_void: a_position_table /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_attribute.name)
			l_position := a_position_table.item (a_attribute)
			Result.set_position (l_position.row, l_position.column)
		ensure
			attribute_name_not_void: Result /= Void
		end

	attribute_value (a_attribute: XM_ATTRIBUTE; a_position_table: XM_POSITION_TABLE): ET_IDENTIFIER
			-- Attribute value
		require
			a_attribute_not_void: a_attribute /= Void
			a_value_not_empty: not a_attribute.value.is_empty
			a_position_table_not_void: a_position_table /= Void
		local
			l_position: XM_POSITION
		do
			create Result.make (a_attribute.value)
			l_position := a_position_table.item (a_attribute)
			Result.set_position (l_position.row, l_position.column)
		ensure
			attribute_value_not_void: Result /= Void
		end

	is_true (a_string: STRING): BOOLEAN
			-- Is `a_string' equal to "true" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, True_constant)
		end

	is_false (a_string: STRING): BOOLEAN
			-- Is `a_string' equal to "false" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, False_constant)
		end

	ecf_version (a_namespace: STRING): UT_VERSION
			-- ECF version corresponding to `a_namespace', or void if not recognized
		require
			a_namespace_not_void: a_namespace /= Void
		local
			l_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			create l_regexp.make
			l_regexp.compile ("[^0-9]-([0-9]+)(-([0-9]+))?(-([0-9]+))?(-([0-9]+))?$")
			if l_regexp.matches (a_namespace) then
				inspect l_regexp.match_count
				when 2 then
					create Result.make_major (l_regexp.captured_substring (1).to_integer)
				when 4 then
					create Result.make_major_minor (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer)
				when 6 then
					create Result.make (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer, l_regexp.captured_substring (5).to_integer, 0)
				when 8 then
					create Result.make (l_regexp.captured_substring (1).to_integer, l_regexp.captured_substring (3).to_integer, l_regexp.captured_substring (5).to_integer, l_regexp.captured_substring (7).to_integer)
				else
				end
			end
		end

feature {NONE} -- Constant

	True_constant: STRING = "true"
			-- True constant

	False_constant: STRING = "false"
			-- False constant

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void
	ise_version_not_void: ise_version /= Void

end
