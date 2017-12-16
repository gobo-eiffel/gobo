note

	description:

		"Xace XML validators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_VALIDATOR

inherit

	ANY -- Export ANY's features

	ET_XACE_ELEMENT_NAMES
		export {NONE} all end

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	ET_SHARED_XACE_OPTION_NAMES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_error_handler: like error_handler)
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

	validate_system_doc (a_doc: XM_DOCUMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_doc' is a valid XML Xace system.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
		do
			has_error := False
			if STRING_.same_string (a_doc.root_element.name, uc_system) then
				validate_system (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_system, a_doc.root_element.position (a_position_table))
			end
		end

	validate_cluster_doc (a_doc: XM_DOCUMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_doc' is a valid XML Xace cluster.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
		do
			has_error := False
			if STRING_.same_string (a_doc.root_element.name, uc_cluster) then
				validate_named_cluster (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_cluster, a_doc.root_element.position (a_position_table))
			end
		end

	validate_library_doc (a_doc: XM_DOCUMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_doc' is a valid XML Xace library.
			-- Set `has_error' to True if not.
		require
			a_doc_not_void: a_doc /= Void
		do
			has_error := False
			if STRING_.same_string (a_doc.root_element.name, uc_library) then
				validate_library (a_doc.root_element, a_position_table)
			elseif STRING_.same_string (a_doc.root_element.name, uc_cluster) then
				validate_named_cluster (a_doc.root_element, a_position_table)
			else
				has_error := True
				error_handler.report_wrong_root_element_error (uc_library, a_doc.root_element.position (a_position_table))
			end
		end

feature {NONE} -- Validation

	validate_system (a_system: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_system' is a valid Xace 'system' element.
			-- Set `has_error' to True if not.
		require
			a_system_not_void: a_system /= Void
			a_system_is_system: STRING_.same_string (a_system.name, uc_system)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not a_system.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_system, uc_name, a_system.position (a_position_table))
			end
			if not attached a_system.element_by_name (uc_root) as l_root_element then
				has_error := True
				error_handler.report_missing_element_error (a_system, uc_root, a_system.position (a_position_table))
			else
				validate_root (l_root_element, a_position_table)
			end
			a_cursor := a_system.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_description) then
						-- OK.
				elseif STRING_.same_string (a_child.name, uc_root) then
						-- OK.
				elseif STRING_.same_string (a_child.name, uc_cluster) then
					if a_child.has_attribute_by_name (uc_name) then
						validate_named_cluster (a_child, a_position_table)
					else
							-- Old syntax.
						error_handler.report_obsolete_cluster_element_warning (a_child.position (a_position_table))
						validate_cluster (a_child, a_position_table)
					end
				elseif STRING_.same_string (a_child.name, uc_mount) then
					validate_mount (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_option) then
					validate_option (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_external) then
						-- Old syntax.
					error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"header/link/export%" ...>", a_child.position (a_position_table))
					validate_external (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_system, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_library (a_library: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_library' is a valid Xace 'library' element.
			-- Set `has_error' to True if not.
		require
			a_library_not_void: a_library /= Void
			a_library_is_library: STRING_.same_string (a_library.name, uc_library)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not a_library.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_library, uc_name, a_library.position (a_position_table))
			end
			a_cursor := a_library.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_description) then
						-- OK.
				elseif STRING_.same_string (a_child.name, uc_cluster) then
					validate_named_cluster (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_mount) then
					validate_mount (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_option) then
					validate_option (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_external) then
						-- Old syntax.
					error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"header/link/export%" ...>", a_child.position (a_position_table))
					validate_external (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_library, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_root (a_root: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_root' is a valid Xace 'root' element.
			-- Set `has_error' to True if not.
		require
			a_root_not_void: a_root /= Void
			a_root_is_root: STRING_.same_string (a_root.name, uc_root)
		do
			if not a_root.has_attribute_by_name (uc_class) then
				has_error := True
				error_handler.report_missing_attribute_error (a_root, uc_class, a_root.position (a_position_table))
			end
			if not a_root.has_attribute_by_name (uc_creation) then
				has_error := True
				error_handler.report_missing_attribute_error (a_root, uc_creation, a_root.position (a_position_table))
			end
		end

	validate_named_cluster (a_cluster: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_cluster' is a valid Xace 'cluster' element.
			-- Set `has_error' to True if not.
		require
			a_cluster_not_void: a_cluster /= Void
			a_cluster_is_cluster: STRING_.same_string (a_cluster.name, uc_cluster)
		do
			if not attached a_cluster.attribute_by_name (uc_name) as l_name_attribute then
				has_error := True
				error_handler.report_missing_attribute_error (a_cluster, uc_name, a_cluster.position (a_position_table))
			elseif l_name_attribute.value.count > 0 then
				validate_cluster (a_cluster, a_position_table)
			else
				has_error := True
				error_handler.report_non_empty_attribute_expected_error (a_cluster, uc_name, a_cluster.position (a_position_table))
			end
		end

	validate_cluster (a_cluster: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_cluster' is a valid Xace 'cluster' element.
			-- Set `has_error' to True if not.
		require
			a_cluster_not_void: a_cluster /= Void
			a_cluster_is_cluster: STRING_.same_string (a_cluster.name, uc_cluster)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			a_cursor := a_cluster.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_description) then
						-- OK.
				elseif STRING_.same_string (a_child.name, uc_cluster) then
					validate_named_cluster (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_mount) then
					validate_mount (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_option) then
					validate_option (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_class) then
					validate_class (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_external) then
						-- Old syntax.
					error_handler.report_element_obsoleted_by_element_warning (a_child, "<option name=%"header/link/export%" ...>", a_child.position (a_position_table))
					validate_external (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_cluster, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_class (a_class: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_class' is a valid Xace 'class' element.
			-- Set `has_error' to True if not.
		require
			a_class_not_void: a_class /= Void
			a_class_is_class: STRING_.same_string (a_class.name, uc_class)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not a_class.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_class, uc_name, a_class.position (a_position_table))
			end
			a_cursor := a_class.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_option) then
					validate_option (a_child, a_position_table)
				elseif STRING_.same_string (a_child.name, uc_feature) then
					validate_feature (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_class, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_feature (a_feature: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_feature' is a valid Xace 'feature' element.
			-- Set `has_error' to True if not.
		require
			a_feature_not_void: a_feature /= Void
			a_feature_is_feature: STRING_.same_string (a_feature.name, uc_feature)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not a_feature.has_attribute_by_name (uc_name) then
				has_error := True
				error_handler.report_missing_attribute_error (a_feature, uc_name, a_feature.position (a_position_table))
			end
			a_cursor := a_feature.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_option) then
					validate_option (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_feature, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_mount (a_mount: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `a_mount' is a valid Xace 'mount' element.
			-- Set `has_error' to True if not.
		require
			a_mount_not_void: a_mount /= Void
			a_mount_is_cluster: STRING_.same_string (a_mount.name, uc_mount)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not a_mount.has_attribute_by_name (uc_location) then
				has_error := True
				error_handler.report_missing_attribute_error (a_mount, uc_location, a_mount.position (a_position_table))
			end
			a_cursor := a_mount.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_exclude) then
					error_handler.report_obsolete_exclude_element_warning (a_child.position (a_position_table))
					validate_exclude (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (a_mount, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_option (an_option: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `an_option' is a valid Xace 'option' element.
			-- Set `has_error' to True if not.
		require
			an_option_not_void: an_option /= Void
			an_option_is_cluster: STRING_.same_string (an_option.name, uc_option)
		local
			has_name: BOOLEAN
			has_value: BOOLEAN
			a_name: STRING
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
			a_child_name: STRING
		do
			if attached an_option.attribute_by_name (uc_name) as l_name_attribute then
				has_name := True
				a_name := l_name_attribute.value
				if not options.option_codes.has (a_name) then
					error_handler.report_unknown_option_warning (an_option, an_option.position (a_position_table))
				end
			end
			if attached an_option.attribute_by_name (uc_value) then
				has_value := True
			end
			if has_name /= has_value then
				has_error := True
				if has_name then
					error_handler.report_missing_attribute_error (an_option, uc_value, an_option.position (a_position_table))
				else
					error_handler.report_missing_attribute_error (an_option, uc_name, an_option.position (a_position_table))
				end
			else
				a_cursor := an_option.new_cursor
				from a_cursor.start until a_cursor.after loop
					if not attached {XM_ELEMENT} a_cursor.item as a_child then
							-- Not an element. Ignore.
					else
						a_child_name := a_child.name
						if
							STRING_.same_string (a_child_name, uc_option) or
							STRING_.same_string (a_child_name, uc_require) or
							STRING_.same_string (a_child_name, uc_ensure) or
							STRING_.same_string (a_child_name, uc_invariant) or
							STRING_.same_string (a_child_name, uc_loop) or
							STRING_.same_string (a_child_name, uc_check) or
							STRING_.same_string (a_child_name, uc_debug) or
							STRING_.same_string (a_child_name, uc_optimize)
						then
							if has_name then
								has_error := True
								error_handler.report_unknown_element_error (an_option, a_child, a_child.position (a_position_table))
							elseif STRING_.same_string (a_child_name, uc_option) then
								validate_option (a_child, a_position_table)
							end
						else
							has_error := True
							error_handler.report_unknown_element_error (an_option, a_child, a_child.position (a_position_table))
						end
					end
					a_cursor.forth
				end
			end
		end

	validate_external (an_external: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `an_external' is a valid Xace 'external' element.
			-- Set `has_error' to True if not.
		require
			an_external_not_void: an_external /= Void
			an_external_is_cluster: STRING_.same_string (an_external.name, uc_external)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			a_cursor := an_external.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_include_dir) then
					if not a_child.has_attribute_by_name (uc_location) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_location, a_child.position (a_position_table))
					end
				elseif STRING_.same_string (a_child.name, uc_link_library) then
					if not a_child.has_attribute_by_name (uc_location) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_location, a_child.position (a_position_table))
					end
				elseif STRING_.same_string (a_child.name, uc_export) then
					validate_export (a_child, a_position_table)
				else
					has_error := True
					error_handler.report_unknown_element_error (an_external, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

	validate_exclude (an_exclude: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `an_exclude' is a valid Xace 'exclude' element.
			-- Set `has_error' to True if not.
		require
			an_exclude_not_void: an_exclude /= Void
			an_exclude_is_cluster: STRING_.same_string (an_exclude.name, uc_exclude)
		do
			if not an_exclude.has_attribute_by_name (uc_cluster) then
				has_error := True
				error_handler.report_missing_attribute_error (an_exclude, uc_cluster, an_exclude.position (a_position_table))
			end
		end

	validate_export (an_export: XM_ELEMENT; a_position_table: detachable XM_POSITION_TABLE)
			-- Check whether `an_export' is a valid Xace 'export' element.
			-- Set `has_error' to True if not.
		require
			an_export_not_void: an_export /= Void
			an_export_is_cluster: STRING_.same_string (an_export.name, uc_export)
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_NODE]
		do
			if not an_export.has_attribute_by_name (uc_class) then
				error_handler.report_missing_attribute_error (an_export, uc_class, an_export.position (a_position_table))
			end
			a_cursor := an_export.new_cursor
			from a_cursor.start until a_cursor.after loop
				if not attached {XM_ELEMENT} a_cursor.item as a_child then
						-- Not an element. Ignore.
				elseif STRING_.same_string (a_child.name, uc_feature) then
					if not a_child.has_attribute_by_name (uc_name) then
						has_error := True
						error_handler.report_missing_attribute_error (a_child, uc_name, a_child.position (a_position_table))
					end
				else
					has_error := True
					error_handler.report_unknown_element_error (an_export, a_child, a_child.position (a_position_table))
				end
				a_cursor.forth
			end
		end

invariant

	error_handler_not_void: error_handler /= Void

end
