indexing

	description:

		"Xace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_PARSER_SKELETON

inherit

	ANY

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

	ET_XACE_OPTION_NAMES
		export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Xace parser.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			create ast_factory.make
			make_with_factory (ast_factory, an_error_handler)
		ensure
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_factory: like ast_factory; an_error_handler: like error_handler) is
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

	library_parser: ET_XACE_LIBRARY_PARSER is
			-- Library parser
		deferred
		ensure
			library_parser_not_void: Result /= Void
		end

	parsed_libraries: DS_HASH_TABLE [ET_XACE_LIBRARY, STRING] is
			-- Already parsed Xace libraries, indexed by filenames
		deferred
		ensure
			parsed_libraries_not_void: Result /= Void
			no_void_library: not Result.has_item (Void)
		end

feature -- Status report

	is_shallow: BOOLEAN
			-- Should parsing of Xace files not follow mounted libraries?

	is_ve: BOOLEAN
			-- Should parsing of Xace files not follow mounted libraries
			-- whose pathnames contains ${VE_Lib}?

feature -- Status setting

	set_shallow (b: BOOLEAN) is
			-- Set `is_shallow' to `b'.
		do
			is_shallow := b
			if library_parser.is_shallow /= b then
				library_parser.set_shallow (b)
			end
		ensure
			shallow_set: is_shallow = b
		end

	set_ve (b: BOOLEAN) is
			-- Set `is_ve' to `b'.
		do
			is_ve := b
			if library_parser.is_ve /= b then
				library_parser.set_ve (b)
			end
		ensure
			ve_set: is_ve = b
		end

feature {NONE} -- AST factory

	new_system (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_SYSTEM is
			-- New Xace system build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, uc_system)
			a_position_table_not_void: a_position_table /= Void
		do
			Result := ast_factory.new_system (Void)
			fill_system (Result, an_element, a_position_table)
			Result.mount_libraries
		ensure
			new_system_not_void: Result /= Void
		end

	new_library (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_LIBRARY is
			-- New library build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_string (an_element.name, uc_library) or
				STRING_.same_string (an_element.name, uc_cluster)
			a_position_table_not_void: a_position_table /= Void
		do
			Result := ast_factory.new_library
			fill_library (Result, an_element, a_position_table)
			Result.mount_libraries
		ensure
			new_library_not_void: Result /= Void
		end

	new_cluster (an_element: XM_ELEMENT; a_parent_prefix: STRING; a_position_table: XM_POSITION_TABLE): ET_XACE_CLUSTER is
			-- New cluster build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: STRING_.same_string (an_element.name, uc_cluster)
			a_parent_prefix_not_void: a_parent_prefix /= Void
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			a_pathname: STRING
			a_bool: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_cluster: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			a_class: ET_XACE_CLASS_OPTIONS
			subclusters: ET_XACE_CLUSTERS
			a_mount: ET_XACE_MOUNTED_LIBRARY
			a_mounts: ET_XACE_MOUNTED_LIBRARIES
			a_prefix: STRING
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_name := an_element.attribute_by_name (uc_name).value
				if a_name /= Void then
					if a_name.count > 0 then
						if an_element.has_attribute_by_name (uc_location) then
							a_pathname := an_element.attribute_by_name (uc_location).value
						end
						Result := ast_factory.new_cluster (a_name, a_pathname)
						if an_element.has_attribute_by_name (uc_abstract) then
							error_handler.report_attribute_obsoleted_by_element_warning (an_element, uc_abstract, "<option name=%"abstract%" value=%"true/false%"/>", a_position_table.item (an_element))
							a_bool := an_element.attribute_by_name (uc_abstract).value
							if a_bool /= Void then
								if is_true (a_bool) then
									if an_option = Void then
										an_option := ast_factory.new_options
									end
									an_option.set_abstract (True)
								elseif is_false (a_bool) then
									if an_option = Void then
										an_option := ast_factory.new_options
									end
									an_option.set_abstract (False)
								end
							end
						end
						if an_element.has_attribute_by_name (uc_relative) then
							a_bool := an_element.attribute_by_name (uc_relative).value
							if a_bool /= Void then
								if is_true (a_bool) then
									Result.set_relative (True)
								elseif is_false (a_bool) then
									Result.set_relative (False)
								end
							end
						end
						a_prefix := a_parent_prefix
						if an_element.has_attribute_by_name (uc_prefix) then
							a_prefix := an_element.attribute_by_name (uc_prefix).value
						end
						Result.set_cluster_prefix (a_prefix)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void then
								if STRING_.same_string (a_child.name, uc_cluster) then
									a_cluster := new_cluster (a_child, a_prefix, a_position_table)
									if a_cluster /= Void then
										if subclusters = Void then
											subclusters := ast_factory.new_clusters (a_cluster)
										else
											subclusters.put_last (a_cluster)
										end
									end
								elseif STRING_.same_string (a_child.name, uc_mount) then
									a_mount := new_mount (a_child, a_position_table)
									if a_mount /= Void then
										if a_mounts = Void then
											a_mounts := ast_factory.new_mounted_libraries
										end
										a_mounts.put_last (a_mount)
									end
								elseif STRING_.same_string (a_child.name, uc_option) then
									if an_option /= Void then
										fill_options (an_option, a_child, a_position_table)
									else
										an_option := new_options (a_child, a_position_table)
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
							if an_option.is_abstract_declared then
								Result.set_abstract (an_option.abstract)
							end
							if an_option.is_recursive_declared then
								Result.set_recursive (an_option.recursive)
							end
							if an_option.is_read_only_declared then
								Result.set_read_only (an_option.read_only)
							end
						end
						Result.set_options (an_option)
						Result.set_subclusters (subclusters)
						Result.set_libraries (a_mounts)
					end
				end
			end
		end

	new_class (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_CLASS_OPTIONS is
			-- New class options build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_class: STRING_.same_string (an_element.name, uc_class)
			a_position_table_not_void: a_position_table /= Void
		local
			a_class_name: STRING
			an_option: ET_XACE_OPTIONS
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_feature: ET_XACE_FEATURE_OPTIONS
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_class_name := an_element.attribute_by_name (uc_name).value
				if a_class_name /= Void then
					if a_class_name.count > 0 then
						an_option := ast_factory.new_options
						Result := ast_factory.new_class_options (a_class_name, an_option)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void then
								if STRING_.same_string (a_child.name, uc_option) then
									fill_options (an_option, a_child, a_position_table)
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
		end

	new_feature (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_FEATURE_OPTIONS is
			-- New feature options build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_feature: STRING_.same_string (an_element.name, uc_feature)
			a_position_table_not_void: a_position_table /= Void
		local
			a_feature_name: STRING
			an_option: ET_XACE_OPTIONS
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_feature_name := an_element.attribute_by_name (uc_name).value
				if a_feature_name /= Void then
					if a_feature_name.count > 0 then
						an_option := ast_factory.new_options
						Result := ast_factory.new_feature_options (a_feature_name, an_option)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void then
								if STRING_.same_string (a_child.name, uc_option) then
									fill_options (an_option, a_child, a_position_table)
								end
							end
							a_cursor.forth
						end
					end
				end
			end
		end

	new_mount (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_MOUNTED_LIBRARY is
			-- New mounted library build from `an_element'.
		require
			an_element_not_void: an_element /= Void
			is_mount: STRING_.same_string (an_element.name, uc_mount)
			a_position_table_not_void: a_position_table /= Void
		local
			a_pathname: STRING
			a_library: ET_XACE_LIBRARY
			a_prefix: STRING
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
		do
			if an_element.has_attribute_by_name (uc_location) then
				a_pathname := an_element.attribute_by_name (uc_location).value
				if a_pathname /= Void then
					if an_element.has_attribute_by_name (uc_prefix) then
						a_prefix := an_element.attribute_by_name (uc_prefix).value
					end
					parsed_libraries.search (a_pathname)
					if parsed_libraries.found then
						a_library := parsed_libraries.found_item
					else
						a_library := ast_factory.new_library
						parsed_libraries.force_new (a_library, a_pathname)
						if not is_shallow and then (not is_ve or else not a_pathname.has_substring ("${VE_Lib}")) then
							a_filename := Execution_environment.interpreted_string (a_pathname)
							create a_file.make (a_filename)
							a_file.open_read
							if a_file.is_open_read then
								library_parser.parse_library (a_library, a_file)
								a_file.close
							else
								error_handler.report_cannot_read_file_error (a_pathname)
							end
						end
					end
					Result := ast_factory.new_mounted_library (a_pathname, a_library, a_position_table.item (an_element))
					if a_prefix /= Void then
						Result.set_library_prefix (a_prefix)
					end
				end
			end
		end

	new_options (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_OPTIONS is
			-- New option clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_option: STRING_.same_string (an_element.name, uc_option)
			a_position_table_not_void: a_position_table /= Void
		do
			Result := ast_factory.new_options
			fill_options (Result, an_element, a_position_table)
		ensure
			options_not_void: Result /= Void
		end

	new_export (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_CLASS_OPTIONS is
			-- New export clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_export: STRING_.same_string (an_element.name, uc_export)
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_feature: ET_XACE_FEATURE_OPTIONS
			a_child: XM_ELEMENT
			an_option: ET_XACE_OPTIONS
		do
			if an_element.has_attribute_by_name (uc_class) then
				a_name := an_element.attribute_by_name (uc_class).value
				if a_name /= Void then
					if a_name.count > 0 then
						an_option := ast_factory.new_options
						Result := ast_factory.new_class_options (a_name, an_option)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void and then STRING_.same_string (a_child.name, uc_feature) then
								a_feature := new_exported_feature (a_child, a_position_table)
								if a_feature /= Void then
									Result.put_feature_option (a_feature)
								end
							end
							a_cursor.forth
						end
						if Result.feature_options.is_empty then
							an_option.set_export_option (a_name)
						end
					end
				end
			end
		end

	new_exported_feature (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_FEATURE_OPTIONS is
			-- New exported feature build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_feature: STRING_.same_string (an_element.name, uc_feature)
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			an_alias: STRING
			an_option: ET_XACE_OPTIONS
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_name := an_element.attribute_by_name (uc_name).value
				if a_name /= Void then
					if an_element.has_attribute_by_name (uc_alias) then
						an_alias := an_element.attribute_by_name (uc_alias).value
						if an_alias = Void then
							an_alias := a_name
						end
					else
						an_alias := a_name
					end
					if a_name.count > 0 and an_alias.count > 0 then
						an_option := ast_factory.new_options
						an_option.set_export_option (an_alias)
						Result := ast_factory.new_feature_options (a_name, an_option)
					end
				end
			end
		end

feature {NONE} -- Element change

	fill_system (a_system: ET_XACE_SYSTEM; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Fill Xace system `a_system' with data found in `an_element'.
		require
			a_system_not_void: a_system /= Void
			an_element_not_void: an_element /= Void
			is_system: STRING_.same_string (an_element.name, uc_system)
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			a_root: XM_ELEMENT
			a_class: STRING
			a_creation: STRING
			a_cursor, old_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_cluster: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			a_clusters: ET_XACE_CLUSTERS
			a_mount: ET_XACE_MOUNTED_LIBRARY
			a_mounts: ET_XACE_MOUNTED_LIBRARIES
			i, nb: INTEGER
			a_library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_name := an_element.attribute_by_name (uc_name).value
			end
			if an_element.has_element_by_name (uc_root) then
				a_root := an_element.element_by_name (uc_root)
				if a_root.has_attribute_by_name (uc_class) then
					a_class := a_root.attribute_by_name (uc_class).value
				end
				if a_root.has_attribute_by_name (uc_creation) then
					a_creation := a_root.attribute_by_name (uc_creation).value
				end
			end
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if STRING_.same_string (a_child.name, uc_cluster) then
						if a_child.has_attribute_by_name (uc_name) then
							a_cluster := new_cluster (a_child, empty_prefix, a_position_table)
							if a_cluster /= Void then
								if a_clusters = Void then
									a_clusters := ast_factory.new_clusters (a_cluster)
								else
									a_clusters.put_last (a_cluster)
								end
							end
						else
								-- Old syntax.
							old_cursor := a_child.new_cursor
							from old_cursor.start until old_cursor.after loop
								a_child ?= old_cursor.item
								if a_child /= Void then
									if STRING_.same_string (a_child.name, uc_cluster) then
										a_cluster := new_cluster (a_child, empty_prefix, a_position_table)
										if a_cluster /= Void then
											if a_clusters = Void then
												a_clusters := ast_factory.new_clusters (a_cluster)
											else
												a_clusters.put_last (a_cluster)
											end
										end
									elseif STRING_.same_string (a_child.name, uc_mount) then
										a_mount := new_mount (a_child, a_position_table)
										if a_mount /= Void then
											if a_mounts = Void then
												a_mounts := ast_factory.new_mounted_libraries
											end
											a_mounts.put_last (a_mount)
										end
									elseif STRING_.same_string (a_child.name, uc_option) then
										if an_option /= Void then
											fill_options (an_option, a_child, a_position_table)
										else
											an_option := new_options (a_child, a_position_table)
										end
									elseif STRING_.same_string (a_child.name, uc_external) then
										if an_option = Void then
											an_option := ast_factory.new_options
										end
										fill_externals (an_option, Void, a_child, a_position_table)
									end
								end
								old_cursor.forth
							end
						end
					elseif STRING_.same_string (a_child.name, uc_mount) then
						a_mount := new_mount (a_child, a_position_table)
						if a_mount /= Void then
							if a_mounts = Void then
								a_mounts := ast_factory.new_mounted_libraries
							end
							a_mounts.put_last (a_mount)
						end
					elseif STRING_.same_string (a_child.name, uc_option) then
						if an_option /= Void then
							fill_options (an_option, a_child, a_position_table)
						else
							an_option := new_options (a_child, a_position_table)
						end
					elseif STRING_.same_string (a_child.name, uc_external) then
						if an_option = Void then
							an_option := ast_factory.new_options
						end
						fill_externals (an_option, Void, a_child, a_position_table)
					end
				end
				a_cursor.forth
			end
			if a_clusters /= Void then
				if a_mounts = Void then
					a_mounts := ast_factory.new_mounted_libraries
				end
				a_clusters.merge_libraries (a_mounts, error_handler)
				if a_mounts.libraries.is_empty then
					a_mounts := Void
				end
			end
			if a_mounts /= Void then
				a_mounts.set_root (True)
				a_library_list := a_mounts.libraries
				nb := a_library_list.count
				from i := 1 until i > nb loop
					a_library_list.item (i).library.merge_libraries (a_mounts, error_handler)
					i := i + 1
				end
			end
			if an_option = Void then
					-- Make sure that default values are taken into account.
				an_option := ast_factory.new_options
			end
			a_system.set_clusters (a_clusters)
			a_system.set_system_name (a_name)
			a_system.set_root_class_name (a_class)
			a_system.set_creation_procedure_name (a_creation)
			a_system.set_options (an_option)
			a_system.set_libraries (a_mounts)
		end

	fill_library (a_library: ET_XACE_LIBRARY; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Fill Xace library `a_library' with data found in `an_element'.
		require
			a_library_not_void: a_library /= Void
			an_element_not_void: an_element /= Void
			is_library: STRING_.same_string (an_element.name, uc_library) or
				STRING_.same_string (an_element.name, uc_cluster)
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			a_prefix: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_cluster: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			a_clusters: ET_XACE_CLUSTERS
			a_mount: ET_XACE_MOUNTED_LIBRARY
			a_mounts: ET_XACE_MOUNTED_LIBRARIES
			a_pathname: STRING
			i, nb: INTEGER
			a_library_list: DS_ARRAYED_LIST [ET_XACE_MOUNTED_LIBRARY]
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_name := an_element.attribute_by_name (uc_name).value
				if a_name /= Void then
					if a_name.count > 0 then
						a_library.set_name (a_name)
					end
				end
			end
			if STRING_.same_string (an_element.name, uc_cluster) then
				error_handler.report_element_obsoleted_by_element_warning (an_element, "<library>", a_position_table.item (an_element))
				a_cluster := new_cluster (an_element, empty_prefix, a_position_table)
				a_library.set_name (a_cluster.name)
				a_pathname := a_cluster.pathname
				if a_pathname = Void and a_cluster.is_abstract then
					a_library.set_name (a_cluster.name)
					a_library.set_options (a_cluster.options)
					a_clusters := a_cluster.subclusters
					a_mounts := a_cluster.libraries
				else
					a_clusters := ast_factory.new_clusters (a_cluster)
				end
			else
				if an_element.has_attribute_by_name (uc_prefix) then
					a_prefix := an_element.attribute_by_name (uc_prefix).value
					if a_prefix /= Void then
						a_library.set_library_prefix (a_prefix)
					end
				end
				a_cursor := an_element.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_child ?= a_cursor.item
					if a_child /= Void then
						if STRING_.same_string (a_child.name, uc_cluster) then
							a_cluster := new_cluster (a_child, empty_prefix, a_position_table)
							if a_cluster /= Void then
								if a_clusters = Void then
									a_clusters := ast_factory.new_clusters (a_cluster)
								else
									a_clusters.put_last (a_cluster)
								end
							end
						elseif STRING_.same_string (a_child.name, uc_mount) then
							a_mount := new_mount (a_child, a_position_table)
							if a_mount /= Void then
								if a_mounts = Void then
									a_mounts := ast_factory.new_mounted_libraries
								end
								a_mounts.put_last (a_mount)
							end
						elseif STRING_.same_string (a_child.name, uc_option) then
							if an_option /= Void then
								fill_options (an_option, a_child, a_position_table)
							else
								an_option := new_options (a_child, a_position_table)
							end
						elseif STRING_.same_string (a_child.name, uc_external) then
							if an_option = Void then
								an_option := ast_factory.new_options
							end
							fill_externals (an_option, Void, a_child, a_position_table)
						end
					end
					a_cursor.forth
				end
			end
			if a_clusters /= Void then
				if a_mounts = Void then
					a_mounts := ast_factory.new_mounted_libraries
				end
				a_clusters.merge_libraries (a_mounts, error_handler)
				if a_mounts.libraries.is_empty then
					a_mounts := Void
				end
			end
			if a_mounts /= Void then
				a_mounts.set_root (True)
				a_library_list := a_mounts.libraries
				nb := a_library_list.count
				from i := 1 until i > nb loop
					a_library_list.item (i).library.merge_libraries (a_mounts, error_handler)
					i := i + 1
				end
			end
			a_library.set_options (an_option)
			a_library.set_clusters (a_clusters)
			a_library.set_libraries (a_mounts)
		end

	fill_options (an_option: ET_XACE_OPTIONS; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Fill Xace option `an_option' with data found in `an_element'.
		require
			an_option_not_void: an_option /= Void
			an_element_not_void: an_element /= Void
			is_option: STRING_.same_string (an_element.name, uc_option)
			a_position_table_not_void: a_position_table /= Void
		local
			is_enclosing_option: BOOLEAN
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_name: STRING
			a_value: STRING
			an_int: INTEGER
			a_bool: STRING
			a_key: STRING
		do
			is_enclosing_option := True
			if an_element.has_attribute_by_name (uc_name) then
				is_enclosing_option := False
				a_name := an_element.attribute_by_name (uc_name).value
				if a_name = Void then
					-- Error already reported by the validator.
				else
					if not an_element.has_attribute_by_name (uc_value) then
						-- Error already reported by the validator.
					else
						a_value := an_element.attribute_by_name (uc_value).value
						if a_value = Void then
							-- Error already reported by the validator.
						else
							option_codes.search (a_name)
							if option_codes.found then
								inspect option_codes.found_item
								when abstract_code then
									if is_true (a_value) then
										an_option.set_abstract (True)
									elseif is_false (a_value) then
										an_option.set_abstract (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when address_expression_code then
									if is_true (a_value) then
										an_option.set_address_expression (True)
									elseif is_false (a_value) then
										an_option.set_address_expression (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when arguments_code then
									an_option.set_arguments (a_value)
								when array_optimization_code then
									if is_true (a_value) then
										an_option.set_array_optimization (True)
									elseif is_false (a_value) then
										an_option.set_array_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when assembly_code then
									if a_value.count > 0 then
										an_option.set_assembly (a_value)
									else
										error_handler.report_non_empty_attribute_expected_error (an_element, uc_value, a_position_table.item (an_element))
									end
								when assertion_code then
									if an_option.valid_assertion.has (a_value) then
										an_option.set_assertion (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_assertion, a_position_table.item (an_element))
									end
								when callback_code then
									if an_option.valid_callback.has (a_value) then
										an_option.set_callback (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_callback, a_position_table.item (an_element))
									end
								when case_insensitive_code then
									if is_true (a_value) then
										an_option.set_case_insensitive (True)
									elseif is_false (a_value) then
										an_option.set_case_insensitive (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when check_vape_code then
									if is_true (a_value) then
										an_option.set_check_vape (True)
									elseif is_false (a_value) then
										an_option.set_check_vape (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when clean_code then
									if is_true (a_value) then
										an_option.set_clean (True)
									elseif is_false (a_value) then
										an_option.set_clean (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when cls_compliant_code then
									if is_true (a_value) then
										an_option.set_cls_compliant (True)
									elseif is_false (a_value) then
										an_option.set_cls_compliant (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when component_code then
									if a_value.count > 0 then
										an_option.set_component (a_value)
									else
										error_handler.report_non_empty_attribute_expected_error (an_element, uc_value, a_position_table.item (an_element))
									end
								when console_application_code then
									if is_true (a_value) then
										an_option.set_console_application (True)
									elseif is_false (a_value) then
										an_option.set_console_application (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when create_keyword_extension_code then
									if is_true (a_value) then
										an_option.set_create_keyword_extension (True)
									elseif is_false (a_value) then
										an_option.set_create_keyword_extension (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when culture_code then
									an_option.set_culture (a_value)
								when c_compiler_options_code then
									an_option.set_c_compiler_options (a_value)
								when dead_code_removal_code then
									if an_option.valid_dead_code_removal.has (a_value) then
										an_option.set_dead_code_removal (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_dead_code_removal, a_position_table.item (an_element))
									end
								when debug_option_code then
									if is_true (a_value) then
										an_option.set_debug_option (True)
									elseif is_false (a_value) then
										an_option.set_debug_option (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when debug_tag_code then
									an_option.set_debug_tag (a_value)
								when debugger_code then
									if is_true (a_value) then
										an_option.set_debugger (True)
									elseif is_false (a_value) then
										an_option.set_debugger (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when document_code then
									an_option.set_document (a_value)
								when dotnet_naming_convention_code then
									if is_true (a_value) then
										an_option.set_dotnet_naming_convention (True)
									elseif is_false (a_value) then
										an_option.set_dotnet_naming_convention (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when dynamic_runtime_code then
									if is_true (a_value) then
										an_option.set_dynamic_runtime (True)
									elseif is_false (a_value) then
										an_option.set_dynamic_runtime (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when exception_trace_code then
									if is_true (a_value) then
										an_option.set_exception_trace (True)
									elseif is_false (a_value) then
										an_option.set_exception_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when exclude_code then
									an_option.set_exclude (a_value)
								when export_option_code then
									an_option.set_export_option (a_value)
								when finalize_option_code then
									if is_true (a_value) then
										an_option.set_finalize_option (True)
									elseif is_false (a_value) then
										an_option.set_finalize_option (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when flat_fst_optimization_code then
									if is_true (a_value) then
										an_option.set_flat_fst_optimization (True)
									elseif is_false (a_value) then
										an_option.set_flat_fst_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when fst_expansion_factor_code then
									if STRING_.is_integer (a_value) then
										an_int := a_value.to_integer
										if an_int >= 0 then
											an_option.set_fst_expansion_factor (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when fst_optimization_code then
									if is_true (a_value) then
										an_option.set_fst_optimization (True)
									elseif is_false (a_value) then
										an_option.set_fst_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when garbage_collector_code then
									if an_option.valid_garbage_collector.has (a_value) then
										an_option.set_garbage_collector (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_garbage_collector, a_position_table.item (an_element))
									end
								when gc_info_code then
									if is_true (a_value) then
										an_option.set_gc_info (True)
									elseif is_false (a_value) then
										an_option.set_gc_info (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when heap_size_code then
									if STRING_.is_integer (a_value) then
										an_int := a_value.to_integer
										if an_int >= 0 then
											an_option.set_heap_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when header_code then
									an_option.set_header (a_value)
								when high_memory_compiler_code then
									if is_true (a_value) then
										an_option.set_high_memory_compiler (True)
									elseif is_false (a_value) then
										an_option.set_high_memory_compiler (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when il_verifiable_code then
									if is_true (a_value) then
										an_option.set_il_verifiable (True)
									elseif is_false (a_value) then
										an_option.set_il_verifiable (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when include_code then
									an_option.set_include (a_value)
								when inlining_code then
									if an_option.valid_inlining.has (a_value) then
										an_option.set_inlining (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_inlining, a_position_table.item (an_element))
									end
								when inlining_size_code then
									if STRING_.is_integer (a_value) then
										an_int := a_value.to_integer
										if an_int >= 0 then
											an_option.set_inlining_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when jumps_optimization_code then
									if is_true (a_value) then
										an_option.set_jumps_optimization (True)
									elseif is_false (a_value) then
										an_option.set_jumps_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when layout_code then
									if an_option.valid_layout.has (a_value) then
										an_option.set_layout (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_layout, a_position_table.item (an_element))
									end
								when layout_optimization_code then
									if is_true (a_value) then
										an_option.set_layout_optimization (True)
									elseif is_false (a_value) then
										an_option.set_layout_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when leaves_optimization_code then
									if is_true (a_value) then
										an_option.set_leaves_optimization (True)
									elseif is_false (a_value) then
										an_option.set_leaves_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when line_generation_code then
									if is_true (a_value) then
										an_option.set_line_generation (True)
									elseif is_false (a_value) then
										an_option.set_line_generation (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when link_code then
									an_option.set_link (a_value)
								when linker_code then
									if an_option.valid_linker.has (a_value) then
										an_option.set_linker (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_linker, a_position_table.item (an_element))
									end
								when linux_fpu_double_precision_code then
									if is_true (a_value) then
										an_option.set_linux_fpu_double_precision (True)
									elseif is_false (a_value) then
										an_option.set_linux_fpu_double_precision (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when manifest_string_trace_code then
									if is_true (a_value) then
										an_option.set_manifest_string_trace (True)
									elseif is_false (a_value) then
										an_option.set_manifest_string_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when map_code then
									if is_true (a_value) then
										an_option.set_map (True)
									elseif is_false (a_value) then
										an_option.set_map (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when metadata_cache_path_code then
									an_option.set_metadata_cache_path (a_value)
								when msil_assembly_compatibility_code then
									an_option.set_msil_assembly_compatibility (a_value)
								when msil_clr_version_code then
									an_option.set_msil_clr_version (a_value)
								when msil_generation_code then
									if is_true (a_value) then
										an_option.set_msil_generation (True)
									elseif is_false (a_value) then
										an_option.set_msil_generation (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when msil_generation_version_code then
									an_option.set_msil_generation_version (a_value)
								when multithreaded_code then
									if is_true (a_value) then
										an_option.set_multithreaded (True)
									elseif is_false (a_value) then
										an_option.set_multithreaded (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when namespace_code then
									an_option.set_namespace (a_value)
								when no_default_lib_code then
									if is_true (a_value) then
										an_option.set_no_default_lib (True)
									elseif is_false (a_value) then
										an_option.set_no_default_lib (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when override_cluster_code then
									an_option.set_override_cluster (a_value)
								when portable_code_generation_code then
									if is_true (a_value) then
										an_option.set_portable_code_generation (True)
									elseif is_false (a_value) then
										an_option.set_portable_code_generation (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when precompiled_code then
									an_option.set_precompiled (a_value)
								when prefix_option_code then
									an_option.set_prefix_option (a_value)
								when profile_code then
									if is_true (a_value) then
										an_option.set_profile (True)
									elseif is_false (a_value) then
										an_option.set_profile (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when public_key_token_code then
									an_option.set_public_key_token (a_value)
								when read_only_code then
									if is_true (a_value) then
										an_option.set_read_only (True)
									elseif is_false (a_value) then
										an_option.set_read_only (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when recursive_code then
									if is_true (a_value) then
										an_option.set_recursive (True)
									elseif is_false (a_value) then
										an_option.set_recursive (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when reloads_optimization_code then
									if is_true (a_value) then
										an_option.set_reloads_optimization (True)
									elseif is_false (a_value) then
										an_option.set_reloads_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when shared_library_definition_code then
									an_option.set_shared_library_definition (a_value)
								when split_code then
									if is_true (a_value) then
										an_option.set_split (True)
									elseif is_false (a_value) then
										an_option.set_split (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when stack_size_code then
									if STRING_.is_integer (a_value) then
										an_int := a_value.to_integer
										if an_int >= 0 then
											an_option.set_stack_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when storable_filename_code then
									an_option.set_storable_filename (a_value)
								when strip_option_code then
									if is_true (a_value) then
										an_option.set_strip_option (True)
									elseif is_false (a_value) then
										an_option.set_strip_option (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when target_code then
									if an_option.valid_target.has (a_value) then
										an_option.set_target (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_target, a_position_table.item (an_element))
									end
								when trace_code then
									if is_true (a_value) then
										an_option.set_trace (True)
									elseif is_false (a_value) then
										an_option.set_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when use_cluster_name_as_namespace_code then
									if is_true (a_value) then
										an_option.set_use_cluster_name_as_namespace (True)
									elseif is_false (a_value) then
										an_option.set_use_cluster_name_as_namespace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when use_full_cluster_name_as_namespace_code then
									if is_true (a_value) then
										an_option.set_use_full_cluster_name_as_namespace (True)
									elseif is_false (a_value) then
										an_option.set_use_full_cluster_name_as_namespace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when verbose_code then
									if is_true (a_value) then
										an_option.set_verbose (True)
									elseif is_false (a_value) then
										an_option.set_verbose (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when version_code then
									an_option.set_version (a_value)
								when visible_filename_code then
									an_option.set_visible_filename (a_value)
								when warning_code then
									if an_option.valid_warning.has (a_value) then
										an_option.set_warning (a_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_warning, a_position_table.item (an_element))
									end
								when wedit_code then
									if is_true (a_value) then
										an_option.set_wedit (True)
									elseif is_false (a_value) then
										an_option.set_wedit (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								else
									-- Unknown option.
								end
							else
								-- Unknown option.
							end
						end
					end
				end
			end
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if not is_enclosing_option then
						-- Error already reported by the validator.
					elseif STRING_.same_string (a_child.name, uc_option) then
						fill_options (an_option, a_child, a_position_table)
					elseif STRING_.same_string (a_child.name, uc_require) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"require%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_assertion (require_value)
								end
							end
						else
							an_option.set_assertion (require_value)
						end
					elseif STRING_.same_string (a_child.name, uc_ensure) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"ensure%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_assertion (ensure_value)
								end
							end
						else
							an_option.set_assertion (ensure_value)
						end
					elseif STRING_.same_string (a_child.name, uc_invariant) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"invariant%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_assertion (invariant_value)
								end
							end
						else
							an_option.set_assertion (invariant_value)
						end
					elseif STRING_.same_string (a_child.name, uc_loop) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"loop_[in]variant%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_assertion (loop_invariant_value)
									an_option.set_assertion (loop_variant_value)
								end
							end
						else
							an_option.set_assertion (loop_invariant_value)
							an_option.set_assertion (loop_variant_value)
						end
					elseif STRING_.same_string (a_child.name, uc_check) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"assertion%" value=%"check%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_assertion (check_value)
								end
							end
						else
							an_option.set_assertion (check_value)
						end
					elseif STRING_.same_string (a_child.name, uc_optimize) then
						error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"finalize%" value=%"true%"/>", a_position_table.item (a_child))
						if a_child.has_attribute_by_name (uc_enable) then
							a_bool := a_child.attribute_by_name (uc_enable).value
							if a_bool /= Void then
								if is_true (a_bool) then
									an_option.set_finalize_option (True)
								end
							end
						else
							an_option.set_finalize_option (True)
						end
					elseif STRING_.same_string (a_child.name, uc_debug) then
						if a_child.has_attribute_by_name (uc_name) then
							a_key := a_child.attribute_by_name (uc_name).value
							if a_key /= Void then
								error_handler.report_element_obsoleted_by_element_warning (a_child, STRING_.concat ("<option name=%"debug_tag%" value=%"", a_key) + "%"/>", a_position_table.item (a_child))
								if a_child.has_attribute_by_name (uc_enable) then
									a_bool := a_child.attribute_by_name (uc_enable).value
									if a_bool /= Void then
										if is_true (a_bool) then
											an_option.set_debug_tag (a_key)
										end
									end
								else
									an_option.set_debug_tag (a_key)
								end
							end
						else
							if a_child.has_attribute_by_name (uc_enable) then
								a_bool := a_child.attribute_by_name (uc_enable).value
								if a_bool /= Void then
									if is_true (a_bool) then
										error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true%"/>", a_position_table.item (a_child))
										an_option.set_debug_option (True)
									elseif is_false (a_bool) then
										error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"false%"/>", a_position_table.item (a_child))
										an_option.set_debug_option (False)
									else
										error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true/false%"/>", a_position_table.item (a_child))
									end
								end
							else
								error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"debug%" value=%"true%"/>", a_position_table.item (a_child))
								an_option.set_debug_option (True)
							end
						end
					end
				end
				a_cursor.forth
			end
		end

	fill_externals (an_option: ET_XACE_OPTIONS; a_cluster: ET_XACE_CLUSTER; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Fill Xace externals with data found in `an_element'.
		require
			an_option_not_void: an_option /= Void
			an_element_not_void: an_element /= Void
			is_external: STRING_.same_string (an_element.name, uc_external)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			an_export: ET_XACE_CLASS_OPTIONS
			a_value: STRING
		do
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if STRING_.same_string (a_child.name, uc_link_library) then
						if a_child.has_attribute_by_name (uc_location) then
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								an_option.set_link (a_value)
							end
						end
					elseif STRING_.same_string (a_child.name, uc_include_dir) then
						if a_child.has_attribute_by_name (uc_location) then
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								an_option.set_header (a_value)
							end
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
	False_constant: STRING is "false"
			-- Boolean string representation

	empty_prefix: STRING is ""
			-- Empty prefix

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void

end
