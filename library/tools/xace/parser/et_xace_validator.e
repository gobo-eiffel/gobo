indexing

	description:

		"Xace XML validators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VALIDATOR

inherit

	ANY -- Export ANY's features

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

creation

	make

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler) is
			-- Create a new Xace XML validator.
		require
			an_error_handler_not_void: an_error_handler /= Void
		do
			error_handler := an_error_handler
		ensure
			error_handler_set: error_handler = an_error_handler
		end

feature -- Access

	error_handler: ET_XACE_ERROR_HANDLER
			-- Error handler

feature -- Status report

	has_error: BOOLEAN
			-- Has an error been detected during the
			-- last validation process?

feature -- Validation

	validate_system_doc (a_doc: XM_DOCUMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_doc' is a valid XML Xace system.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
			a_position_table_not_void: a_position_table /= Void
		do
			has_error := False
			if a_doc.root_element.name.is_equal (uc_system) then
				validate_system (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_system, a_position_table.item (a_doc.root_element))
			end
		end

	validate_cluster_doc (a_doc: XM_DOCUMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_doc' is a valid XML Xace cluster.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
			a_position_table_not_void: a_position_table /= Void
		do
			has_error := False
			if a_doc.root_element.name.is_equal (uc_cluster) then
				validate_named_cluster (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_cluster, a_position_table.item (a_doc.root_element))
			end
		end

	validate_library_doc (a_doc: XM_DOCUMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_doc' is a valid XML Xace library.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
			a_position_table_not_void: a_position_table /= Void
		do
			has_error := False
			if a_doc.root_element.name.is_equal (uc_library) then
				validate_library (a_doc.root_element, a_position_table)
			elseif a_doc.root_element.name.is_equal (uc_cluster) then
				validate_named_cluster (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_library, a_position_table.item (a_doc.root_element))
			end
		end

feature {NONE} -- Validation

	validate_system (a_system: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_system' is a valid Xace 'system' element.
			-- Set `has_error' to True if not.
		require
			a_system_not_void: a_system /= Void
			a_system_is_system: a_system.name.is_equal (uc_system)
			a_position_table_not_void: a_position_table /= Void
		local
			nb_clusters: INTEGER
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_warning: UT_MESSAGE
		do
			if not a_system.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_system, uc_name, a_position_table.item (a_system))
			end
			if not a_system.has_element_by_name (uc_root) then
				has_error := True
				error_handler.report_missing_element_error (a_system, uc_root, a_position_table.item (a_system))
			else
				validate_root (a_system.element_by_name (uc_root), a_position_table)
			end
			a_cursor := a_system.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child /= Void then
					if a_child.name.is_equal (uc_cluster) then
						nb_clusters := nb_clusters + 1
					elseif a_child.name.is_equal (uc_option) then
							-- New syntax.
						nb_clusters := 2
					elseif a_child.name.is_equal (uc_mount) then
							-- New syntax.
						nb_clusters := 2
					elseif a_child.name.is_equal (uc_external) then
							-- New syntax.
						nb_clusters := 2
					end
				end
				a_cursor.forth
			end
			if nb_clusters /= 1 then
					-- New syntax.
				a_cursor := a_system.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_child ?= a_cursor.item
					if a_child = Void then
							-- Not an element. Ignore.
					elseif a_child.name.is_equal (uc_description) then
							-- OK.
					elseif a_child.name.is_equal (uc_root) then
							-- OK.
					elseif a_child.name.is_equal (uc_cluster) then
						validate_named_cluster (a_child, a_position_table)
					elseif a_child.name.is_equal (uc_mount) then
						validate_mount (a_child, a_position_table)
					elseif a_child.name.is_equal (uc_option) then
						validate_option (a_child, a_position_table)
					elseif a_child.name.is_equal (uc_external) then
						validate_external (a_child, a_position_table)
					else
						has_error := True
						error_handler.report_unknown_element_error (a_system, a_child, a_position_table.item (a_child))
					end
					a_cursor.forth
				end
			else
					-- Old syntax.
				if not a_system.has_element_by_name (uc_cluster) then
					has_error := True
					error_handler.report_missing_element_error (a_system, uc_cluster, a_position_table.item (a_system))
				else
					a_child := a_system.element_by_name (uc_cluster)
					!! a_warning.make ("Warning: <cluster> is obsolete. Specify options, clusters and mounts directly under <system> instead%N" + a_position_table.item (a_child).out)
					error_handler.report_warning (a_warning)
					validate_cluster (a_child, a_position_table)
				end
			end
		end

	validate_library (a_library: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_library' is a valid Xace 'library' element.
			-- Set `has_error' to True if not.
		require
			a_library_not_void: a_library /= Void
			a_library_is_library: a_library.name.is_equal (uc_library)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
		do
			if not a_library.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_library, uc_name, a_position_table.item (a_library))
			end
			a_cursor := a_library.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child = Void then
						-- Not an element. Ignore.
				elseif a_child.name.is_equal (uc_description) then
						-- OK.
				elseif a_child.name.is_equal (uc_cluster) then
					validate_named_cluster (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_mount) then
					validate_mount (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_option) then
					validate_option (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_external) then
					validate_external (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_library, a_child, a_position_table.item (a_child))
				end
				a_cursor.forth
			end
		end

	validate_root (a_root: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_root' is a valid Xace 'root' element.
			-- Set `has_error' to True if not.
		require
			a_root_not_void: a_root /= Void
			a_root_is_root: a_root.name.is_equal (uc_root)
			a_position_table_not_void: a_position_table /= Void
		do
			if not a_root.has_attribute_by_name (uc_class) then
				has_error := True
				error_handler.report_missing_attribute_error (a_root, uc_class, a_position_table.item (a_root))
			end
			if not a_root.has_attribute_by_name (uc_creation) then
				has_error := True
				error_handler.report_missing_attribute_error (a_root, uc_creation, a_position_table.item (a_root))
			end
		end

	validate_named_cluster (a_cluster: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_cluster' is a valid Xace 'cluster' element.
			-- Set `has_error' to True if not.
		require
			a_cluster_not_void: a_cluster /= Void
			a_cluster_is_cluster: a_cluster.name.is_equal (uc_cluster)
			a_position_table_not_void: a_position_table /= Void
		do
			if not a_cluster.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_cluster, uc_name, a_position_table.item (a_cluster))
			end
			validate_cluster (a_cluster, a_position_table)
		end

	validate_cluster (a_cluster: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_cluster' is a valid Xace 'cluster' element.
			-- Set `has_error' to True if not.
		require
			a_cluster_not_void: a_cluster /= Void
			a_cluster_is_cluster: a_cluster.name.is_equal (uc_cluster)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
		do
			a_cursor := a_cluster.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child = Void then
						-- Not an element. Ignore.
				elseif a_child.name.is_equal (uc_description) then
						-- OK.
				elseif a_child.name.is_equal (uc_cluster) then
					validate_named_cluster (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_mount) then
					validate_mount (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_option) then
					validate_option (a_child, a_position_table)
				elseif a_child.name.is_equal (uc_external) then
					validate_external (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_cluster, a_child, a_position_table.item (a_child))
				end
				a_cursor.forth
			end
		end

	validate_mount (a_mount: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `a_mount' is a valid Xace 'mount' element.
			-- Set `has_error' to True if not.
		require
			a_mount_not_void: a_mount /= Void
			a_mount_is_cluster: a_mount.name.is_equal (uc_mount)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_warning: UT_MESSAGE
		do
			if not a_mount.has_attribute_by_name (uc_location) then
				has_error := True
				error_handler.report_missing_attribute_error (a_mount, uc_location, a_position_table.item (a_mount))
			end
			a_cursor := a_mount.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child = Void then
						-- Not an element. Ignore.
				elseif a_child.name.is_equal (uc_exclude) then
					!! a_warning.make ("Warning: <exclude> is obsolete, use if/unless attributes instead%N" + a_position_table.item (a_child).out)
					error_handler.report_warning (a_warning)
					validate_exclude (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_mount, a_child, a_position_table.item (a_child))
				end
				a_cursor.forth
			end
		end

	validate_option (an_option: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `an_option' is a valid Xace 'option' element.
			-- Set `has_error' to True if not.
		require
			an_option_not_void: an_option /= Void
			an_option_is_cluster: an_option.name.is_equal (uc_option)
			a_position_table_not_void: a_position_table /= Void
		local
			has_name: BOOLEAN
			has_value: BOOLEAN
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
			a_child_name: UC_STRING
		do
			has_name := an_option.has_attribute_by_name (uc_name)
			if has_name and then an_option.attribute_by_name (uc_name) = Void then
				has_error := True
				error_handler.report_missing_attribute_error (an_option, uc_name, a_position_table.item (an_option))
			end
			has_value := an_option.has_attribute_by_name (uc_value)
			if has_value and then an_option.attribute_by_name (uc_value) = Void then
				has_error := True
				error_handler.report_missing_attribute_error (an_option, uc_value, a_position_table.item (an_option))
			end
			if has_name /= has_value then
				has_error := True
				if has_name then
					error_handler.report_missing_attribute_error (an_option, uc_value, a_position_table.item (an_option))
				else
					error_handler.report_missing_attribute_error (an_option, uc_name, a_position_table.item (an_option))
				end
			else
				a_cursor := an_option.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_child ?= a_cursor.item
					if a_child = Void then
							-- Not an element. Ignore.
					else
						a_child_name := a_child.name
						if
							a_child_name.is_equal (uc_option) or
							a_child_name.is_equal (uc_require) or
							a_child_name.is_equal (uc_ensure) or
							a_child_name.is_equal (uc_invariant) or
							a_child_name.is_equal (uc_loop) or
							a_child_name.is_equal (uc_check) or
							a_child_name.is_equal (uc_debug) or
							a_child_name.is_equal (uc_optimize)
						then
							if has_name then
								has_error := True
								error_handler.report_unknown_element_error (an_option, a_child, a_position_table.item (a_child))
							elseif a_child_name.is_equal (uc_option) then
								validate_option (a_child, a_position_table)
							end
						else
							has_error := True
							error_handler.report_unknown_element_error (an_option, a_child, a_position_table.item (a_child))
						end
					end
					a_cursor.forth
				end
			end
		end

	validate_external (an_external: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `an_external' is a valid Xace 'external' element.
			-- Set `has_error' to True if not.
		require
			an_external_not_void: an_external /= Void
			an_external_is_cluster: an_external.name.is_equal (uc_external)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
		do
			a_cursor := an_external.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child = Void then
						-- Not an element. Ignore.
				elseif a_child.name.is_equal (uc_include_dir) then
					if not a_child.has_attribute_by_name (uc_location) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_location, a_position_table.item (a_child))
					end
				elseif a_child.name.is_equal (uc_link_library) then
					if not a_child.has_attribute_by_name (uc_location) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_location, a_position_table.item (a_child))
					end
				elseif a_child.name.is_equal (uc_export) then
					validate_export (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (an_external, a_child, a_position_table.item (a_child))
				end
				a_cursor.forth
			end
		end

	validate_exclude (an_exclude: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `an_exclude' is a valid Xace 'exclude' element.
			-- Set `has_error' to True if not.
		require
			an_exclude_not_void: an_exclude /= Void
			an_exclude_is_cluster: an_exclude.name.is_equal (uc_exclude)
			a_position_table_not_void: a_position_table /= Void
		do
			if not an_exclude.has_attribute_by_name (uc_cluster) then
				has_error := True
				error_handler.report_missing_attribute_error (an_exclude, uc_cluster, a_position_table.item (an_exclude))
			end
		end

	validate_export (an_export: XM_ELEMENT; a_position_table: XM_POSITION_TABLE) is
			-- Check whether `an_export' is a valid Xace 'export' element.
			-- Set `has_error' to True if not.
		require
			an_export_not_void: an_export /= Void
			an_export_is_cluster: an_export.name.is_equal (uc_export)
			a_position_table_not_void: a_position_table /= Void
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child: XM_ELEMENT
		do
			if not an_export.has_attribute_by_name (uc_class) then
				error_handler.report_missing_attribute_error (an_export, uc_class, a_position_table.item (an_export))
			end
			a_cursor := an_export.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_child ?= a_cursor.item
				if a_child = Void then
						-- Not an element. Ignore.
				elseif a_child.name.is_equal (uc_feature) then
					if not a_child.has_attribute_by_name (uc_name) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_name, a_position_table.item (a_child))
					end
				else
					has_error := True
					error_handler.report_unknown_element_error (an_export, a_child, a_position_table.item (a_child))
				end
				a_cursor.forth
			end
		end

invariant

	error_handler_not_void: error_handler /= Void

end
