indexing

	description:

		"ECF parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008, Eric Bezault and others"
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

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

feature {NONE} -- Initialization

	make_standard is
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

	make (an_error_handler: like error_handler) is
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

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
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

	enclosing_universe: ET_ECF_INTERNAL_UNIVERSE
			-- One of the ECF universes from which the ECF config being parsed is referenced;
			-- Void if none

	parsed_libraries: DS_HASH_TABLE [ET_ECF_LIBRARY, STRING] is
			-- Already parsed ECF libraries, indexed by UUID
		deferred
		ensure
			parsed_libraries_not_void: Result /= Void
			no_void_library: not Result.has_item (Void)
		end

	library_parser: ET_ECF_LIBRARY_PARSER is
			-- Library parser
		deferred
		ensure
			library_parser_not_void: Result /= Void
		end

	ise_version: UT_VERSION
			-- ISE version to be used when evaluating version conditions

feature -- Setting

	set_enclosing_universe (a_universe: like enclosing_universe) is
			-- Set `enclosing_universe' to `a_universe'.
		do
			enclosing_universe := a_universe
		ensure
			enclosing_universe_set: enclosing_universe = a_universe
		end

	set_ise_version (a_version: like ise_version) is
			-- Set `ise_version' to `a_version'.
		require
			a_version_not_void: a_version /= Void
		do
			ise_version := a_version
		ensure
			ise_version_set: ise_version = a_version
		end

feature {NONE} -- AST factory

	new_adapted_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_ADAPTED_LIBRARY is
			-- New library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_string (an_element.name, xml_library)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_filename: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_condition: ET_ECF_CONDITIONS
			l_conditions: ET_ECF_CONDITIONS
		do
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			elseif not an_element.has_attribute_by_name (xml_location) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				l_filename := an_element.attribute_by_name (xml_location).value
				if l_name = Void then
-- TODO: ECF error
				elseif l_filename = Void then
-- TODO: ECF error
				else
					Result := ast_factory.new_adapted_library (l_name, l_filename)
					l_cursor := an_element.new_cursor
					from l_cursor.start until l_cursor.after loop
						l_child ?= l_cursor.item
						if l_child /= Void then
							if STRING_.same_string (l_child.name, xml_condition) then
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
		end

	new_build_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_BUILD_CONDITION is
			-- New build condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_build: STRING_.same_string (an_element.name, xml_build)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: STRING
		do
			if an_element.has_attribute_by_name (xml_value) then
				l_value := an_element.attribute_by_name (xml_value).value
				if l_value = Void then
-- TODO: ECF error
				elseif l_value.is_empty then
-- TODO: ECF error
				elseif an_element.has_attribute_by_name (xml_excluded_value) then
-- TODO: ECF error
				else
					Result := ast_factory.new_build_condition (l_value, False)
				end
			elseif an_element.has_attribute_by_name (xml_excluded_value) then
				l_value := an_element.attribute_by_name (xml_excluded_value).value
				if l_value = Void then
-- TODO: ECF error
				elseif l_value.is_empty then
-- TODO: ECF error
				else
					Result := ast_factory.new_build_condition (l_value, True)
				end
			else
-- TODO: ECF error
			end
		end

	new_cluster (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_CLUSTER is
			-- New cluster built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: STRING_.same_string (an_element.name, xml_cluster)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_pathname: STRING
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
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			elseif not an_element.has_attribute_by_name (xml_location) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				l_pathname := an_element.attribute_by_name (xml_location).value
				if l_name = Void then
-- TODO: ECF error
				elseif l_name.is_empty then
-- TODO: ECF error
				else
					Result := ast_factory.new_cluster (l_name, l_pathname, a_universe)
					if an_element.has_attribute_by_name (xml_recursive) then
						l_bool := an_element.attribute_by_name (xml_recursive).value
						if l_bool /= Void then
							if is_true (l_bool) then
								Result.set_recursive (True)
							elseif is_false (l_bool) then
								Result.set_recursive (False)
							else
-- TODO: ECF error
							end
						end
					end
					l_cursor := an_element.new_cursor
					from l_cursor.start until l_cursor.after loop
						l_child ?= l_cursor.item
						if l_child /= Void then
							if STRING_.same_string (l_child.name, xml_cluster) then
								l_cluster := new_cluster (l_child, a_position_table, a_universe)
								if l_cluster /= Void then
									if l_subclusters = Void then
										l_subclusters := ast_factory.new_clusters (l_cluster)
									else
										l_subclusters.put_last (l_cluster)
									end
								end
							elseif STRING_.same_string (l_child.name, xml_file_rule) then
								l_file_rule := new_file_rule (l_child, a_position_table, a_universe)
								if l_file_rule /= Void then
									if l_file_rules = Void then
										l_file_rules := ast_factory.new_file_rules (l_file_rule)
									else
										l_file_rules.put_last (l_file_rule)
									end
								end
							elseif STRING_.same_string (l_child.name, xml_condition) then
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
		end

	new_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_CONDITIONS is
			-- New condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_condition: STRING_.same_string (an_element.name, xml_condition)
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
					if STRING_.same_string (l_child.name, xml_platform) then
						l_condition := new_platform_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_build) then
						l_condition := new_build_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_multithreaded) then
						l_condition := new_multithreaded_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_dotnet) then
						l_condition := new_dotnet_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_dynamic_runtime) then
						l_condition := new_dynamic_runtime_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_custom) then
						l_condition := new_custom_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					elseif STRING_.same_string (l_child.name, xml_version) then
						l_condition := new_version_condition (l_child, a_position_table, a_universe)
						if l_condition /= Void then
							Result.put_last (l_condition)
						end
					else
-- TODO: ECF warning
					end
				end
				l_cursor.forth
			end
		end

	new_custom_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_CUSTOM_CONDITION is
			-- New custom condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_custom: STRING_.same_string (an_element.name, xml_custom)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_value: STRING
		do
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				if l_name = Void then
-- TODO: ECF error
				elseif l_name.is_empty then
-- TODO: ECF error
				elseif an_element.has_attribute_by_name (xml_value) then
					l_value := an_element.attribute_by_name (xml_value).value
					if l_value = Void then
-- TODO: ECF error
					elseif l_value.is_empty then
-- TODO: ECF error
					elseif an_element.has_attribute_by_name (xml_excluded_value) then
-- TODO: ECF error
					else
						Result := ast_factory.new_custom_condition (l_name, l_value, False)
					end
				elseif an_element.has_attribute_by_name (xml_excluded_value) then
					l_value := an_element.attribute_by_name (xml_excluded_value).value
					if l_value = Void then
-- TODO: ECF error
					elseif l_value.is_empty then
-- TODO: ECF error
					else
						Result := ast_factory.new_custom_condition (l_name, l_value, True)
					end
				else
-- TODO: ECF error
				end
			end
		end

	new_dotnet_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_DOTNET_CONDITION is
			-- New dotnet condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_dotnet: STRING_.same_string (an_element.name, xml_dotnet)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_bool: STRING
		do
			if not an_element.has_attribute_by_name (xml_value) then
-- TODO: ECF error
			else
				l_bool := an_element.attribute_by_name (xml_value).value
				if l_bool = Void then
-- TODO: ECF error
				else
					if is_true (l_bool) then
						Result := ast_factory.new_dotnet_condition (True)
					elseif is_false (l_bool) then
						Result := ast_factory.new_dotnet_condition (False)
					else
-- TODO: ECF error
					end
				end
			end
		end

	new_dynamic_runtime_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_DYNAMIC_RUNTIME_CONDITION is
			-- New dynamic_runtime condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_dynamic_runtime: STRING_.same_string (an_element.name, xml_dynamic_runtime)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_bool: STRING
		do
			if not an_element.has_attribute_by_name (xml_value) then
-- TODO: ECF error
			else
				l_bool := an_element.attribute_by_name (xml_value).value
				if l_bool = Void then
-- TODO: ECF error
				else
					if is_true (l_bool) then
						Result := ast_factory.new_dynamic_runtime_condition (True)
					elseif is_false (l_bool) then
						Result := ast_factory.new_dynamic_runtime_condition (False)
					else
-- TODO: ECF error
					end
				end
			end
		end

	new_file_rule (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_FILE_RULE is
			-- New file rule built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_file_rule: STRING_.same_string (an_element.name, xml_file_rule)
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
					if STRING_.same_string (l_child.name, xml_exclude) then
						l_text := l_child.text
						if l_text /= Void and then not l_text.is_empty then
							if l_excluded = Void then
								create l_excluded.make (10)
							end
							l_excluded.force_last (l_text)
						end
					elseif STRING_.same_string (l_child.name, xml_include) then
						l_text := l_child.text
						if l_text /= Void and then not l_text.is_empty then
							if l_included = Void then
								create l_included.make (10)
							end
							l_included.force_last (l_text)
						end
					elseif STRING_.same_string (l_child.name, xml_condition) then
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

	new_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING; a_system: ET_SYSTEM): ET_ECF_LIBRARY is
			-- New library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_filename_not_void: a_filename /= Void
			a_system_not_void: a_system /= Void
		local
			l_uuid: STRING
			l_name: STRING
			l_parsed_libraries: like parsed_libraries
		do
			if not an_element.has_attribute_by_name (xml_uuid) then
-- TODO: ECF error
			else
				l_uuid := an_element.attribute_by_name (xml_uuid).value
				if l_uuid = Void then
-- TODO: ECF error
				else
					l_parsed_libraries := parsed_libraries
					l_parsed_libraries.search (l_uuid)
					if l_parsed_libraries.found then
							-- Already parsed.
						Result := l_parsed_libraries.found_item
					elseif not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
					else
						l_name := an_element.attribute_by_name (xml_name).value
						if l_name = Void then
-- TODO: ECF error
						else
							Result := ast_factory.new_library (l_name, a_filename, a_system)
							fill_system_config (Result, an_element, a_position_table, Result)
							l_parsed_libraries.force_last_new (Result, l_uuid)
						end
					end
				end
			end
		end

	new_multithreaded_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_MULTITHREADED_CONDITION is
			-- New multithreaded condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_multithreaded: STRING_.same_string (an_element.name, xml_multithreaded)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_bool: STRING
		do
			if not an_element.has_attribute_by_name (xml_value) then
-- TODO: ECF error
			else
				l_bool := an_element.attribute_by_name (xml_value).value
				if l_bool = Void then
-- TODO: ECF error
				else
					if is_true (l_bool) then
						Result := ast_factory.new_multithreaded_condition (True)
					elseif is_false (l_bool) then
						Result := ast_factory.new_multithreaded_condition (False)
					else
-- TODO: ECF error
					end
				end
			end
		end

	new_platform_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_PLATFORM_CONDITION is
			-- New platform condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_platform: STRING_.same_string (an_element.name, xml_platform)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_value: STRING
		do
			if an_element.has_attribute_by_name (xml_value) then
				l_value := an_element.attribute_by_name (xml_value).value
				if l_value = Void then
-- TODO: ECF error
				elseif l_value.is_empty then
-- TODO: ECF error
				elseif an_element.has_attribute_by_name (xml_excluded_value) then
-- TODO: ECF error
				else
					Result := ast_factory.new_platform_condition (l_value, False)
				end
			elseif an_element.has_attribute_by_name (xml_excluded_value) then
				l_value := an_element.attribute_by_name (xml_excluded_value).value
				if l_value = Void then
-- TODO: ECF error
				elseif l_value.is_empty then
-- TODO: ECF error
				else
					Result := ast_factory.new_platform_condition (l_value, True)
				end
			else
-- TODO: ECF error
			end
		end

	new_root (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_ROOT is
			-- New root built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_root: STRING_.same_string (an_element.name, xml_root)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_root_class: ET_ECF_ROOT_CLASS
			l_class_name: STRING
		do
			if not an_element.has_attribute_by_name (xml_class) then
-- TODO: it should be a "all_classes".
			else
				l_class_name := an_element.attribute_by_name (xml_class).value
				if l_class_name = Void then
-- TODO: ECF error
				else
					l_root_class := ast_factory.new_root_class (l_class_name)
					Result := l_root_class
					if an_element.has_attribute_by_name (xml_feature) then
						l_root_class.set_creation_procedure_name (an_element.attribute_by_name (xml_feature).value)
					end
				end
			end
		end

	new_system (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_filename: STRING): ET_ECF_SYSTEM is
			-- New system built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_filename_not_void: a_filename /= Void
		local
			l_name: STRING
		do
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				if l_name = Void then
-- TODO: ECF error
				else
					Result := ast_factory.new_system (l_name, a_filename)
					fill_system_config (Result, an_element, a_position_table, Result)
				end
			end
		end

	new_target (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_TARGET is
			-- New target built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_target: STRING_.same_string (an_element.name, xml_target)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_cluster: ET_ECF_CLUSTER
			l_clusters: ET_ECF_CLUSTERS
			l_library: ET_ECF_ADAPTED_LIBRARY
			l_libraries: ET_ECF_ADAPTED_LIBRARIES
			l_file_rule: ET_ECF_FILE_RULE
			l_file_rules: ET_ECF_FILE_RULES
			l_root: ET_ECF_ROOT
		do
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				if l_name = Void then
-- TODO: ECF error
				else
					Result := ast_factory.new_target (l_name)
					l_cursor := an_element.new_cursor
					from l_cursor.start until l_cursor.after loop
						l_child ?= l_cursor.item
						if l_child /= Void then
							if STRING_.same_string (l_child.name, xml_cluster) then
								l_cluster := new_cluster (l_child, a_position_table, a_universe)
								if l_cluster /= Void then
									if l_clusters = Void then
										l_clusters := ast_factory.new_clusters (l_cluster)
									else
										l_clusters.put_last (l_cluster)
									end
								end
							elseif STRING_.same_string (l_child.name, xml_library) then
								l_library := new_adapted_library (l_child, a_position_table, a_universe)
								if l_library /= Void then
									if l_libraries = Void then
										l_libraries := ast_factory.new_adapted_libraries (l_library)
									else
										l_libraries.put_last (l_library)
									end
								end
							elseif STRING_.same_string (l_child.name, xml_file_rule) then
								l_file_rule := new_file_rule (l_child, a_position_table, a_universe)
								if l_file_rule /= Void then
									if l_file_rules = Void then
										l_file_rules := ast_factory.new_file_rules (l_file_rule)
									else
										l_file_rules.put_last (l_file_rule)
									end
								end
							elseif STRING_.same_string (l_child.name, xml_root) then
								if Result.root /= Void then
-- TODO: warning: several roots specified.
								end
								l_root := new_root (l_child, a_position_table, a_universe)
								if l_root /= Void then
									Result.set_root (l_root)
								end
							elseif STRING_.same_string (l_child.name, xml_variable) then
								add_variable (Result.variables, l_child, a_position_table, a_universe)
							end
						end
						l_cursor.forth
					end
					Result.set_clusters (l_clusters)
					Result.set_libraries (l_libraries)
					Result.set_file_rules (l_file_rules)
				end
			end
		end

	new_version_condition (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE): ET_ECF_VERSION_CONDITION is
			-- New version condition built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_version: STRING_.same_string (an_element.name, xml_version)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_type: STRING
			l_min: STRING
			l_max: STRING
			l_min_version: UT_VERSION
			l_max_version: UT_VERSION
			l_version_regexp: RX_PCRE_REGULAR_EXPRESSION
		do
			if an_element.has_attribute_by_name (xml_min) then
				l_min := an_element.attribute_by_name (xml_min).value
				if l_min /= Void then
					create l_version_regexp.make
					l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
					if l_version_regexp.recognizes (l_min) then
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
-- TODO: ECF error
						end
					end
				end
			end
			if an_element.has_attribute_by_name (xml_max) then
				l_max := an_element.attribute_by_name (xml_max).value
				if l_max /= Void then
					create l_version_regexp.make
					l_version_regexp.compile ("([0-9]+)(\.([0-9]+))?(\.([0-9]+))?(\.([0-9]+))?")
					if l_version_regexp.recognizes (l_max) then
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
-- TODO: ECF error
						end
					end
				end
			end
			if (l_min_version /= Void and l_max_version /= Void) and then l_max_version < l_min_version then
-- TODO: ECF error
			end
			if not an_element.has_attribute_by_name (xml_type) then
-- TODO: ECF error
			else
				l_type := an_element.attribute_by_name (xml_type).value
				if l_type = Void then
-- TODO: ECF error
				elseif STRING_.same_case_insensitive (l_type, xml_compiler) then
					create {ET_ECF_COMPILER_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
				elseif STRING_.same_case_insensitive (l_type, xml_msil_clr) then
					create {ET_ECF_COMPILER_VERSION_CONDITION} Result.make (l_min_version, l_max_version)
				else
-- TODO: ECF error
				end
			end
		end

feature {NONE} -- Element change

	fill_system_config (a_system_config: ET_ECF_SYSTEM_CONFIG; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE) is
			-- New system built from `an_element'
		require
			a_system_config_not_void: a_system_config /= Void
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, xml_system)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_uuid: STRING
			l_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_child: XM_ELEMENT
			l_target: ET_ECF_TARGET
			l_targets: ET_ECF_TARGETS
			l_target_name: STRING
		do
			if an_element.has_attribute_by_name (xml_uuid) then
				l_uuid := an_element.attribute_by_name (xml_uuid).value
				a_system_config.set_uuid (l_uuid)
			end
			l_cursor := an_element.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_child ?= l_cursor.item
				if l_child /= Void then
					if STRING_.same_string (l_child.name, xml_target) then
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
			a_system_config.set_targets (l_targets)
			if an_element.has_attribute_by_name (xml_library_target) then
				l_target_name := an_element.attribute_by_name (xml_library_target).value
				if l_target_name = Void then
-- TODO: ECF error
				elseif l_targets = Void then
-- TODO: ECF error
				else
					l_target := l_targets.target_by_name (l_target_name)
					if l_target = Void then
-- TODO: ECF error
					else
						a_system_config.set_library_target (l_target)
					end
				end
			end
		end

	add_variable (a_variables: ET_ECF_VARIABLES; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE; a_universe: ET_UNIVERSE) is
			-- Add to `a_variables' the variable held in `an_element'.
		require
			a_variables_not_void: a_variables /= Void
			an_element_not_void: an_element /= Void
			is_variable: STRING_.same_string (an_element.name, xml_variable)
			a_position_table_not_void: a_position_table /= Void
			a_universe_not_void: a_universe /= Void
		local
			l_name: STRING
			l_value: STRING
			l_other_value: STRING
		do
			if not an_element.has_attribute_by_name (xml_name) then
-- TODO: ECF error
			elseif not an_element.has_attribute_by_name (xml_value) then
-- TODO: ECF error
			else
				l_name := an_element.attribute_by_name (xml_name).value
				l_value := an_element.attribute_by_name (xml_value).value
				if l_name = Void then
-- TODO: ECF error
				elseif l_name.is_empty then
-- TODO: ECF error
				elseif l_value = Void then
-- TODO: ECF error
				elseif l_value.is_empty then
-- TODO: ECF error
				else
					l_other_value := a_variables.primary_value (l_name)
					if l_other_value /= Void then
-- TODO: ECF error
					else
						a_variables.set_primary_value (l_name, l_value)
					end
				end
			end
		end

	parse_libraries (a_universe: ET_ECF_INTERNAL_UNIVERSE; a_state: ET_ECF_STATE) is
			-- Parse libraries referenced in `a_universe' when in `a_state'.
		require
			a_universe_not_void: a_universe /= Void
			a_state_not_void: a_state /= Void
		local
			l_old_universe: like enclosing_universe
			l_libraries: ET_ADAPTED_LIBRARIES
			l_adapted_library: ET_ECF_ADAPTED_LIBRARY
			l_library: ET_ECF_LIBRARY
			i, nb: INTEGER
			l_file: KL_TEXT_INPUT_FILE
			l_library_parser: like library_parser
			l_target: ET_ECF_TARGET
			l_filename: STRING
		do
			l_old_universe := enclosing_universe
			enclosing_universe := a_universe
			l_libraries := a_universe.libraries
			if l_libraries /= Void then
				l_library_parser := library_parser
				nb := l_libraries.count
				from i := 1 until i > nb loop
					l_adapted_library ?= l_libraries.library (i)
					if l_adapted_library /= Void then
						l_filename := l_adapted_library.filename
						l_filename := Execution_environment.interpreted_string (l_filename)
						create l_file.make (l_filename)
						l_file.open_read
						if not l_file.is_open_read then
-- TODO: error
						else
							l_library_parser.set_enclosing_universe (a_universe)
							l_library_parser.parse_file (l_file)
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
-- TODO: error
									else
										l_library.select_target (l_target, a_state)
									end
								end
							end
						end
					end
					i := i + 1
				end
			end
			enclosing_universe := l_old_universe
		end

feature {NONE} -- Status report

	is_true (a_string: STRING): BOOLEAN is
			-- Is `a_string' equal to "true" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, True_constant)
		end

	is_false (a_string: STRING): BOOLEAN is
			-- Is `a_string' equal to "false" (case-insensitive)?
		require
			a_string_not_void: a_string /= Void
		do
			Result := STRING_.same_case_insensitive (a_string, False_constant)
		end

feature {NONE} -- Constant

	True_constant: STRING is "true"
			-- True constant

	False_constant: STRING is "false"
			-- False

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void
	ise_version_not_void: ise_version /= Void

end
