indexing

	description:

		"Xace Abstract Syntax Tree factories"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_AST_FACTORY

inherit

	ET_XACE_ELEMENT_NAMES

	KL_SHARED_EXECUTION_ENVIRONMENT
	KL_IMPORTED_INPUT_STREAM_ROUTINES
	KL_IMPORTED_STRING_ROUTINES

creation

	make

feature {NONE} -- Initialization

	make (a_variables: like variables; an_error_handler: like error_handler) is
			-- Create a new AST factory.
			-- Use `a_variables' for variable expansion.
		require
			a_variables_not_void: a_variables /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			variables := a_variables
			error_handler := an_error_handler
		ensure
			variables_set: variables = a_variables
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	variables: ET_XACE_VARIABLES
			-- Dollar variables defined

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Setting

	set_variables (a_variables: like variables) is
			-- Set `variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
		do
			variables := a_variables
		ensure
			variables_set: variables = a_variables
		end

feature -- AST factory

	new_universe (an_element: XM_ELEMENT): ET_XACE_UNIVERSE is
			-- New class universe build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: an_element.name.is_equal (uc_system)
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
			a_name: STRING
			a_root: XM_ELEMENT
			a_class: STRING
			a_creation: STRING
			a_root_cluster: XM_ELEMENT
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_cluster: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			an_external: ET_XACE_EXTERNALS
			a_clusters: ET_XACE_CLUSTERS
			a_mount: ET_XACE_MOUNTED_CLUSTER
			a_mounts: ET_XACE_MOUNTED_CLUSTERS
			a_value: UC_STRING
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_value := an_element.attribute_by_name (uc_name).value
				if a_value /= Void then
					a_name := variables.expanded_variables (a_value.to_utf8)
				end
			end
			if an_element.has_element_by_name (uc_root) then
				a_root := an_element.element_by_name (uc_root)
				if a_root.has_attribute_by_name (uc_class) then
					a_value := a_root.attribute_by_name (uc_class).value
					if a_value /= Void then
						a_class := variables.expanded_variables (a_value.to_utf8)
					end
				end
				if a_root.has_attribute_by_name (uc_creation) then
					a_value := a_root.attribute_by_name (uc_creation).value
					if a_value /= Void then
						a_creation := variables.expanded_variables (a_value.to_utf8)
					end
				end
			end
			if an_element.has_element_by_name (uc_cluster) then
				a_root_cluster := an_element.element_by_name (uc_cluster)
				a_cursor := a_root_cluster.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_child ?= a_cursor.item
					if a_child /= Void then
						if a_child.name.is_equal (uc_cluster) then
							a_cluster := new_cluster (a_child)
							if a_cluster /= Void then
								if a_clusters = Void then
									!! a_clusters.make (a_cluster)
								else
									a_clusters.put_last (a_cluster)
								end
							end
						elseif a_child.name.is_equal (uc_mount) then
							a_mount := new_mount (a_child)
							if a_mount /= Void then
								if a_mounts = Void then
									!! a_mounts.make (a_mount)
								else
									a_mounts.put_last (a_mount)
								end
							end
						elseif a_child.name.is_equal (uc_option) then
							an_option := new_options (a_child)
						elseif a_child.name.is_equal (uc_external) then
							an_external := new_externals (a_child)
						end
					end
					a_cursor.forth
				end
			end
			!! an_error_handler.make_standard
			!! a_factory.make
			!! Result.make_with_factory (a_clusters, a_factory, an_error_handler)
			Result.set_system_name (a_name)
			Result.set_root_class_name (a_class)
			Result.set_creation_procedure_name (a_creation)
			Result.set_options (an_option)
			Result.set_externals (an_external)
			Result.set_mounted_clusters (a_mounts)
		end

	new_cluster (an_element: XM_ELEMENT): ET_XACE_CLUSTER is
			-- New cluster build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: an_element.name.is_equal (uc_cluster)
		local
			a_name: STRING
			a_pathname: STRING
			a_value: UC_STRING
			a_bool: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_cluster: ET_XACE_CLUSTER
			an_option: ET_XACE_OPTIONS
			an_external: ET_XACE_EXTERNALS
			subclusters: ET_XACE_CLUSTERS
			a_mount: ET_XACE_MOUNTED_CLUSTER
			a_mounts: ET_XACE_MOUNTED_CLUSTERS
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_value := an_element.attribute_by_name (uc_name).value
				if a_value /= Void then
					a_name := variables.expanded_variables (a_value.to_utf8)
					if a_name.count > 0 then
						if an_element.has_attribute_by_name (uc_location) then
							a_value := an_element.attribute_by_name (uc_location).value
							if a_value /= Void then
								a_pathname := variables.expanded_variables (a_value.to_utf8)
							end
						end
					end
					!! Result.make (a_name, a_pathname)
					if an_element.has_attribute_by_name (uc_abstract) then
						a_value := an_element.attribute_by_name (uc_abstract).value
						if a_value /= Void then
							a_bool := variables.expanded_variables (a_value.to_utf8)
							if is_true (a_bool) then
								Result.set_abstract (True)
							elseif is_false (a_bool) then
								Result.set_abstract (False)
							end
						end
					end
					a_cursor := an_element.new_cursor
					from a_cursor.start until a_cursor.after loop
						a_child ?= a_cursor.item
						if a_child /= Void then
							if a_child.name.is_equal (uc_cluster) then
								a_cluster := new_cluster (a_child)
								if a_cluster /= Void then
									if subclusters = Void then
										!! subclusters.make (a_cluster)
									else
										subclusters.put_last (a_cluster)
									end
								end
							elseif a_child.name.is_equal (uc_mount) then
								a_mount := new_mount (a_child)
								if a_mount /= Void then
									if a_mounts = Void then
										!! a_mounts.make (a_mount)
									else
										a_mounts.put_last (a_mount)
									end
								end
							elseif a_child.name.is_equal (uc_option) then
								an_option := new_options (a_child)
								if an_option /= Void then
									Result.set_options (an_option)
								end
							elseif a_child.name.is_equal (uc_external) then
								an_external := new_externals (a_child)
								if an_external /= Void then
									Result.set_externals (an_external)
								end
							end
						end
						a_cursor.forth
					end
					Result.set_subclusters (subclusters)
					Result.set_mounted_subclusters (a_mounts)
				end
			end
		end

	new_mount (an_element: XM_ELEMENT): ET_XACE_MOUNTED_CLUSTER is
			-- New mounted cluster build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_mount: an_element.name.is_equal (uc_mount)
		local
			a_value: UC_STRING
			a_pathname: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			an_excluded: DS_LINKED_LIST [STRING]
			a_parser: ET_XACE_CLUSTER_PARSER
			a_cluster: ET_XACE_CLUSTER
			a_filename: STRING
			a_file: like INPUT_STREAM_TYPE
			clusters: ET_XACE_CLUSTERS
		do
			if an_element.has_attribute_by_name (uc_location) then
				a_value := an_element.attribute_by_name (uc_location).value
				if a_value /= Void then
					a_pathname := variables.expanded_variables (a_value.to_utf8)
					if a_pathname.count > 0 then
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void then
								if a_child.name.is_equal (uc_exclude) then
									if a_child.has_attribute_by_name (uc_cluster) then
										a_value := a_child.attribute_by_name (uc_cluster).value
										if a_value /= Void then
											if an_excluded = Void then
												!! an_excluded.make
											end
											an_excluded.force_last (variables.expanded_variables (a_value.to_utf8))
										end
									end
								end
							end
							a_cursor.forth
						end
						!! a_parser.make_with_factory (Current, error_handler)
						a_filename := Execution_environment.interpreted_string (a_pathname)
						a_file := INPUT_STREAM_.make_file_open_read (a_filename)
						if INPUT_STREAM_.is_open_read (a_file) then
							a_parser.parse_file (a_file)
							INPUT_STREAM_.close (a_file)
							a_cluster := a_parser.last_cluster
							if a_cluster /= Void then
								!! clusters.make (a_cluster)
								!! Result.make (a_pathname ,clusters)
								Result.set_excluded (an_excluded)
							end
						else
							error_handler.report_cannot_read_file_error (a_pathname)
						end
					end
				end
			end
		end

	new_options (an_element: XM_ELEMENT): ET_XACE_OPTIONS is
			-- New option clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_option: an_element.name.is_equal (uc_option)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_value: UC_STRING
			a_bool: STRING
			a_key: STRING
		do
			!! Result.make
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if a_child.name.is_equal (uc_require) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_require (True)
								elseif is_false (a_bool) then
									Result.set_require (False)
								end
							end
						else
							Result.set_require (True)
						end
					elseif a_child.name.is_equal (uc_ensure) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_ensure (True)
								elseif is_false (a_bool) then
									Result.set_ensure (False)
								end
							end
						else
							Result.set_ensure (True)
						end
					elseif a_child.name.is_equal (uc_invariant) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_invariant (True)
								elseif is_false (a_bool) then
									Result.set_invariant (False)
								end
							end
						else
							Result.set_invariant (True)
						end
					elseif a_child.name.is_equal (uc_loop) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_loop (True)
								elseif is_false (a_bool) then
									Result.set_loop (False)
								end
							end
						else
							Result.set_loop (True)
						end
					elseif a_child.name.is_equal (uc_check) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_check (True)
								elseif is_false (a_bool) then
									Result.set_check (False)
								end
							end
						else
							Result.set_check (True)
						end
					elseif a_child.name.is_equal (uc_optimize) then
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := variables.expanded_variables (a_value.to_utf8)
								if is_true (a_bool) then
									Result.set_optimize (True)
								elseif is_false (a_bool) then
									Result.set_optimize (False)
								end
							end
						else
							Result.set_optimize (True)
						end
					elseif a_child.name.is_equal (uc_debug) then
						if a_child.has_attribute_by_name (uc_name) then
							a_value := a_child.attribute_by_name (uc_name).value
							if a_value /= Void then
								a_key := variables.expanded_variables (a_value.to_utf8)
								if a_child.has_attribute_by_name (uc_enable) then
									a_value := a_child.attribute_by_name (uc_enable).value
									if a_value /= Void then
										a_bool := variables.expanded_variables (a_value.to_utf8)
										if is_true (a_bool) then
											Result.set_debug_key (a_key, True)
										elseif is_false (a_bool) then
											Result.set_debug_key (a_key, False)
										end
									end
								else
									Result.set_debug_key (a_key, True)
								end
							end
						else
							if a_child.has_attribute_by_name (uc_enable) then
								a_value := a_child.attribute_by_name (uc_enable).value
								if a_value /= Void then
									a_bool := variables.expanded_variables (a_value.to_utf8)
									if is_true (a_bool) then
										Result.set_debug (True)
									elseif is_false (a_bool) then
										Result.set_debug (False)
									end
								end
							else
								Result.set_debug (True)
							end
						end
					end
				end
				a_cursor.forth
			end
		end

	new_externals (an_element: XM_ELEMENT): ET_XACE_EXTERNALS is
			-- New external clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_external: an_element.name.is_equal (uc_external)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			an_export: ET_XACE_EXPORTED_CLASS
			a_value: UC_STRING
		do
			a_cursor := an_element.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if a_child.name.is_equal (uc_link_library) then
						if a_child.has_attribute_by_name (uc_location) then
							if Result = Void then
								!! Result.make
							end
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								Result.put_link_library (variables.expanded_variables (a_value.to_utf8))
							end
						end
					elseif a_child.name.is_equal (uc_include_dir) then
						if a_child.has_attribute_by_name (uc_location) then
							if Result = Void then
								!! Result.make
							end
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								Result.put_include_directory (variables.expanded_variables (a_value.to_utf8))
							end
						end
					elseif a_child.name.is_equal (uc_export) then
						an_export := new_export (a_child)
						if an_export /= Void then
							if Result = Void then
								!! Result.make
							end
							Result.put_exported_class (an_export)
						end
					end
				end
				a_cursor.forth
			end
		end

	new_export (an_element: XM_ELEMENT): ET_XACE_EXPORTED_CLASS is
			-- New export clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_export: an_element.name.is_equal (uc_export)
		local
			a_name: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_feature: ET_XACE_EXPORTED_FEATURE
			a_child: XM_ELEMENT
			a_value: UC_STRING
		do
			if an_element.has_attribute_by_name (uc_class) then
				a_value := an_element.attribute_by_name (uc_class).value
				if a_value /= Void then
					a_name := variables.expanded_variables (a_value.to_utf8)
					if a_name.count > 0 then
						!! Result.make (a_name)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void and then a_child.name.is_equal (uc_feature) then
								a_feature := new_exported_feature (a_child)
								if a_feature /= Void then
									Result.features.force_last (a_feature)
								end
							end
							a_cursor.forth
						end
					end
				end
			end
		end

	new_exported_feature (an_element: XM_ELEMENT): ET_XACE_EXPORTED_FEATURE is
			-- New exported feature build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_feature: an_element.name.is_equal (uc_feature)
		local
			a_name: STRING
			an_alias: STRING
			a_value: UC_STRING
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_value := an_element.attribute_by_name (uc_name).value
				if a_value /= Void then
					a_name := variables.expanded_variables (a_value.to_utf8)
					if an_element.has_attribute_by_name (uc_alias) then
						a_value := an_element.attribute_by_name (uc_alias).value
						if a_value /= Void then
							an_alias := variables.expanded_variables (a_value.to_utf8)
						else
							an_alias := a_name
						end
					else
						an_alias := a_name
					end
					if a_name.count > 0 and an_alias.count > 0 then
						!! Result.make (a_name, an_alias)
					end
				end
			end
		end

feature {NONE} -- Implementation

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

invariant

	variables_not_void: variables /= Void
	error_handler_not_void: error_handler /= Void

end -- class ET_XACE_AST_FACTORY
