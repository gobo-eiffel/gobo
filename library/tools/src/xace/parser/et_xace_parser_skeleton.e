note

	description:

		"Xace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2021, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_PARSER_SKELETON

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

inherit

	ANY

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

	ET_XACE_OPTION_DEFAULTS
		export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler)
			-- Create a new Xace parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create ast_factory.make
			make_with_factory (ast_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler)
			-- Create a new Xace parser.
		require
			a_factory_not_void: a_factory /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			ast_factory := a_factory
			error_handler := an_error_handler
		ensure
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	ast_factory: ET_XACE_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

	library_parser: ET_XACE_LIBRARY_CONFIG_PARSER
			-- Library parser
		deferred
		ensure
			library_parser_not_void: Result /= Void
		end

	parsed_libraries: DS_HASH_TABLE [ET_XACE_LIBRARY_CONFIG, STRING]
			-- Already parsed Xace libraries, indexed by filenames
		deferred
		ensure
			parsed_libraries_not_void: Result /= Void
			no_void_library: not Result.has_void_item
		end

feature -- Status report

	is_shallow: BOOLEAN
			-- Should parsing of Xace files not follow mounted libraries?

feature -- Status setting

	set_shallow (b: BOOLEAN)
			-- Set `is_shallow' to `b'.
		do
			is_shallow := b
			if library_parser.is_shallow /= b then
				library_parser.set_shallow (b)
			end
		ensure
			shallow_set: is_shallow = b
		end

feature {NONE} -- AST factory

	new_system (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): ET_XACE_SYSTEM_CONFIG
			-- New Xace system built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, uc_system)
		local
			l_target: ET_XACE_TARGET
		do
			l_target := new_named_target (an_element, a_position_table)
			Result := ast_factory.new_system (l_target)
			fill_system (Result, an_element, a_position_table, tokens.unknown_system)
			Result.select_target (l_target, error_handler)
			Result.mount_libraries
		ensure
			new_system_not_void: Result /= Void
		end

	new_library (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): ET_XACE_LIBRARY_CONFIG
			-- New library built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_string (an_element.name, uc_library) or
				STRING_.same_string (an_element.name, uc_cluster)
		local
			l_target: ET_XACE_TARGET
		do
			l_target := new_named_target (an_element, a_position_table)
			Result := ast_factory.new_library (l_target)
			fill_library (Result, an_element, a_position_table, tokens.unknown_system)
			Result.select_target (l_target, error_handler)
			Result.mount_libraries
		ensure
			new_library_not_void: Result /= Void
		end

	new_named_target (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): ET_XACE_TARGET
			-- New (empty) target with name found in `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_target: STRING_.same_string (a_element.name, uc_target) or
				STRING_.same_string (a_element.name, uc_system) or
				STRING_.same_string (a_element.name, uc_library) or
				STRING_.same_string (a_element.name, uc_cluster)
		local
			l_name: detachable STRING
		do
			if attached a_element.attribute_by_name (uc_name) as l_name_attribute then
				l_name := l_name_attribute.value
			end
			if l_name = Void or else l_name.is_empty then
				l_name := new_name
			end
			Result := ast_factory.new_target (l_name)
			Result.options.set_secondary_options (default_options)
		ensure
			new_named_target_not_void: Result /= Void
		end

	new_target (a_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_eiffel_system: ET_SYSTEM): ET_XACE_TARGET
			-- New target build from `a_element'.
		require
			a_element_not_void: a_element /= Void
			is_target: STRING_.same_string (a_element.name, uc_target) or
				STRING_.same_string (a_element.name, uc_system) or
				STRING_.same_string (a_element.name, uc_library) or
				STRING_.same_string (a_element.name, uc_cluster)
			a_eiffel_system_not_void: a_eiffel_system /= Void
		do
			Result := new_named_target (a_element, a_position_table)
			fill_target (Result, a_element, a_position_table, a_eiffel_system)
		ensure
			new_target_not_void: Result /= Void
		end

	new_cluster (an_element: XM_ELEMENT; a_parent_prefix: STRING; a_position_table: detachable XM_POSITION_TABLE; a_universe: ET_UNIVERSE): detachable ET_XACE_CLUSTER
			-- New cluster built from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: STRING_.same_string (an_element.name, uc_cluster)
			a_parent_prefix_not_void: a_parent_prefix /= Void
			a_universe_not_void: a_universe /= Void
		local
			a_name: STRING
			a_pathname: detachable STRING
			a_bool: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_cluster: detachable ET_XACE_CLUSTER
			an_option: detachable ET_XACE_OPTIONS
			a_class: detachable ET_XACE_CLASS_OPTIONS
			subclusters: detachable ET_XACE_CLUSTERS
			a_mount: detachable ET_XACE_MOUNTED_LIBRARY
			a_mounts: detachable ET_XACE_MOUNTED_LIBRARIES
			a_prefix: STRING
			l_other_library: detachable ET_XACE_MOUNTED_LIBRARY
		do
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				a_name := l_name_attribute.value
				if a_name.count > 0 then
					if attached an_element.attribute_by_name (uc_location) as l_location_attribute then
						a_pathname := l_location_attribute.value
					end
					Result := ast_factory.new_cluster (a_name, a_pathname, a_universe)
					if attached an_element.attribute_by_name (uc_abstract) as l_abstract_attribute then
						error_handler.report_attribute_obsoleted_by_element_warning (an_element, uc_abstract, "<option name=%"abstract%" value=%"true/false%"/>", an_element.position (a_position_table))
						a_bool := l_abstract_attribute.value
						if is_true (a_bool) then
							if an_option = Void then
								an_option := ast_factory.new_options
							end
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.abstract_option_name, a_bool)
						elseif is_false (a_bool) then
							if an_option = Void then
								an_option := ast_factory.new_options
							end
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.abstract_option_name, a_bool)
						end
					end
					if attached an_element.attribute_by_name (uc_relative) as l_relative_attribute then
						a_bool := l_relative_attribute.value
						if is_true (a_bool) then
							Result.set_relative (True)
						elseif is_false (a_bool) then
							Result.set_relative (False)
						end
					end
					if attached an_element.attribute_by_name (uc_prefix) as l_prefix_attribute then
						a_prefix := l_prefix_attribute.value
					else
						a_prefix := a_parent_prefix
					end
					Result.set_cluster_prefix (a_prefix)
					a_cursor := an_element.new_cursor
					from a_cursor.start until a_cursor.after loop
						if attached {XM_ELEMENT} a_cursor.item as a_child then
							if STRING_.same_string (a_child.name, uc_cluster) then
								a_cluster := new_cluster (a_child, a_prefix, a_position_table, a_universe)
								if a_cluster /= Void then
									if subclusters = Void then
										subclusters := ast_factory.new_clusters (a_cluster)
									else
										subclusters.put_last (a_cluster)
									end
								end
							elseif STRING_.same_string (a_child.name, uc_mount) then
								a_mount := new_mount (a_child, a_position_table, a_universe.current_system)
								if a_mount /= Void then
									if a_mounts = Void then
										a_mounts := ast_factory.new_mounted_libraries
									end
									l_other_library := a_mounts.item (a_mount.pathname)
									if l_other_library /= Void then
										if not a_mount.same_library_prefix (l_other_library) then
											error_handler.report_multiple_library_prefix_error (a_mount, l_other_library)
										end
									else
										a_mounts.put_last (a_mount)
									end
								end
							elseif STRING_.same_string (a_child.name, uc_option) then
								if an_option /= Void then
									fill_options (an_option, valid_cluster_options, a_child, a_position_table)
								else
									an_option := new_options (a_child, valid_cluster_options, a_position_table)
								end
							elseif STRING_.same_string (a_child.name, uc_class) then
								a_class := new_class (a_child, a_position_table)
								if a_class /= Void then
									Result.put_class_option (a_class)
								end
							elseif STRING_.same_string (a_child.name, uc_external) then
								if an_option = Void then
									an_option := ast_factory.new_options
								end
								fill_externals (an_option, Result, a_child, a_position_table)
							end
						end
						a_cursor.forth
					end
					if an_option /= Void then
						Result.set_abstract (attached an_option.value ({ET_XACE_OPTION_NAMES}.abstract_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
						Result.set_recursive (attached an_option.value ({ET_XACE_OPTION_NAMES}.recursive_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
						Result.set_read_only (attached an_option.value ({ET_XACE_OPTION_NAMES}.read_only_option_name) as l_value and then STRING_.same_case_insensitive (l_value, {ET_XACE_OPTION_NAMES}.true_option_value))
					end
					Result.set_options (an_option)
					Result.set_subclusters (subclusters)
					Result.set_libraries (a_mounts)
				end
			end
		end

	new_class (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): detachable ET_XACE_CLASS_OPTIONS
			-- New class options build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_class: STRING_.same_string (an_element.name, uc_class)
		local
			a_class_name: STRING
			an_option: ET_XACE_OPTIONS
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_feature: detachable ET_XACE_FEATURE_OPTIONS
		do
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				a_class_name := l_name_attribute.value
				if a_class_name.count > 0 then
					an_option := ast_factory.new_options
					Result := ast_factory.new_class_options (a_class_name, an_option)
					a_cursor := an_element.new_cursor
					from a_cursor.start until a_cursor.after loop
						if attached {XM_ELEMENT} a_cursor.item as a_child then
							if STRING_.same_string (a_child.name, uc_option) then
								fill_options (an_option, valid_class_options, a_child, a_position_table)
							elseif STRING_.same_string (a_child.name, uc_feature) then
								a_feature := new_feature (a_child, a_position_table)
								if a_feature /= Void then
									Result.put_feature_option (a_feature)
								end
							end
						end
						a_cursor.forth
					end
				end
			end
		end

	new_feature (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): detachable ET_XACE_FEATURE_OPTIONS
			-- New feature options build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_feature: STRING_.same_string (an_element.name, uc_feature)
		local
			a_feature_name: STRING
			an_option: ET_XACE_OPTIONS
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				a_feature_name := l_name_attribute.value
				if a_feature_name.count > 0 then
					an_option := ast_factory.new_options
					Result := ast_factory.new_feature_options (a_feature_name, an_option)
					a_cursor := an_element.new_cursor
					from a_cursor.start until a_cursor.after loop
						if attached {XM_ELEMENT} a_cursor.item as a_child then
							if STRING_.same_string (a_child.name, uc_option) then
								fill_options (an_option, valid_feature_options, a_child, a_position_table)
							end
						end
						a_cursor.forth
					end
				end
			end
		end

	new_mount (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_eiffel_system: ET_SYSTEM): detachable ET_XACE_MOUNTED_LIBRARY
			-- New mounted library build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_mount: STRING_.same_string (an_element.name, uc_mount)
			a_eiffel_system_not_void: a_eiffel_system /= Void
		local
			a_pathname: STRING
			a_library: ET_XACE_LIBRARY_CONFIG
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			a_prefix: STRING
			l_target: ET_XACE_TARGET
		do
			if attached an_element.attribute_by_name (uc_location) as l_location_attribute then
				a_pathname := l_location_attribute.value
				parsed_libraries.search (a_pathname)
				if parsed_libraries.found then
					a_library := parsed_libraries.found_item
				else
					l_target := ast_factory.new_target (new_name)
					a_library := ast_factory.new_library (l_target)
					parsed_libraries.force_new (a_library, a_pathname)
					if not is_shallow then
						a_filename := Execution_environment.interpreted_string (a_pathname)
						create a_file.make (a_filename)
						a_file.open_read
						if a_file.is_open_read then
							library_parser.parse_library (a_library, a_file, a_eiffel_system)
							a_library.select_target (l_target, error_handler)
							a_file.close
						else
							error_handler.report_cannot_read_file_error (a_pathname)
						end
					end
				end
				Result := ast_factory.new_mounted_library (a_pathname, a_library, an_element.position (a_position_table))
				if attached an_element.attribute_by_name (uc_prefix) as l_prefix_attribute then
					a_prefix := l_prefix_attribute.value
					Result.set_library_prefix (a_prefix)
				end
			end
		end

	new_options (an_element: XM_ELEMENT; a_valid_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]; a_position_table: detachable XM_POSITION_TABLE): ET_XACE_OPTIONS
			-- New option clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			a_valid_options_not_void: a_valid_options /= Void
			is_option: STRING_.same_string (an_element.name, uc_option)
		do
			Result := ast_factory.new_options
			fill_options (Result, a_valid_options, an_element, a_position_table)
		ensure
			options_not_void: Result /= Void
		end

	new_export (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): detachable ET_XACE_CLASS_OPTIONS
			-- New export clause build from `an_element'
			-- Old syntax.
		require
			an_element_not_void: an_element /= Void
			is_export: STRING_.same_string (an_element.name, uc_export)
		local
			a_name: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_feature: detachable ET_XACE_FEATURE_OPTIONS
			an_option: ET_XACE_OPTIONS
		do
			if attached an_element.attribute_by_name (uc_class) as l_class_attribute then
				a_name := l_class_attribute.value
				if a_name.count > 0 then
					an_option := ast_factory.new_options
					Result := ast_factory.new_class_options (a_name, an_option)
					a_cursor := an_element.new_cursor
					from a_cursor.start until a_cursor.after loop
						if attached {XM_ELEMENT} a_cursor.item as a_child and then STRING_.same_string (a_child.name, uc_feature) then
							a_feature := new_exported_feature (a_child, a_position_table)
							if a_feature /= Void then
								Result.put_feature_option (a_feature)
							end
						end
						a_cursor.forth
					end
					if not attached Result.feature_options as l_feature_options or else l_feature_options.is_empty then
						an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.export_option_name, a_name)
					end
				end
			end
		end

	new_exported_feature (an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE): detachable ET_XACE_FEATURE_OPTIONS
			-- New exported feature build from `an_element'
			-- Old syntax.
		require
			an_element_not_void: an_element /= Void
			is_feature: STRING_.same_string (an_element.name, uc_feature)
		local
			a_name: STRING
			an_alias: STRING
			an_option: ET_XACE_OPTIONS
		do
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				a_name := l_name_attribute.value
				if attached an_element.attribute_by_name (uc_alias) as l_alias_attribute then
					an_alias := l_alias_attribute.value
				else
					an_alias := a_name
				end
				if a_name.count > 0 and an_alias.count > 0 then
					an_option := ast_factory.new_options
					an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.export_option_name, an_alias)
					Result := ast_factory.new_feature_options (a_name, an_option)
				end
			end
		end

feature {NONE} -- Element change

	fill_system (a_system: ET_XACE_SYSTEM_CONFIG; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_eiffel_system: ET_SYSTEM)
			-- Fill Xace system `a_system' with data found in `an_element'.
		require
			a_system_not_void: a_system /= Void
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, uc_system)
			a_eiffel_system_not_void: a_eiffel_system /= Void
		do
			fill_target (a_system.targets.last, an_element, a_position_table, a_eiffel_system)
		end

	fill_library (a_library: ET_XACE_LIBRARY_CONFIG; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_eiffel_system: ET_SYSTEM)
			-- Fill Xace library `a_library' with data found in `an_element'.
		require
			a_library_not_void: a_library /= Void
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_string (an_element.name, uc_library) or
				STRING_.same_string (an_element.name, uc_cluster)
			a_eiffel_system_not_void: a_eiffel_system /= Void
		local
			a_prefix: STRING
		do
			fill_target (a_library.targets.last, an_element, a_position_table, a_eiffel_system)
			if attached an_element.attribute_by_name (uc_prefix) as l_prefix_attribute then
				a_prefix := l_prefix_attribute.value
				a_library.set_library_prefix (a_prefix)
			end
		end

	fill_target (a_target: ET_XACE_TARGET; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE; a_eiffel_system: ET_SYSTEM)
			-- Fill Xace target `a_target' with data found in `an_element'.
		require
			a_target_not_void: a_target /= Void
			an_element_not_void: an_element /= Void
			is_target: STRING_.same_string (an_element.name, uc_target) or
				STRING_.same_string (an_element.name, uc_system) or
				STRING_.same_string (an_element.name, uc_library) or
				STRING_.same_string (an_element.name, uc_cluster)
			a_eiffel_system_not_void: a_eiffel_system /= Void
		local
			l_name: STRING
			a_class: detachable STRING
			a_creation: detachable STRING
			a_cursor, old_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			l_options: ET_XACE_OPTIONS
			l_clusters: ET_XACE_CLUSTERS
			l_mounts: ET_XACE_MOUNTED_LIBRARIES
			l_other_library: detachable ET_XACE_MOUNTED_LIBRARY
			l_override_cluster: detachable ET_CLUSTER
			a_pathname: detachable STRING
		do
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				l_name := l_name_attribute.value
				if not l_name.is_empty then
					a_target.set_name (l_name)
				end
			end
			l_options := a_target.options
			l_clusters := a_target.clusters
			l_mounts := a_target.libraries
			if STRING_.same_string (an_element.name, uc_cluster) then
					-- Old syntax.
				error_handler.report_element_obsoleted_by_element_warning (an_element, "<library>", an_element.position (a_position_table))
				if attached new_cluster (an_element, empty_prefix, a_position_table, a_eiffel_system) as l_cluster then
					a_target.set_name (l_cluster.name)
					a_pathname := l_cluster.pathname
					if a_pathname = Void and l_cluster.is_abstract then
						if attached l_cluster.options as l_cluster_options then
							a_target.set_options (l_cluster_options)
							l_options := l_cluster_options
						end
						if attached l_cluster.subclusters as l_cluster_subclusters then
							a_target.set_clusters (l_cluster_subclusters)
							l_clusters := l_cluster_subclusters
						end
						if attached l_cluster.libraries as l_cluster_libraries then
							a_target.set_libraries (l_cluster_libraries)
							l_mounts := l_cluster_libraries
						end
					else
						l_clusters.put_last (l_cluster)
					end
				end
			else
				if attached an_element.element_by_name (uc_root) as l_root_element then
					if attached l_root_element.attribute_by_name (uc_class) as l_class_attribute then
						a_class := l_class_attribute.value
					end
					if attached l_root_element.attribute_by_name (uc_creation) as l_creation_attribute then
						a_creation := l_creation_attribute.value
					end
				end
				a_target.set_root_class_name (a_class)
				a_target.set_creation_procedure_name (a_creation)
				a_cursor := an_element.new_cursor
				from a_cursor.start until a_cursor.after loop
					if attached {XM_ELEMENT} a_cursor.item as a_child then
						if STRING_.same_string (a_child.name, uc_cluster) then
							if a_child.has_attribute_by_name (uc_name) then
								if attached new_cluster (a_child, empty_prefix, a_position_table, a_eiffel_system) as l_cluster then
									l_clusters.put_last (l_cluster)
								end
							else
									-- Old syntax.
								old_cursor := a_child.new_cursor
								from old_cursor.start until old_cursor.after loop
									if attached {XM_ELEMENT} old_cursor.item as a_old_child then
										if STRING_.same_string (a_old_child.name, uc_cluster) then
											if attached new_cluster (a_old_child, empty_prefix, a_position_table, a_eiffel_system) as l_cluster then
												l_clusters.put_last (l_cluster)
											end
										elseif STRING_.same_string (a_old_child.name, uc_mount) then
											if attached new_mount (a_old_child, a_position_table, a_eiffel_system) as l_mount then
												l_other_library := l_mounts.item (l_mount.pathname)
												if l_other_library /= Void then
													if not l_mount.same_library_prefix (l_other_library) then
														error_handler.report_multiple_library_prefix_error (l_mount, l_other_library)
													end
												else
													l_mounts.put_last (l_mount)
												end
											end
										elseif STRING_.same_string (a_old_child.name, uc_option) then
											fill_options (l_options, valid_system_options, a_old_child, a_position_table)
										elseif STRING_.same_string (a_old_child.name, uc_external) then
											fill_externals (l_options, Void, a_old_child, a_position_table)
										end
									end
									old_cursor.forth
								end
							end
						elseif STRING_.same_string (a_child.name, uc_mount) then
							if attached new_mount (a_child, a_position_table, a_eiffel_system) as l_mount then
								l_other_library := l_mounts.item (l_mount.pathname)
								if l_other_library /= Void then
									if not l_mount.same_library_prefix (l_other_library) then
										error_handler.report_multiple_library_prefix_error (l_mount, l_other_library)
									end
								else
									l_mounts.put_last (l_mount)
								end
							end
						elseif STRING_.same_string (a_child.name, uc_option) then
							fill_options (l_options, valid_system_options, a_child, a_position_table)
						elseif STRING_.same_string (a_child.name, uc_external) then
								-- Old syntax.
							fill_externals (l_options, Void, a_child, a_position_table)
						end
					end
					a_cursor.forth
				end
			end
				-- Set override clusters.
			if attached l_options.multivalue ({ET_XACE_OPTION_NAMES}.override_cluster_option_name) as l_multivalue then
				across l_multivalue as i_override_cluster_name loop
					l_override_cluster := l_clusters.cluster_by_name (i_override_cluster_name)
					if l_override_cluster /= Void then
						l_override_cluster.set_override (True)
					end
				end
			end
			l_clusters.merge_libraries (l_mounts, error_handler)
		end

	fill_options (an_option: ET_XACE_OPTIONS; a_valid_options: DS_HASH_TABLE [detachable RX_REGULAR_EXPRESSION, STRING]; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Fill Xace option `an_option' with data found in `an_element'.
		require
			an_option_not_void: an_option /= Void
			a_valid_options_not_void: a_valid_options /= Void
			an_element_not_void: an_element /= Void
			is_option: STRING_.same_string (an_element.name, uc_option)
		local
			is_enclosing_option: BOOLEAN
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_name: STRING
			a_value: STRING
			a_bool: STRING
			a_key: STRING
		do
			is_enclosing_option := True
			if attached an_element.attribute_by_name (uc_name) as l_name_attribute then
				is_enclosing_option := False
				a_name := l_name_attribute.value
				if not attached an_element.attribute_by_name (uc_value) as l_value_attribute then
					-- Error already reported by the validator.
				else
					a_value := l_value_attribute.value
					an_option.set_primary_value (a_name, a_value)
					if not a_valid_options.has (a_name) then
-- TODO: unknown option.
					elseif attached a_valid_options.item (a_name) as l_regexp then
						if not l_regexp.recognizes (a_value) then
-- TODO: invalid value.							
						end
					end
				end
			end
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as a_child then
					if not is_enclosing_option then
						-- Error already reported by the validator.
					elseif STRING_.same_string (a_child.name, uc_option) then
						fill_options (an_option, a_valid_options, a_child, a_position_table)
					elseif STRING_.same_string (a_child.name, uc_require) then
							-- Old syntax.
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"require%"/>", a_child.position (a_position_table))
						if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
							a_bool := l_enable_attribute.value
							if is_true (a_bool) then
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.require_option_value)
							end
						else
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.require_option_value)
						end
					elseif STRING_.same_string (a_child.name, uc_ensure) then
							-- Old syntax.
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"ensure%"/>", a_child.position (a_position_table))
						if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
							a_bool := l_enable_attribute.value
							if is_true (a_bool) then
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.ensure_option_value)
							end
						else
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.ensure_option_value)
						end
					elseif STRING_.same_string (a_child.name, uc_invariant) then
							-- Old syntax.
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"invariant%"/>", a_child.position (a_position_table))
						if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
							a_bool := l_enable_attribute.value
							if is_true (a_bool) then
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.invariant_option_value)
							end
						else
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.invariant_option_value)
						end
					elseif STRING_.same_string (a_child.name, uc_loop) then
							-- Old syntax.
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"loop_[in]variant%"/>", a_child.position (a_position_table))
						if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
							a_bool := l_enable_attribute.value
							if is_true (a_bool) then
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.loop_invariant_option_value)
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.loop_variant_option_value)
							end
						else
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.loop_invariant_option_value)
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.loop_variant_option_value)
						end
					elseif STRING_.same_string (a_child.name, uc_check) then
							-- Old syntax.
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"check%"/>", a_child.position (a_position_table))
						if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
							a_bool := l_enable_attribute.value
							if is_true (a_bool) then
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.check_option_value)
							end
						else
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.assertion_option_name, {ET_XACE_OPTION_NAMES}.check_option_value)
						end
					elseif STRING_.same_string (a_child.name, uc_debug) then
							-- Old syntax.
						if attached a_child.attribute_by_name (uc_name) as l_name_attribute then
							a_key := l_name_attribute.value
							error_handler.report_element_obsoleted_by_element_warning (a_child, STRING_.concat ("<option name=%"debug_tag%" value=%"", a_key) + "%"/>", a_child.position (a_position_table))
							if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
								a_bool := l_enable_attribute.value
								if is_true (a_bool) then
									an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_tag_option_name, a_key)
								end
							else
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_tag_option_name, a_key)
							end
						else
							if attached a_child.attribute_by_name (uc_enable) as l_enable_attribute then
								a_bool := l_enable_attribute.value
								if is_true (a_bool) then
									error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true%"/>", a_child.position (a_position_table))
									an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_option_name, a_bool)
								elseif is_false (a_bool) then
									error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"false%"/>", a_child.position (a_position_table))
									an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_option_name, a_bool)
								else
									error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true/false%"/>", a_child.position (a_position_table))
								end
							else
								error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true%"/>", a_child.position (a_position_table))
								an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.debug_option_name, {ET_XACE_OPTION_NAMES}.true_option_value)
							end
						end
					end
				end
				a_cursor.forth
			end
		end

	fill_externals (an_option: ET_XACE_OPTIONS; a_cluster: detachable ET_XACE_CLUSTER; an_element: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Fill Xace externals with data found in `an_element'.
			-- Old syntax.
		require
			an_option_not_void: an_option /= Void
			an_element_not_void: an_element /= Void
			is_external: STRING_.same_string (an_element.name, uc_external)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			an_export: detachable ET_XACE_CLASS_OPTIONS
			a_value: STRING
		do
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as a_child then
					if STRING_.same_string (a_child.name, uc_link_library) then
						if attached a_child.attribute_by_name (uc_location) as l_name_attribute then
							a_value := l_name_attribute.value
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.link_option_name, a_value)
						end
					elseif STRING_.same_string (a_child.name, uc_include_dir) then
						if attached a_child.attribute_by_name (uc_location) as l_location_attribute then
							a_value := l_location_attribute.value
							an_option.set_primary_value ({ET_XACE_OPTION_NAMES}.header_option_name, a_value)
						end
					elseif STRING_.same_string (a_child.name, uc_export) then
						if a_cluster /= Void then
							an_export := new_export (a_child, a_position_table)
							if an_export /= Void then
								a_cluster.put_class_option (an_export)
							end
						end
					end
				end
				a_cursor.forth
			end
		end

feature {NONE} -- Implementation

	new_name: STRING
			-- Unique name when not explicitly specified
		do
			new_name_count := new_name_count + 1
			Result := "name_" + new_name_count.out
		ensure
			new_name_not_void: Result /= Void
			new_name_not_empty: not Result.is_empty
		end

	new_name_count: INTEGER
			-- Counter for `new_name'

feature {NONE} -- Status report

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

feature {NONE} -- Constant

	True_constant: STRING = "true"
	False_constant: STRING = "false"
			-- Boolean string representation

	empty_prefix: STRING = ""
			-- Empty prefix

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void

end
