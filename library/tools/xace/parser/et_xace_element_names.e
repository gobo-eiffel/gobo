indexing

	description:

		"Xace XML element names"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_ELEMENT_NAMES

inherit

	ANY

	UC_UNICODE_FACTORY
		export {NONE} all end

feature -- Constants

	uc_system: UC_STRING is
			-- "system" element name
		once
			Result := new_unicode_string ("system")
		ensure
			uc_system_not_void: Result /= Void
			uc_system_not_empty: Result.count > 0
		end

	uc_root: UC_STRING is
			-- "root" element name
		once
			Result := new_unicode_string ("root")
		ensure
			uc_root_not_void: Result /= Void
			uc_root_not_empty: Result.count > 0
		end

	uc_class: UC_STRING is
			-- "class" attribute name
		once
			Result := new_unicode_string ("class")
		ensure
			uc_class_not_void: Result /= Void
			uc_class_not_empty: Result.count > 0
		end

	uc_creation: UC_STRING is
			-- "creation" attribute name
		once
			Result := new_unicode_string ("creation")
		ensure
			uc_creation_not_void: Result /= Void
			uc_creation_not_empty: Result.count > 0
		end

	uc_cluster: UC_STRING is
			-- "cluster" element name
		once
			Result := new_unicode_string ("cluster")
		ensure
			uc_cluster_not_void: Result /= Void
			uc_cluster_not_empty: Result.count > 0
		end

	uc_name: UC_STRING is
			-- "name" attribute name
		once
			Result := new_unicode_string ("name")
		ensure
			uc_name_not_void: Result /= Void
			uc_name_not_empty: Result.count > 0
		end

	uc_abstract: UC_STRING is
			-- "abstract" attribute name
		once
			Result := new_unicode_string ("abstract")
		ensure
			uc_abstract_not_void: Result /= Void
			uc_abstract_not_empty: Result.count > 0
		end

	uc_mount: UC_STRING is
			-- "mount" element name
		once
			Result := new_unicode_string ("mount")
		ensure
			uc_mount_not_void: Result /= Void
			uc_mount_not_empty: Result.count > 0
		end

	uc_location: UC_STRING is
			-- "location" attribute name
		once
			Result := new_unicode_string ("location")
		ensure
			uc_location_not_void: Result /= Void
			uc_location_not_empty: Result.count > 0
		end

	uc_description: UC_STRING is
			-- "description" element name
		once
			Result := new_unicode_string ("description")
		ensure
			uc_description_not_void: Result /= Void
			uc_description_not_empty: Result.count > 0
		end

	uc_option: UC_STRING is
			-- "option" element name
		once
			Result := new_unicode_string ("option")
		ensure
			uc_option_not_void: Result /= Void
			uc_option_not_empty: Result.count > 0
		end

	uc_external: UC_STRING is
			-- "external" element name
		once
			Result := new_unicode_string ("external")
		ensure
			uc_external_not_void: Result /= Void
			uc_external_not_empty: Result.count > 0
		end

	uc_enable: UC_STRING is
			-- "enable" attribute name
		once
			Result := new_unicode_string ("enable")
		ensure
			uc_enable_not_void: Result /= Void
			uc_enable_not_empty: Result.count > 0
		end

	uc_require: UC_STRING is
			-- "require" element name
		once
			Result := new_unicode_string ("require")
		ensure
			uc_require_not_void: Result /= Void
			uc_require_not_empty: Result.count > 0
		end

	uc_ensure: UC_STRING is
			-- "ensure" element name
		once
			Result := new_unicode_string ("ensure")
		ensure
			uc_ensure_not_void: Result /= Void
			uc_ensure_not_empty: Result.count > 0
		end

	uc_invariant: UC_STRING is
			-- "invariant" element name
		once
			Result := new_unicode_string ("invariant")
		ensure
			uc_invariant_not_void: Result /= Void
			uc_invariant_not_empty: Result.count > 0
		end

	uc_loop: UC_STRING is
			-- "loop" element name
		once
			Result := new_unicode_string ("loop")
		ensure
			uc_loop_not_void: Result /= Void
			uc_loop_not_empty: Result.count > 0
		end

	uc_check: UC_STRING is
			-- "check" element name
		once
			Result := new_unicode_string ("check")
		ensure
			uc_check_not_void: Result /= Void
			uc_check_not_empty: Result.count > 0
		end

	uc_debug: UC_STRING is
			-- "debug" element name
		once
			Result := new_unicode_string ("debug")
		ensure
			uc_debug_not_void: Result /= Void
			uc_debug_not_empty: Result.count > 0
		end

	uc_optimize: UC_STRING is
			-- "optimize" element name
		once
			Result := new_unicode_string ("optimize")
		ensure
			uc_optimize_not_void: Result /= Void
			uc_optimize_not_empty: Result.count > 0
		end

	uc_link_dir: UC_STRING is
			-- "link_dir" element name
		once
			Result := new_unicode_string ("link_dir")
		ensure
			uc_link_dir_not_void: Result /= Void
			uc_link_dir_not_empty: Result.count > 0
		end

	uc_include_dir: UC_STRING is
			-- "include_dir" element name
		once
			Result := new_unicode_string ("include_dir")
		ensure
			uc_include_dir_not_void: Result /= Void
			uc_include_dir_not_empty: Result.count > 0
		end

	uc_export: UC_STRING is
			-- "export" element name
		once
			Result := new_unicode_string ("export")
		ensure
			uc_export_not_void: Result /= Void
			uc_export_not_empty: Result.count > 0
		end

	uc_alias: UC_STRING is
			-- "alias" attribute name
		once
			Result := new_unicode_string ("alias")
		ensure
			uc_alias_not_void: Result /= Void
			uc_alias_not_empty: Result.count > 0
		end

	uc_feature: UC_STRING is
			-- "feature" element name
		once
			Result := new_unicode_string ("feature")
		ensure
			uc_feature_not_void: Result /= Void
			uc_feature_not_empty: Result.count > 0
		end

	uc_link_library: UC_STRING is
			-- "link_library" element name
		once
			Result := new_unicode_string ("link_library")
		ensure
			uc_link_library_not_void: Result /= Void
			uc_link_library_not_empty: Result.count > 0
		end

	uc_exclude: UC_STRING is
			-- "exclude" element name
		once
			Result := new_unicode_string ("exclude")
		ensure
			uc_exclude_not_void: Result /= Void
			uc_exclude_not_empty: Result.count > 0
		end

	uc_if: UC_STRING is
			-- "if" attribute name
		once
			Result := new_unicode_string ("if")
		ensure
			uc_if_not_void: Result /= Void
			uc_if_not_empty: Result.count > 0
		end

	uc_unless: UC_STRING is
			-- "unless" attribute name
		once
			Result := new_unicode_string ("unless")
		ensure
			uc_unless_not_void: Result /= Void
			uc_unless_not_empty: Result.count > 0
		end

	uc_equal: UC_CHARACTER is
			-- '=', which may occure in "if" or "unless"
			-- attributes
		once
			Result := new_unicode_character ('=')
		ensure
			uc_equal_not_void: Result /= Void
		end

	uc_dollar: UC_CHARACTER is
			-- '$', which occures in variable names
		once
			Result := new_unicode_character ('$')
		ensure
			uc_dollar_not_void: Result /= Void
		end

	uc_opening_curly_brace: UC_CHARACTER is
			-- '{', which may occure in variable names
		once
			Result := new_unicode_character ('{')
		ensure
			uc_opening_curly_brace_not_void: Result /= Void
		end

	uc_closing_curly_brace: UC_CHARACTER is
			-- '}', which may occure in variable names
		once
			Result := new_unicode_character ('}')
		ensure
			uc_closing_curly_brace_not_void: Result /= Void
		end

end -- class ET_XACE_ELEMENT_NAMES
