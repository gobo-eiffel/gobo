note

	description:

		"Xace XML element names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2019, Andreas Leitner and others"
	license: "MIT License"

class ET_XACE_ELEMENT_NAMES

obsolete

	"Use ET_ECF_* classes instead. [2019-03-17]"

feature -- Constants

	uc_system: STRING
			-- "system" element name
		once
			Result := "system"
		ensure
			uc_system_not_void: Result /= Void
			uc_system_not_empty: Result.count > 0
		end

	uc_root: STRING
			-- "root" element name
		once
			Result := "root"
		ensure
			uc_root_not_void: Result /= Void
			uc_root_not_empty: Result.count > 0
		end

	uc_class: STRING
			-- "class" element/attribute name
		once
			Result := "class"
		ensure
			uc_class_not_void: Result /= Void
			uc_class_not_empty: Result.count > 0
		end

	uc_creation: STRING
			-- "creation" attribute name
		once
			Result := "creation"
		ensure
			uc_creation_not_void: Result /= Void
			uc_creation_not_empty: Result.count > 0
		end

	uc_library: STRING
			-- "library" element name
		once
			Result := "library"
		ensure
			uc_library_not_void: Result /= Void
			uc_library_not_empty: Result.count > 0
		end

	uc_cluster: STRING
			-- "cluster" element name
		once
			Result := "cluster"
		ensure
			uc_cluster_not_void: Result /= Void
			uc_cluster_not_empty: Result.count > 0
		end

	uc_name: STRING
			-- "name" attribute name
		once
			Result := "name"
		ensure
			uc_name_not_void: Result /= Void
			uc_name_not_empty: Result.count > 0
		end

	uc_value: STRING
			-- "value" attribute name
		once
			Result := "value"
		ensure
			uc_value_not_void: Result /= Void
			uc_value_not_empty: Result.count > 0
		end

	uc_abstract: STRING
			-- "abstract" attribute name
		once
			Result := "abstract"
		ensure
			uc_abstract_not_void: Result /= Void
			uc_abstract_not_empty: Result.count > 0
		end

	uc_relative: STRING
			-- "relative" attribute name
		once
			Result := "relative"
		ensure
			uc_relative_not_void: Result /= Void
			uc_relative_not_empty: Result.count > 0
		end

	uc_mount: STRING
			-- "mount" element name
		once
			Result := "mount"
		ensure
			uc_mount_not_void: Result /= Void
			uc_mount_not_empty: Result.count > 0
		end

	uc_location: STRING
			-- "location" attribute name
		once
			Result := "location"
		ensure
			uc_location_not_void: Result /= Void
			uc_location_not_empty: Result.count > 0
		end

	uc_prefix: STRING
			-- "prefix" attribute name
		once
			Result := "prefix"
		ensure
			uc_prefix_not_void: Result /= Void
			uc_prefix_not_empty: Result.count > 0
		end

	uc_description: STRING
			-- "description" element name
		once
			Result := "description"
		ensure
			uc_description_not_void: Result /= Void
			uc_description_not_empty: Result.count > 0
		end

	uc_option: STRING
			-- "option" element name
		once
			Result := "option"
		ensure
			uc_option_not_void: Result /= Void
			uc_option_not_empty: Result.count > 0
		end

	uc_external: STRING
			-- "external" element name
		once
			Result := "external"
		ensure
			uc_external_not_void: Result /= Void
			uc_external_not_empty: Result.count > 0
		end

	uc_enable: STRING
			-- "enable" attribute name
		once
			Result := "enable"
		ensure
			uc_enable_not_void: Result /= Void
			uc_enable_not_empty: Result.count > 0
		end

	uc_require: STRING
			-- "require" element name
		once
			Result := "require"
		ensure
			uc_require_not_void: Result /= Void
			uc_require_not_empty: Result.count > 0
		end

	uc_ensure: STRING
			-- "ensure" element name
		once
			Result := "ensure"
		ensure
			uc_ensure_not_void: Result /= Void
			uc_ensure_not_empty: Result.count > 0
		end

	uc_invariant: STRING
			-- "invariant" element name
		once
			Result := "invariant"
		ensure
			uc_invariant_not_void: Result /= Void
			uc_invariant_not_empty: Result.count > 0
		end

	uc_loop: STRING
			-- "loop" element name
		once
			Result := "loop"
		ensure
			uc_loop_not_void: Result /= Void
			uc_loop_not_empty: Result.count > 0
		end

	uc_check: STRING
			-- "check" element name
		once
			Result := "check"
		ensure
			uc_check_not_void: Result /= Void
			uc_check_not_empty: Result.count > 0
		end

	uc_debug: STRING
			-- "debug" element name
		once
			Result := "debug"
		ensure
			uc_debug_not_void: Result /= Void
			uc_debug_not_empty: Result.count > 0
		end

	uc_optimize: STRING
			-- "optimize" element name
		once
			Result := "optimize"
		ensure
			uc_optimize_not_void: Result /= Void
			uc_optimize_not_empty: Result.count > 0
		end

	uc_include_dir: STRING
			-- "include_dir" element name
		once
			Result := "include_dir"
		ensure
			uc_include_dir_not_void: Result /= Void
			uc_include_dir_not_empty: Result.count > 0
		end

	uc_export: STRING
			-- "export" element name
		once
			Result := "export"
		ensure
			uc_export_not_void: Result /= Void
			uc_export_not_empty: Result.count > 0
		end

	uc_alias: STRING
			-- "alias" attribute name
		once
			Result := "alias"
		ensure
			uc_alias_not_void: Result /= Void
			uc_alias_not_empty: Result.count > 0
		end

	uc_feature: STRING
			-- "feature" element name
		once
			Result := "feature"
		ensure
			uc_feature_not_void: Result /= Void
			uc_feature_not_empty: Result.count > 0
		end

	uc_link_library: STRING
			-- "link_library" element name
		once
			Result := "link_library"
		ensure
			uc_link_library_not_void: Result /= Void
			uc_link_library_not_empty: Result.count > 0
		end

	uc_exclude: STRING
			-- "exclude" element name
		once
			Result := "exclude"
		ensure
			uc_exclude_not_void: Result /= Void
			uc_exclude_not_empty: Result.count > 0
		end

	uc_if: STRING
			-- "if" attribute name
		once
			Result := "if"
		ensure
			uc_if_not_void: Result /= Void
			uc_if_not_empty: Result.count > 0
		end

	uc_unless: STRING
			-- "unless" attribute name
		once
			Result := "unless"
		ensure
			uc_unless_not_void: Result /= Void
			uc_unless_not_empty: Result.count > 0
		end

	uc_target: STRING
			-- "target" element name
		once
			Result := "target"
		ensure
			uc_target_not_void: Result /= Void
			uc_target_not_empty: Result.count > 0
		end

end
