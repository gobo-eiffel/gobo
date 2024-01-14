note

	description:

		"ECF Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2019, Eric Bezault and others"
	license: "MIT License"

class ET_ECF_AST_FACTORY

inherit

	ANY

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_action (a_command_name: STRING): ET_ECF_ACTION
			-- New action
		require
			a_command_name_not_void: a_command_name /= Void
		do
			create Result.make (a_command_name)
		ensure
			action_not_void: Result /= Void
		end

	new_actions: DS_ARRAYED_LIST [ET_ECF_ACTION]
			-- New actions
		do
			create Result.make (10)
		ensure
			actions_not_void: Result /= Void
		end

	new_adapted_dotnet_assembly (a_name, a_filename: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_target: ET_ECF_TARGET): ET_ECF_ADAPTED_DOTNET_ASSEMBLY
			-- New adpated .NET assembly
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			create Result.make (a_name, a_filename, a_universe, a_target)
		ensure
			adapted_dotnet_assembly_not_void: Result /= Void
		end

	new_adapted_dotnet_assemblies (a_dotnet_assembly: ET_ECF_ADAPTED_DOTNET_ASSEMBLY): ET_ECF_ADAPTED_DOTNET_ASSEMBLIES
			-- New adapted .NET assembly list
		require
			a_dotnet_assembly_not_void: a_dotnet_assembly /= Void
		do
			create Result.make (a_dotnet_assembly)
		ensure
			adapted_dotnet_assemblies_not_void: Result /= Void
		end

	new_adapted_library (a_name, a_filename: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_target: ET_ECF_TARGET): ET_ECF_ADAPTED_LIBRARY
			-- New adpated library
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			create Result.make (a_name, a_filename, a_universe, a_target)
		ensure
			adapted_library_not_void: Result /= Void
		end

	new_adapted_libraries (a_library: ET_ECF_ADAPTED_LIBRARY): ET_ECF_ADAPTED_LIBRARIES
			-- New adapted library list
		require
			a_library_not_void: a_library /= Void
		do
			create Result.make (a_library)
		ensure
			adapted_libraries_not_void: Result /= Void
		end

	new_adapted_precompiled_library (a_name, a_filename: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_target: ET_ECF_TARGET): ET_ECF_ADAPTED_PRECOMPILED_LIBRARY
			-- New adapted precompiled library
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			create Result.make (a_name, a_filename, a_universe, a_target)
		ensure
			adapted_library_not_void: Result /= Void
		end

	new_anded_conditions: ET_ECF_ANDED_CONDITIONS
			-- New and-ed condition list
		do
			create Result.make_empty
		ensure
			anded_conditions_not_void: Result /= Void
		end

	new_build_condition (a_value: STRING; a_excluded: BOOLEAN): ET_ECF_BUILD_CONDITION
			-- New build condition
		do
			if a_excluded then
				create Result.make_excluded (a_value)
			else
				create Result.make (a_value)
			end
		ensure
			condition_not_void: Result /= Void
		end

	new_class_mappings: DS_HASH_TABLE [STRING, STRING]
			-- New class mappings
		do
			create Result.make_map (10)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
		ensure
			class_mappings_not_void: Result /= Void
		end

	new_class_options: DS_HASH_TABLE [ET_ECF_OPTIONS, STRING]
			-- New class options
		do
			create Result.make_map (10)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
		ensure
			class_options_not_void: Result /= Void
		end

	new_class_renamings: DS_HASH_TABLE [STRING, STRING]
			-- New class renamings
		do
			create Result.make_map (10)
			Result.set_key_equality_tester (case_insensitive_string_equality_tester)
		ensure
			class_renamings_not_void: Result /= Void
		end

	new_cluster (a_name, a_pathname: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE; a_target: ET_ECF_TARGET): ET_ECF_CLUSTER
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_pathname_not_void: a_pathname /= Void
			a_universe_not_void: a_universe /= Void
			a_target_not_void: a_target /= Void
		do
			create Result.make (a_name, a_pathname, a_universe, a_target)
		ensure
			cluster_not_void: Result /= Void
		end

	new_clusters (a_cluster: ET_ECF_CLUSTER): ET_ECF_CLUSTERS
			-- New cluster list
		require
			a_cluster_not_void: a_cluster /= Void
		do
			create Result.make (a_cluster)
		ensure
			clusters_not_void: Result /= Void
		end

	new_concurrency_condition (a_value: STRING; a_excluded: BOOLEAN): ET_ECF_CONCURRENCY_CONDITION
			-- New concurrency condition
		do
			if a_excluded then
				create Result.make_excluded (a_value)
			else
				create Result.make (a_value)
			end
		ensure
			condition_not_void: Result /= Void
		end

	new_custom_condition (a_name, a_value: STRING; a_match: detachable STRING; a_excluded: BOOLEAN): ET_ECF_CUSTOM_CONDITION
			-- New custom condition
		do
			if a_excluded then
				create Result.make_excluded (a_name, a_value, a_match)
			else
				create Result.make (a_name, a_value, a_match)
			end
		ensure
			condition_not_void: Result /= Void
		end

	new_dotnet_assembly (a_name, a_filename: STRING; a_system: ET_SYSTEM): ET_ECF_DOTNET_ASSEMBLY
			-- New .NET assembly
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_name, a_filename, a_system)
		ensure
			dotnet_assembly_not_void: Result /= Void
		end

	new_dotnet_condition (a_value: BOOLEAN): ET_ECF_DOTNET_CONDITION
			-- New dotnet condition
		do
			create Result.make (a_value)
		ensure
			condition_not_void: Result /= Void
		end

	new_dynamic_runtime_condition (a_value: BOOLEAN): ET_ECF_DYNAMIC_RUNTIME_CONDITION
			-- New dynamic_runtime condition
		do
			create Result.make (a_value)
		ensure
			condition_not_void: Result /= Void
		end

	new_external_cflag (a_flag: STRING): ET_ECF_EXTERNAL_CFLAG
			-- New external C flag
		require
			a_flag_not_void: a_flag /= Void
		do
			create Result.make (a_flag)
		ensure
			external_cflag_not_void: Result /= Void
		end

	new_external_cflags (a_external_cflag: ET_ECF_EXTERNAL_CFLAG): ET_ECF_EXTERNAL_CFLAGS
			-- New external C flag list
		require
			a_external_cflag_not_void: a_external_cflag /= Void
		do
			create Result.make (a_external_cflag)
		ensure
			external_cflags_not_void: Result /= Void
		end

	new_external_include (a_pathname: STRING): ET_ECF_EXTERNAL_INCLUDE
			-- New external include
		require
			a_pathname_not_void: a_pathname /= Void
		do
			create Result.make (a_pathname)
		ensure
			external_include_not_void: Result /= Void
		end

	new_external_includes (a_external_include: ET_ECF_EXTERNAL_INCLUDE): ET_ECF_EXTERNAL_INCLUDES
			-- New external include list
		require
			a_external_include_not_void: a_external_include /= Void
		do
			create Result.make (a_external_include)
		ensure
			external_includes_not_void: Result /= Void
		end

	new_external_library (a_pathname: STRING): ET_ECF_EXTERNAL_LIBRARY
			-- New external library
		require
			a_pathname_not_void: a_pathname /= Void
		do
			create Result.make (a_pathname)
		ensure
			external_library_not_void: Result /= Void
		end

	new_external_libraries (a_external_library: ET_ECF_EXTERNAL_LIBRARY): ET_ECF_EXTERNAL_LIBRARIES
			-- New external library list
		require
			a_external_library_not_void: a_external_library /= Void
		do
			create Result.make (a_external_library)
		ensure
			external_libraries_not_void: Result /= Void
		end

	new_external_linker_flag (a_flag: STRING): ET_ECF_EXTERNAL_LINKER_FLAG
			-- New external linker flag
		require
			a_flag_not_void: a_flag /= Void
		do
			create Result.make (a_flag)
		ensure
			external_linker_flag_not_void: Result /= Void
		end

	new_external_linker_flags (a_external_linker_flag: ET_ECF_EXTERNAL_LINKER_FLAG): ET_ECF_EXTERNAL_LINKER_FLAGS
			-- New external C flag list
		require
			a_external_linker_flag_not_void: a_external_linker_flag /= Void
		do
			create Result.make (a_external_linker_flag)
		ensure
			external_linker_flags_not_void: Result /= Void
		end

	new_external_make (a_pathname: STRING): ET_ECF_EXTERNAL_MAKE
			-- New external make
		require
			a_pathname_not_void: a_pathname /= Void
		do
			create Result.make (a_pathname)
		ensure
			external_make_not_void: Result /= Void
		end

	new_external_makes (a_external_make: ET_ECF_EXTERNAL_MAKE): ET_ECF_EXTERNAL_MAKES
			-- New external make list
		require
			a_external_make_not_void: a_external_make /= Void
		do
			create Result.make (a_external_make)
		ensure
			external_makes_not_void: Result /= Void
		end

	new_external_object (a_pathname: STRING): ET_ECF_EXTERNAL_OBJECT
			-- New external object
		require
			a_pathname_not_void: a_pathname /= Void
		do
			create Result.make (a_pathname)
		ensure
			external_object_not_void: Result /= Void
		end

	new_external_objects (a_external_object: ET_ECF_EXTERNAL_OBJECT): ET_ECF_EXTERNAL_OBJECTS
			-- New external object list
		require
			a_external_object_not_void: a_external_object /= Void
		do
			create Result.make (a_external_object)
		ensure
			external_objects_not_void: Result /= Void
		end

	new_external_resource (a_pathname: STRING): ET_ECF_EXTERNAL_RESOURCE
			-- New external resource
		require
			a_pathname_not_void: a_pathname /= Void
		do
			create Result.make (a_pathname)
		ensure
			external_resource_not_void: Result /= Void
		end

	new_external_resources (a_external_resource: ET_ECF_EXTERNAL_RESOURCE): ET_ECF_EXTERNAL_RESOURCES
			-- New external resource list
		require
			a_external_resource_not_void: a_external_resource /= Void
		do
			create Result.make (a_external_resource)
		ensure
			external_resources_not_void: Result /= Void
		end

	new_file_rule (a_exclude, a_include: detachable DS_HASH_SET [STRING]): ET_ECF_FILE_RULE
			-- New file rule
		require
			no_void_exclude: a_exclude /= Void implies not a_exclude.has_void
			no_void_include: a_include /= Void implies not a_include.has_void
		do
			create Result.make (a_exclude, a_include)
		ensure
			file_rule_not_void: Result /= Void
		end

	new_file_rules (a_file_rule: ET_ECF_FILE_RULE): ET_ECF_FILE_RULES
			-- New file rule list
		require
			a_file_rule_not_void: a_file_rule /= Void
		do
			create Result.make (a_file_rule)
		ensure
			file_rules_not_void: Result /= Void
		end

	new_library (a_name, a_filename: STRING; a_system: ET_SYSTEM): ET_ECF_LIBRARY
			-- New ECF library
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
			a_system_not_void: a_system /= Void
		do
			create Result.make (a_name, a_filename, a_system)
		ensure
			library_not_void: Result /= Void
		end

	new_note (a_name: STRING): ET_ECF_NOTE_ELEMENT
			-- New note element
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
		do
			create Result.make (a_name)
		ensure
			note_not_void: Result /= Void
		end

	new_notes: DS_ARRAYED_LIST [ET_ECF_NOTE_ELEMENT]
			-- New note elements
		do
			create Result.make (10)
		ensure
			notes_not_void: Result /= Void
		end

	new_options: ET_ECF_OPTIONS
			-- New options
		do
			create Result.make
		ensure
			options_not_void: Result /= Void
		end

	new_ored_conditions (a_conditions: ET_ECF_ANDED_CONDITIONS): ET_ECF_ORED_CONDITIONS
			-- New or-ed condition list
		require
			a_conditions_not_void: a_conditions /= Void
		do
			create Result.make (a_conditions)
		ensure
			ored_conditions_not_void: Result /= Void
		end

	new_platform_condition (a_value: STRING; a_excluded: BOOLEAN): ET_ECF_PLATFORM_CONDITION
			-- New platform condition
		do
			if a_excluded then
				create Result.make_excluded (a_value)
			else
				create Result.make (a_value)
			end
		ensure
			condition_not_void: Result /= Void
		end

	new_provider_groups: DS_ARRAYED_LIST [STRING]
			-- New provider groups
		do
			create Result.make (10)
		ensure
			provider_groups_not_void: Result /= Void
		end

	new_redirection_config (a_location, a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_REDIRECTION_CONFIG
			-- New redirection config
		require
			a_location_not_void: a_location /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_location, a_filename, a_universe)
		ensure
			redirection_config_not_void: Result /= Void
		end

	new_root_all_classes: ET_ECF_ROOT_ALL_CLASSES
			-- New all classes root
		do
			create Result.make
		ensure
			root_all_classes_not_void: Result /= Void
		end

	new_root_class (a_class_name: ET_IDENTIFIER): ET_ECF_ROOT_CLASS
			-- New root with `a_class_name' as root class name
		require
			a_class_name_not_void: a_class_name /= Void
		do
			create Result.make (a_class_name)
		ensure
			root_class_not_void: Result /= Void
		end

	new_system (a_name, a_filename: STRING): ET_ECF_SYSTEM
			-- New system
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
		do
			create Result.make (a_name, a_filename)
		ensure
			system_not_void: Result /= Void
		end

	new_system_config (a_name, a_filename: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_SYSTEM_CONFIG
			-- New system config
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: not a_name.is_empty
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_filename, a_universe)
		ensure
			system_config_not_void: Result /= Void
		end

	new_target (a_name: STRING; a_system_config: ET_ECF_SYSTEM_CONFIG): ET_ECF_TARGET
			-- New target
		require
			a_name_not_void: a_name /= Void
			a_system_config_not_void: a_system_config /= Void
		do
			create Result.make (a_name, a_system_config)
		ensure
			target_not_void: Result /= Void
		end

	new_targets (a_target: ET_ECF_TARGET): ET_ECF_TARGETS
			-- New target list
		require
			a_target_not_void: a_target /= Void
		do
			create Result.make (a_target)
		ensure
			targets_not_void: Result /= Void
		end

	new_visible_class (a_class_name: STRING): ET_ECF_VISIBLE_CLASS
			-- New visible class
		require
			a_class_name_not_void: a_class_name /= Void
		do
			create Result.make (a_class_name)
		ensure
			visible_class_not_void: Result /= Void
		end

	new_visible_classes: DS_ARRAYED_LIST [ET_ECF_VISIBLE_CLASS]
			-- New visible classes
		do
			create Result.make (10)
		ensure
			visible_classes_not_void: Result /= Void
		end

	new_void_safety_condition (a_value: STRING; a_excluded: BOOLEAN): ET_ECF_VOID_SAFETY_CONDITION
			-- New void-safety condition
		do
			if a_excluded then
				create Result.make_excluded (a_value)
			else
				create Result.make (a_value)
			end
		ensure
			condition_not_void: Result /= Void
		end

end
