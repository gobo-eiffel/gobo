indexing

	description:

		"Xace parser skeletons"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
		local
			a_factory: ET_XACE_AST_FACTORY
		do
			!! a_factory.make
			make_with_factory (a_factory, an_error_handler)
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

	cluster_parser: ET_XACE_CLUSTER_PARSER is
			-- Cluster Parser
		deferred
		ensure
			cluster_parser_not_void: Result /= Void
		end

	ast_factory: ET_XACE_AST_FACTORY
			-- Abstract Syntax Tree factory

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature {NONE} -- AST factory

	new_system (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_SYSTEM is
			-- New Xace system build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: an_element.name.is_equal (uc_system)
			a_position_table_not_void: a_position_table /= Void
		do
			Result := ast_factory.new_system (Void)
			fill_system (Result, an_element, a_position_table)
		end

	new_universe (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_UNIVERSE is
			-- New class universe build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_system: an_element.name.is_equal (uc_system)
			a_position_table_not_void: a_position_table /= Void
		local
			an_error_handler: ET_ERROR_HANDLER
			a_factory: ET_AST_FACTORY
		do
			an_error_handler := ast_factory.new_error_handler
			a_factory := ast_factory.new_ast_factory
			Result := ast_factory.new_universe (Void, a_factory, an_error_handler)
			fill_system (Result, an_element, a_position_table)
		end

	new_cluster (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_CLUSTER is
			-- New cluster build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_cluster: an_element.name.is_equal (uc_cluster)
			a_position_table_not_void: a_position_table /= Void
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
					a_name := a_value.to_utf8
					if a_name.count > 0 then
						if an_element.has_attribute_by_name (uc_location) then
							a_value := an_element.attribute_by_name (uc_location).value
							if a_value /= Void then
								a_pathname := a_value.to_utf8
							end
						end
					end
					Result := ast_factory.new_cluster (a_name, a_pathname)
					if an_element.has_attribute_by_name (uc_abstract) then
						a_value := an_element.attribute_by_name (uc_abstract).value
						if a_value /= Void then
							a_bool := a_value.to_utf8
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
								a_cluster := new_cluster (a_child, a_position_table)
								if a_cluster /= Void then
									if subclusters = Void then
										subclusters := ast_factory.new_clusters (a_cluster)
									else
										subclusters.put_last (a_cluster)
									end
								end
							elseif a_child.name.is_equal (uc_mount) then
								a_mount := new_mount (a_child, a_position_table)
								if a_mount /= Void then
									if a_mounts = Void then
										a_mounts := ast_factory.new_mounted_clusters (a_mount)
									else
										a_mounts.put_last (a_mount)
									end
								end
							elseif a_child.name.is_equal (uc_option) then
								if an_option /= Void then
									fill_options (an_option, a_child, a_position_table)
								else
									an_option := new_options (a_child, a_position_table)
									Result.set_options (an_option)
								end
							elseif a_child.name.is_equal (uc_external) then
								an_external := new_externals (a_child, a_position_table)
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

	new_mount (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_MOUNTED_CLUSTER is
			-- New mounted cluster build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_mount: an_element.name.is_equal (uc_mount)
			a_position_table_not_void: a_position_table /= Void
		local
			a_value: UC_STRING
			a_pathname: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			an_excluded: DS_LINKED_LIST [STRING]
			a_cluster: ET_XACE_CLUSTER
			a_filename: STRING
			a_file: KL_TEXT_INPUT_FILE
			clusters: ET_XACE_CLUSTERS
		do
			if an_element.has_attribute_by_name (uc_location) then
				a_value := an_element.attribute_by_name (uc_location).value
				if a_value /= Void then
					a_pathname := a_value.to_utf8
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
											an_excluded.force_last (a_value.to_utf8)
										end
									end
								end
							end
							a_cursor.forth
						end
						a_filename := Execution_environment.interpreted_string (a_pathname)
						!! a_file.make (a_filename)
						a_file.open_read
						if a_file.is_open_read then
							cluster_parser.parse_file (a_file)
							a_file.close
							a_cluster := cluster_parser.last_cluster
							if a_cluster /= Void then
								clusters := ast_factory.new_clusters (a_cluster)
								Result := ast_factory.new_mounted_cluster (a_pathname, clusters)
								Result.set_excluded (an_excluded)
							end
						else
							error_handler.report_cannot_read_file_error (a_pathname)
						end
					end
				end
			end
		end

	new_options (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_OPTIONS is
			-- New option clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_option: an_element.name.is_equal (uc_option)
			a_position_table_not_void: a_position_table /= Void
		do
			Result := ast_factory.new_options
			fill_options (Result, an_element, a_position_table)
		ensure
			options_not_void: Result /= Void
		end

	new_externals (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_EXTERNALS is
			-- New external clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_external: an_element.name.is_equal (uc_external)
			a_position_table_not_void: a_position_table /= Void
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
								Result := ast_factory.new_externals
							end
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								Result.put_link_library (a_value.to_utf8)
							end
						end
					elseif a_child.name.is_equal (uc_include_dir) then
						if a_child.has_attribute_by_name (uc_location) then
							if Result = Void then
								Result := ast_factory.new_externals
							end
							a_value := a_child.attribute_by_name (uc_location).value
							if a_value /= Void then
								Result.put_include_directory (a_value.to_utf8)
							end
						end
					elseif a_child.name.is_equal (uc_export) then
						an_export := new_export (a_child, a_position_table)
						if an_export /= Void then
							if Result = Void then
								Result := ast_factory.new_externals
							end
							Result.put_exported_class (an_export)
						end
					end
				end
				a_cursor.forth
			end
		end

	new_export (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_EXPORTED_CLASS is
			-- New export clause build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_export: an_element.name.is_equal (uc_export)
			a_position_table_not_void: a_position_table /= Void
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
					a_name := a_value.to_utf8
					if a_name.count > 0 then
						Result := ast_factory.new_exported_class (a_name)
						a_cursor := an_element.new_cursor
						from a_cursor.start until a_cursor.after loop
							a_child ?= a_cursor.item
							if a_child /= Void and then a_child.name.is_equal (uc_feature) then
								a_feature := new_exported_feature (a_child, a_position_table)
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

	new_exported_feature (an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE): ET_XACE_EXPORTED_FEATURE is
			-- New exported feature build from `an_element'
		require
			an_element_not_void: an_element /= Void
			is_feature: an_element.name.is_equal (uc_feature)
			a_position_table_not_void: a_position_table /= Void
		local
			a_name: STRING
			an_alias: STRING
			a_value: UC_STRING
		do
			if an_element.has_attribute_by_name (uc_name) then
				a_value := an_element.attribute_by_name (uc_name).value
				if a_value /= Void then
					a_name := a_value.to_utf8
					if an_element.has_attribute_by_name (uc_alias) then
						a_value := an_element.attribute_by_name (uc_alias).value
						if a_value /= Void then
							an_alias := a_value.to_utf8
						else
							an_alias := a_name
						end
					else
						an_alias := a_name
					end
					if a_name.count > 0 and an_alias.count > 0 then
						Result := ast_factory.new_exported_feature (a_name, an_alias)
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
			is_system: an_element.name.is_equal (uc_system)
			a_position_table_not_void: a_position_table /= Void
		local
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
					a_name := a_value.to_utf8
				end
			end
			if an_element.has_element_by_name (uc_root) then
				a_root := an_element.element_by_name (uc_root)
				if a_root.has_attribute_by_name (uc_class) then
					a_value := a_root.attribute_by_name (uc_class).value
					a_class := a_value.to_utf8
				end
				if a_root.has_attribute_by_name (uc_creation) then
					a_value := a_root.attribute_by_name (uc_creation).value
					if a_value /= Void then
						a_creation := a_value.to_utf8
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
							a_cluster := new_cluster (a_child, a_position_table)
							if a_cluster /= Void then
								if a_clusters = Void then
									a_clusters := ast_factory.new_clusters (a_cluster)
								else
									a_clusters.put_last (a_cluster)
								end
							end
						elseif a_child.name.is_equal (uc_mount) then
							a_mount := new_mount (a_child, a_position_table)
							if a_mount /= Void then
								if a_mounts = Void then
									a_mounts := ast_factory.new_mounted_clusters (a_mount)
								else
									a_mounts.put_last (a_mount)
								end
							end
						elseif a_child.name.is_equal (uc_option) then
							if an_option /= Void then
								fill_options (an_option, a_child, a_position_table)
							else
								an_option := new_options (a_child, a_position_table)
							end
						elseif a_child.name.is_equal (uc_external) then
							an_external := new_externals (a_child, a_position_table)
						end
					end
					a_cursor.forth
				end
			end
			a_system.set_clusters (a_clusters)
			a_system.set_system_name (a_name)
			a_system.set_root_class_name (a_class)
			a_system.set_creation_procedure_name (a_creation)
			a_system.set_options (an_option)
			a_system.set_externals (an_external)
			a_system.set_mounted_clusters (a_mounts)
		end

	fill_options (an_option: ET_XACE_OPTIONS; an_element: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Fill Xace option `an_option' with data found in `an_element'.
		require
			an_option_not_void: an_option /= Void
			an_element_not_void: an_element /= Void
			is_option: an_element.name.is_equal (uc_option)
			a_position_table_not_void: a_position_table /= Void
		local
			is_enclosing_option: BOOLEAN
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_name: UC_STRING
			a_value: UC_STRING
			a_string_value: STRING
			an_int: INTEGER
			a_bool: STRING
			a_key: STRING
			a_warning: UT_MESSAGE
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
							option_codes.search (a_name.to_utf8)
							if option_codes.found then
								a_string_value := a_value.to_utf8
								inspect option_codes.found_item
								when address_expression_code then
									if is_true (a_string_value) then
										an_option.set_address_expression (True)
									elseif is_false (a_string_value) then
										an_option.set_address_expression (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when arguments_code then
									an_option.set_arguments (a_string_value)
								when array_optimization_code then
									if is_true (a_string_value) then
										an_option.set_array_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_array_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when assertion_code then
									if an_option.valid_assertion.has (a_string_value) then
										an_option.set_assertion (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_assertion, a_position_table.item (an_element))
									end
								when case_insensitive_code then
									if is_true (a_string_value) then
										an_option.set_case_insensitive (True)
									elseif is_false (a_string_value) then
										an_option.set_case_insensitive (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when check_vape_code then
									if is_true (a_string_value) then
										an_option.set_check_vape (True)
									elseif is_false (a_string_value) then
										an_option.set_check_vape (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when clean_code then
									if is_true (a_string_value) then
										an_option.set_clean (True)
									elseif is_false (a_string_value) then
										an_option.set_clean (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when component_code then
									an_option.set_component (a_string_value)
								when console_application_code then
									if is_true (a_string_value) then
										an_option.set_console_application (True)
									elseif is_false (a_string_value) then
										an_option.set_console_application (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when create_keyword_extension_code then
									if is_true (a_string_value) then
										an_option.set_create_keyword_extension (True)
									elseif is_false (a_string_value) then
										an_option.set_create_keyword_extension (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when dead_code_removal_code then
									if an_option.valid_dead_code_removal.has (a_string_value) then
										an_option.set_dead_code_removal (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_dead_code_removal, a_position_table.item (an_element))
									end
								when debug_option_code then
									if is_true (a_string_value) then
										an_option.set_debug_option (True)
									elseif is_false (a_string_value) then
										an_option.set_debug_option (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when debug_tag_code then
									an_option.set_debug_tag (a_string_value)
								when debugger_code then
									if is_true (a_string_value) then
										an_option.set_debugger (True)
									elseif is_false (a_string_value) then
										an_option.set_debugger (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when document_code then
									an_option.set_document (a_string_value)
								when dynamic_runtime_code then
									if is_true (a_string_value) then
										an_option.set_dynamic_runtime (True)
									elseif is_false (a_string_value) then
										an_option.set_dynamic_runtime (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when exception_trace_code then
									if is_true (a_string_value) then
										an_option.set_exception_trace (True)
									elseif is_false (a_string_value) then
										an_option.set_exception_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when finalize_code then
									if is_true (a_string_value) then
										an_option.set_finalize (True)
									elseif is_false (a_string_value) then
										an_option.set_finalize (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when flat_fst_optimization_code then
									if is_true (a_string_value) then
										an_option.set_flat_fst_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_flat_fst_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when fst_expansion_factor_code then
									if STRING_.is_integer (a_string_value) then
										an_int := a_string_value.to_integer
										if an_int >= 0 then
											an_option.set_fst_expansion_factor (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when fst_optimization_code then
									if is_true (a_string_value) then
										an_option.set_fst_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_fst_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when garbage_collector_code then
									if an_option.valid_garbage_collector.has (a_string_value) then
										an_option.set_garbage_collector (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_garbage_collector, a_position_table.item (an_element))
									end
								when gc_info_code then
									if is_true (a_string_value) then
										an_option.set_gc_info (True)
									elseif is_false (a_string_value) then
										an_option.set_gc_info (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when heap_size_code then
									if STRING_.is_integer (a_string_value) then
										an_int := a_string_value.to_integer
										if an_int >= 0 then
											an_option.set_heap_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when inlining_code then
									if an_option.valid_inlining.has (a_string_value) then
										an_option.set_inlining (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_inlining, a_position_table.item (an_element))
									end
								when inlining_size_code then
									if STRING_.is_integer (a_string_value) then
										an_int := a_string_value.to_integer
										if an_int >= 0 then
											an_option.set_inlining_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when jumps_optimization_code then
									if is_true (a_string_value) then
										an_option.set_jumps_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_jumps_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when layout_optimization_code then
									if is_true (a_string_value) then
										an_option.set_layout_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_layout_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when leaves_optimization_code then
									if is_true (a_string_value) then
										an_option.set_leaves_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_leaves_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when line_generation_code then
									if is_true (a_string_value) then
										an_option.set_line_generation (True)
									elseif is_false (a_string_value) then
										an_option.set_line_generation (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when linker_code then
									if an_option.valid_linker.has (a_string_value) then
										an_option.set_linker (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_linker, a_position_table.item (an_element))
									end
								when linux_fpu_double_precision_code then
									if is_true (a_string_value) then
										an_option.set_linux_fpu_double_precision (True)
									elseif is_false (a_string_value) then
										an_option.set_linux_fpu_double_precision (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when manifest_string_trace_code then
									if is_true (a_string_value) then
										an_option.set_manifest_string_trace (True)
									elseif is_false (a_string_value) then
										an_option.set_manifest_string_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when map_code then
									if is_true (a_string_value) then
										an_option.set_map (True)
									elseif is_false (a_string_value) then
										an_option.set_map (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when multithreaded_code then
									if is_true (a_string_value) then
										an_option.set_multithreaded (True)
									elseif is_false (a_string_value) then
										an_option.set_multithreaded (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when no_default_lib_code then
									if is_true (a_string_value) then
										an_option.set_no_default_lib (True)
									elseif is_false (a_string_value) then
										an_option.set_no_default_lib (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when override_cluster_code then
									an_option.set_override_cluster (a_string_value)
								when portable_code_generation_code then
									if is_true (a_string_value) then
										an_option.set_portable_code_generation (True)
									elseif is_false (a_string_value) then
										an_option.set_portable_code_generation (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when precompiled_code then
									an_option.set_precompiled (a_string_value)
								when profile_code then
									if is_true (a_string_value) then
										an_option.set_profile (True)
									elseif is_false (a_string_value) then
										an_option.set_profile (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when reloads_optimization_code then
									if is_true (a_string_value) then
										an_option.set_reloads_optimization (True)
									elseif is_false (a_string_value) then
										an_option.set_reloads_optimization (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when shared_library_definition_code then
									an_option.set_shared_library_definition (a_string_value)
								when split_code then
									if is_true (a_string_value) then
										an_option.set_split (True)
									elseif is_false (a_string_value) then
										an_option.set_split (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when stack_size_code then
									if STRING_.is_integer (a_string_value) then
										an_int := a_string_value.to_integer
										if an_int >= 0 then
											an_option.set_stack_size (an_int)
										else
											error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
										end
									else
										error_handler.report_positive_integer_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when storable_filename_code then
									an_option.set_storable_filename (a_string_value)
								when strip_option_code then
									if is_true (a_string_value) then
										an_option.set_strip_option (True)
									elseif is_false (a_string_value) then
										an_option.set_strip_option (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when target_code then
									if an_option.valid_target.has (a_string_value) then
										an_option.set_target (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_target, a_position_table.item (an_element))
									end
								when trace_code then
									if is_true (a_string_value) then
										an_option.set_trace (True)
									elseif is_false (a_string_value) then
										an_option.set_trace (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when verbose_code then
									if is_true (a_string_value) then
										an_option.set_verbose (True)
									elseif is_false (a_string_value) then
										an_option.set_verbose (False)
									else
										error_handler.report_boolean_expected_error (an_element, uc_value, a_value, a_position_table.item (an_element))
									end
								when visible_filename_code then
									an_option.set_visible_filename (a_string_value)
								when warning_code then
									if an_option.valid_warning.has (a_string_value) then
										an_option.set_warning (a_string_value)
									else
										error_handler.report_wrong_attribute_value_error (an_element, uc_value, a_value, an_option.valid_warning, a_position_table.item (an_element))
									end
								when wedit_code then
									if is_true (a_string_value) then
										an_option.set_wedit (True)
									elseif is_false (a_string_value) then
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
					elseif a_child.name.is_equal (uc_option) then
						fill_options (an_option, a_child, a_position_table)
					elseif a_child.name.is_equal (uc_require) then
						!! a_warning.make ("Warning: <require> is obsolete, use <option name=%"assertion%" value=%"require%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_assertion (require_value)
								end
							end
						else
							an_option.set_assertion (require_value)
						end
					elseif a_child.name.is_equal (uc_ensure) then
						!! a_warning.make ("Warning: <ensure> is obsolete, use <option name=%"assertion%" value=%"ensure%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_assertion (ensure_value)
								end
							end
						else
							an_option.set_assertion (ensure_value)
						end
					elseif a_child.name.is_equal (uc_invariant) then
						!! a_warning.make ("Warning: <invariant> is obsolete, use <option name=%"assertion%" value=%"invariant%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_assertion (invariant_value)
								end
							end
						else
							an_option.set_assertion (invariant_value)
						end
					elseif a_child.name.is_equal (uc_loop) then
						!! a_warning.make ("Warning: <loop> is obsolete, use <option name=%"assertion%" value=%"loop_[in]variant%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_assertion (loop_invariant_value)
									an_option.set_assertion (loop_variant_value)
								end
							end
						else
							an_option.set_assertion (loop_invariant_value)
							an_option.set_assertion (loop_variant_value)
						end
					elseif a_child.name.is_equal (uc_check) then
						!! a_warning.make ("Warning: <check> is obsolete, use <option name=%"assertion%" value=%"check%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_assertion (check_value)
								end
							end
						else
							an_option.set_assertion (check_value)
						end
					elseif a_child.name.is_equal (uc_optimize) then
						!! a_warning.make ("Warning: <optimize> is obsolete, use <option name=%"finalize%" value=%"true%"/> instead%N" + a_position_table.item (a_child).out)
						error_handler.report_warning (a_warning)
						if a_child.has_attribute_by_name (uc_enable) then
							a_value := a_child.attribute_by_name (uc_enable).value
							if a_value /= Void then
								a_bool := a_value.to_utf8
								if is_true (a_bool) then
									an_option.set_finalize (True)
								end
							end
						else
							an_option.set_finalize (True)
						end
					elseif a_child.name.is_equal (uc_debug) then
						if a_child.has_attribute_by_name (uc_name) then
							a_value := a_child.attribute_by_name (uc_name).value
							if a_value /= Void then
								a_key := a_value.to_utf8
								!! a_warning.make ("Warning: <debug> is obsolete, use <option name=%"debug_tag%" value=%"" + a_key + "%"/> instead%N" + a_position_table.item (a_child).out)
								error_handler.report_warning (a_warning)
								if a_child.has_attribute_by_name (uc_enable) then
									a_value := a_child.attribute_by_name (uc_enable).value
									if a_value /= Void then
										a_bool := a_value.to_utf8
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
								a_value := a_child.attribute_by_name (uc_enable).value
								if a_value /= Void then
									a_bool := a_value.to_utf8
									if is_true (a_bool) then
										!! a_warning.make ("Warning: <debug> is obsolete, use <option name=%"debug%" value=%"true%"/> instead%N" + a_position_table.item (a_child).out)
										error_handler.report_warning (a_warning)
										an_option.set_debug_option (True)
									elseif is_false (a_bool) then
										!! a_warning.make ("Warning: <debug> is obsolete, use <option name=%"debug%" value=%"false%"/> instead%N" + a_position_table.item (a_child).out)
										error_handler.report_warning (a_warning)
										an_option.set_debug_option (False)
									else
										!! a_warning.make ("Warning: <debug> is obsolete, use <option name=%"debug%" value=%"true/false%"/> instead%N" + a_position_table.item (a_child).out)
										error_handler.report_warning (a_warning)
									end
								end
							else
								!! a_warning.make ("Warning: <debug> is obsolete, use <option name=%"debug%" value=%"true%"/> instead%N" + a_position_table.item (a_child).out)
								error_handler.report_warning (a_warning)
								an_option.set_debug_option (True)
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

invariant

	ast_factory_not_void: ast_factory /= Void
	error_handler_not_void: error_handler /= Void

end
