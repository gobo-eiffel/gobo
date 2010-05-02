note

	description:

		"ECF Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_AST_FACTORY

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new AST factory.
		do
		end

feature -- AST factory

	new_adapted_library (a_name, a_filename: ET_IDENTIFIER; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_ADAPTED_LIBRARY
			-- New adpated library
		require
			a_name_not_void: a_name /= Void
			a_filename_not_void: a_filename /= Void
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_filename, a_universe)
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

	new_cluster (a_name, a_pathname: STRING; a_universe: ET_ECF_INTERNAL_UNIVERSE): ET_ECF_CLUSTER
			-- New cluster
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_universe_not_void: a_universe /= Void
		do
			create Result.make (a_name, a_pathname, a_universe)
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

	new_condition: ET_ECF_CONDITIONS
			-- New condition
		do
			create Result.make_anded_empty
		ensure
			condition_not_void: Result /= Void
			condition_anded: not Result.is_ored
		end

	new_conditions (a_condition: ET_ECF_CONDITIONS): ET_ECF_CONDITIONS
			-- New condition list
		require
			a_condition_not_void: a_condition /= Void
		do
			create Result.make_ored (a_condition)
		ensure
			conditions_not_void: Result /= Void
			conditions_ored: Result.is_ored
		end

	new_custom_condition (a_name, a_value: STRING; a_excluded: BOOLEAN): ET_ECF_CUSTOM_CONDITION
			-- New custom condition
		do
			if a_excluded then
				create Result.make_excluded (a_name, a_value)
			else
				create Result.make (a_name, a_value)
			end
		ensure
			condition_not_void: Result /= Void
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

	new_file_rule (a_exclude, a_include: DS_HASH_SET [STRING]): ET_ECF_FILE_RULE
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

	new_multithreaded_condition (a_value: BOOLEAN): ET_ECF_MULTITHREADED_CONDITION
			-- New multithreaded condition
		do
			create Result.make (a_value)
		ensure
			condition_not_void: Result /= Void
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

	new_target (a_name: STRING): ET_ECF_TARGET
			-- New target
		require
			a_name_not_void: a_name /= Void
		do
			create Result.make (a_name)
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

end
