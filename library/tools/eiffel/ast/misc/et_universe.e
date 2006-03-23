indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2006, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIVERSE

inherit

	KL_IMPORTED_STRING_ROUTINES
	KL_IMPORTED_ARRAY_ROUTINES
	KL_SHARED_STANDARD_FILES
	KL_SHARED_FILE_SYSTEM
	KL_SHARED_EXECUTION_ENVIRONMENT
	ET_SHARED_CLASS_NAME_TESTER
	ET_SHARED_TOKEN_CONSTANTS

create

	make, make_standard, make_with_factory

feature {NONE} -- Initialization

	make_standard is
			-- Create a new class universe.
			-- Error messages will be sent to standard files.
		local
			a_handler: ET_ERROR_HANDLER
		do
			create a_handler.make_standard
			make (Void, a_handler)
		end

	make (a_clusters: like clusters; an_error_handler: like error_handler) is
			-- Create a new class universe.
		require
			an_error_handler_not_void: an_error_handler /= Void
		local
			a_factory: ET_AST_FACTORY
		do
			create a_factory.make
			make_with_factory (a_clusters, a_factory, an_error_handler)
		ensure
			clusters_set: clusters = a_clusters
			error_handler_set: error_handler = an_error_handler
		end

	make_with_factory (a_clusters: like clusters; a_factory: like ast_factory;
		an_error_handler: like error_handler) is
			-- Create a new class universe.
		require
			an_error_handler_not_void: an_error_handler /= Void
			a_factory_not_void: a_factory /= Void
		do
			clusters := a_clusters
			create classes.make_map (3000)
			classes.set_key_equality_tester (class_name_tester)
			error_handler := an_error_handler
			ast_factory := a_factory
			set_use_assign_keyword (True)
			set_use_attribute_keyword (True)
			set_use_convert_keyword (True)
			set_use_create_keyword (True)
			set_use_recast_keyword (True)
			set_use_reference_keyword (True)
			set_use_void_keyword (True)
			make_basic_classes
			create null_processor.make (Current)
			provider_checker := null_processor
			ancestor_builder := null_processor
			feature_flattener := null_processor
			interface_checker := null_processor
			implementation_checker := null_processor
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_basic_classes is
			-- Create basic classes.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
		do
				-- Basic classes.
			any_class := eiffel_class (tokens.any_class_name)
			any_class.set_in_system (True)
			general_class := eiffel_class (tokens.general_class_name)
			none_class := eiffel_class (tokens.none_class_name)
			none_class.set_in_system (True)
			tuple_class := eiffel_class (tokens.tuple_class_name)
			tuple_class.set_in_system (True)
			bit_class := eiffel_class (tokens.bit_class_name)
			bit_class.set_in_system (True)
			string_class := eiffel_class (tokens.string_class_name)
			string_class.set_in_system (True)
			array_class := eiffel_class (tokens.array_class_name)
			array_class.set_in_system (True)
			special_class := eiffel_class (tokens.special_class_name)
			special_class.set_in_system (True)
			boolean_class := eiffel_class (tokens.boolean_class_name)
			boolean_class.set_in_system (True)
			character_class := eiffel_class (tokens.character_class_name)
			character_class.set_in_system (True)
			wide_character_class := eiffel_class (tokens.wide_character_class_name)
			wide_character_class.set_in_system (True)
			integer_class := eiffel_class (tokens.integer_class_name)
			integer_class.set_in_system (True)
			integer_8_class := eiffel_class (tokens.integer_8_class_name)
			integer_8_class.set_in_system (True)
			integer_16_class := eiffel_class (tokens.integer_16_class_name)
			integer_16_class.set_in_system (True)
			integer_32_class := eiffel_class (tokens.integer_32_class_name)
			integer_32_class.set_in_system (True)
			integer_64_class := eiffel_class (tokens.integer_64_class_name)
			integer_64_class.set_in_system (True)
			natural_class := eiffel_class (tokens.natural_class_name)
			natural_class.set_in_system (True)
			natural_8_class := eiffel_class (tokens.natural_8_class_name)
			natural_8_class.set_in_system (True)
			natural_16_class := eiffel_class (tokens.natural_16_class_name)
			natural_16_class.set_in_system (True)
			natural_32_class := eiffel_class (tokens.natural_32_class_name)
			natural_32_class.set_in_system (True)
			natural_64_class := eiffel_class (tokens.natural_64_class_name)
			natural_64_class.set_in_system (True)
			real_class := eiffel_class (tokens.real_class_name)
			real_class.set_in_system (True)
			double_class := eiffel_class (tokens.double_class_name)
			double_class.set_in_system (True)
			pointer_class := eiffel_class (tokens.pointer_class_name)
			pointer_class.set_in_system (True)
			typed_pointer_class := eiffel_class (tokens.typed_pointer_class_name)
			typed_pointer_class.set_in_system (True)
			type_class := eiffel_class (tokens.type_class_name)
			type_class.set_in_system (True)
			routine_class := eiffel_class (tokens.routine_class_name)
			routine_class.set_in_system (True)
			procedure_class := eiffel_class (tokens.procedure_class_name)
			procedure_class.set_in_system (True)
			predicate_class := eiffel_class (tokens.predicate_class_name)
			predicate_class.set_in_system (True)
			function_class := eiffel_class (tokens.function_class_name)
			function_class.set_in_system (True)
			arguments_class := eiffel_class (tokens.arguments_class_name)
			platform_class := eiffel_class (tokens.platform_class_name)
			system_object_class := eiffel_class (tokens.system_object_class_name)
				-- Unknown class.
			create unknown_class.make_unknown (tokens.unknown_class_name)
				-- Type "ANY".
			create any_type.make (Void, any_class.name, any_class)
				-- Type "NONE".
			create none_type.make (Void, none_class.name, none_class)
				-- Type "STRING".
			create string_type.make (Void, string_class.name, string_class)
				-- Type "ARRAY [ANY]".
			create a_parameters.make_with_capacity (1)
			a_parameters.put_first (any_class)
			create array_any_type.make (Void, array_class.name, a_parameters, array_class)
				-- Type "ARRAY [NONE]".
			create a_parameters.make_with_capacity (1)
			a_parameters.put_first (none_class)
			create array_none_type.make (Void, array_class.name, a_parameters, array_class)
				-- Implicit parent "ANY".
			create any_parent.make (any_type, Void, Void, Void, Void, Void)
			create any_parents.make_with_capacity (1)
			any_parents.put_first (any_parent)
				-- Built-in conversion features.
			create integer_8_convert_feature.make (integer_8_class)
			create integer_16_convert_feature.make (integer_16_class)
			create integer_convert_feature.make (integer_class)
			create integer_64_convert_feature.make (integer_64_class)
			create natural_8_convert_feature.make (natural_8_class)
			create natural_16_convert_feature.make (natural_16_class)
			create natural_32_convert_feature.make (natural_32_class)
			create natural_64_convert_feature.make (natural_64_class)
			create real_convert_feature.make (real_class)
			create double_convert_feature.make (double_class)
				-- Needed for compatibility with 5.6.0610 (to be removed later):
			boolean_ref_class := eiffel_class (tokens.boolean_ref_class_name)
			character_ref_class := eiffel_class (tokens.character_ref_class_name)
			wide_character_ref_class := eiffel_class (tokens.wide_character_ref_class_name)
			integer_ref_class := eiffel_class (tokens.integer_ref_class_name)
			integer_8_ref_class := eiffel_class (tokens.integer_8_ref_class_name)
			integer_16_ref_class := eiffel_class (tokens.integer_16_ref_class_name)
			integer_64_ref_class := eiffel_class (tokens.integer_64_ref_class_name)
			natural_8_ref_class := eiffel_class (tokens.natural_8_ref_class_name)
			natural_16_ref_class := eiffel_class (tokens.natural_16_ref_class_name)
			natural_32_ref_class := eiffel_class (tokens.natural_32_ref_class_name)
			natural_64_ref_class := eiffel_class (tokens.natural_64_ref_class_name)
			real_ref_class := eiffel_class (tokens.real_ref_class_name)
			double_ref_class := eiffel_class (tokens.double_ref_class_name)
			pointer_ref_class := eiffel_class (tokens.pointer_ref_class_name)
			numeric_class := eiffel_class (tokens.numeric_class_name)
			comparable_class := eiffel_class (tokens.comparable_class_name)
			part_comparable_class := eiffel_class (tokens.part_comparable_class_name)
			hashable_class := eiffel_class (tokens.hashable_class_name)
			create boolean_convert_feature.make (boolean_class)
			create character_convert_feature.make (character_class)
			create wide_character_convert_feature.make (wide_character_class)
			create pointer_convert_feature.make (pointer_class)
		ensure
			any_class_not_void: any_class /= Void
			general_class_not_void: general_class /= Void
			none_class_not_void: none_class /= Void
			tuple_class_not_void: tuple_class /= Void
			bit_class_not_void: bit_class /= Void
			string_class_not_void: string_class /= Void
			array_class_not_void: array_class /= Void
			special_class_not_void: special_class /= Void
			boolean_class_not_void: boolean_class /= Void
			character_class_not_void: character_class /= Void
			wide_character_class_not_void: wide_character_class /= Void
			integer_class_not_void: integer_class /= Void
			integer_8_class_not_void: integer_8_class /= Void
			integer_16_class_not_void: integer_16_class /= Void
			integer_32_class_not_void: integer_32_class /= Void
			integer_64_class_not_void: integer_64_class /= Void
			natural_class_not_void: natural_class /= Void
			natural_8_class_not_void: natural_8_class /= Void
			natural_16_class_not_void: natural_16_class /= Void
			natural_32_class_not_void: natural_32_class /= Void
			natural_64_class_not_void: natural_64_class /= Void
			real_class_not_void: real_class /= Void
			double_class_not_void: double_class /= Void
			pointer_class_not_void: pointer_class /= Void
			typed_pointer_class_not_void: typed_pointer_class /= Void
			type_class_not_void: type_class /= Void
			routine_class_not_void: routine_class /= Void
			procedure_class_not_void: procedure_class /= Void
			predicate_class_not_void: predicate_class /= Void
			function_class_not_void: function_class /= Void
			arguments_class_not_void: arguments_class /= Void
			platform_class_not_void: platform_class /= Void
			system_object_class_not_void: system_object_class /= Void
			unknown_class_not_void: unknown_class /= Void
			any_type_not_void: any_type /= Void
			string_type_not_void: string_type /= Void
			none_type_not_void: none_type /= Void
			array_any_type_not_void: array_any_type /= Void
			array_none_type_not_void: array_none_type /= Void
			any_parent_not_void: any_parent /= Void
			any_parents_not_void: any_parents /= Void
			integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
			integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
			integer_convert_feature_not_void: integer_convert_feature /= Void
			integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
			natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
			natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
			natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
			natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
			real_convert_feature_not_void: real_convert_feature /= Void
			double_convert_feature_not_void: double_convert_feature /= Void
			boolean_ref_class_not_void: boolean_ref_class /= Void
			character_ref_class_not_void: character_ref_class /= Void
			wide_character_ref_class_not_void: wide_character_ref_class /= Void
			integer_ref_class_not_void: integer_ref_class /= Void
			integer_8_ref_class_not_void: integer_8_ref_class /= Void
			integer_16_ref_class_not_void: integer_16_ref_class /= Void
			integer_64_ref_class_not_void: integer_64_ref_class /= Void
			natural_8_ref_class_not_void: natural_8_ref_class /= Void
			natural_16_ref_class_not_void: natural_16_ref_class /= Void
			natural_32_ref_class_not_void: natural_32_ref_class /= Void
			natural_64_ref_class_not_void: natural_64_ref_class /= Void
			real_ref_class_not_void: real_ref_class /= Void
			double_ref_class_not_void: double_ref_class /= Void
			pointer_ref_class_not_void: pointer_ref_class /= Void
			numeric_class_not_void: numeric_class /= Void
			comparable_class_not_void: comparable_class /= Void
			part_comparable_class_not_void: part_comparable_class /= Void
			hashable_class_not_void: hashable_class /= Void
			boolean_convert_feature_not_void: boolean_convert_feature /= Void
			character_convert_feature_not_void: character_convert_feature /= Void
			wide_character_convert_feature_not_void: wide_character_convert_feature /= Void
			pointer_convert_feature_not_void: pointer_convert_feature /= Void
		end

feature -- Initialization

	reset_classes is
			-- Reset classes as they were when they were first parsed.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
		do
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
				until
					l_class = Void
				loop
					l_class.reset
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
		end

feature -- Status report

	has_class (a_name: ET_CLASS_NAME): BOOLEAN is
			-- Is there a class named `a_name'
			-- in current universe?
		require
			a_name_not_void: a_name /= Void
		local
			l_class: ET_CLASS
		do
			classes.search (a_name)
			if classes.found then
				l_class := classes.found_item
				Result := l_class.is_preparsed or l_class = none_class
			end
		ensure
			is_preparsed: Result implies (eiffel_class (a_name).is_preparsed or eiffel_class (a_name) = none_class)
		end

	has_cluster (a_cluster: ET_CLUSTER): BOOLEAN is
			-- Is `a_cluster' one of the clusters or recursively
			-- subclusters of current universe?
		do
			if clusters /= Void then
				Result := clusters.has_subcluster (a_cluster)
			end
		end

	has_cluster_by_name (a_names: ARRAY [STRING]): BOOLEAN is
			-- Is there a cluster named `a_names' in universe?
			-- Do not take into account missing implicit subclusters.
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		do
			if clusters /= Void then
				Result := clusters.has_subcluster_by_name (a_names)
			end
		end

	is_preparsed: BOOLEAN
			-- Has the whole universe already been preparsed?

	is_dotnet: BOOLEAN is
			-- Does current universe contain Eiffel for .NET kernel classes?
			-- Hence follow Eiffel for .NET validity rules.
			-- (We just check whether class "SYSTEM_OBJECT" is in the universe,
			-- so you will need to call one of the [pre]parse routines before
			-- calling this routine.)
		do
			Result := system_object_class.is_preparsed
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	root_class: ET_CLASS
			-- Root class

	root_creation: ET_FEATURE_NAME
			-- Root creation procedure

	system_name: STRING
			-- Name of system

	classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Classes in universe

	eiffel_class (a_name: ET_CLASS_NAME): ET_CLASS is
			-- Class named `a_name' in universe;
			-- add this class to universe if not found
		require
			a_name_not_void: a_name /= Void
		do
			classes.search (a_name)
			if classes.found then
				Result := classes.found_item
			else
				Result := ast_factory.new_class (a_name, classes.count + 1)
				classes.force_last (Result, a_name)
			end
		ensure
			eiffel_class_not_void: Result /= Void
		end

	class_by_name (a_name: STRING): ET_CLASS is
			-- Class named `a_name' in universe;
			-- Void if not such class
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		local
			a_class_name: ET_IDENTIFIER
		do
			create a_class_name.make (a_name)
			classes.search (a_class_name)
			if classes.found then
				Result := classes.found_item
			end
		end

	classes_by_cluster (a_cluster: ET_CLUSTER): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes in universe which are in `a_cluster';
			-- Create a new list at each call
		require
			a_cluster_not_void: a_cluster /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_by_cluster_capacity)
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				from
					a_class := a_cursor.item
				until
					a_class = Void
				loop
					if a_class.cluster = a_cluster then
						Result.force_last (a_class)
					end
					a_class := a_class.overridden_class
				end
				a_cursor.forth
			end
		ensure
			classes_not_void: Result /= Void
			no_void_class: not Result.has (Void)
		end

	classes_by_clusters: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_CLUSTER] is
			-- Classes in universe indexed by clusters;
			-- Create a new data structure at each call
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_cluster: ET_CLUSTER
			l_classes: DS_ARRAYED_LIST [ET_CLASS]
		do
			create Result.make_map (cluster_count)
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
				until
					l_class = Void
				loop
					l_cluster := l_class.cluster
					Result.search (l_cluster)
					if Result.found then
						l_classes := Result.found_item
					else
						create l_classes.make (initial_classes_by_cluster_capacity)
						Result.force_last (l_classes, l_cluster)
					end
					l_classes.force_last (l_class)
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
		end

	cluster_by_name (a_names: ARRAY [STRING]): ET_CLUSTER is
			-- Cluster named `a_names' in universe;
			-- Add missing implicit subclusters if needed;
			-- Void if not such cluster
		require
			a_names_not_void: a_names /= Void
			no_void_name: not STRING_ARRAY_.has (a_names, Void)
			-- no_empty_name: forall n in a_names, n.count > 0
		do
			if clusters /= Void then
				Result := clusters.subcluster_by_name (a_names)
			end
		end

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

feature -- Basic classes

	any_class: ET_CLASS
			-- Class "ANY"

	general_class: ET_CLASS
			-- Class "GENERAL"

	none_class: ET_CLASS
			-- Class "NONE"

	tuple_class: ET_CLASS
			-- Class "TUPLE"

	bit_class: ET_CLASS
			-- Class "BIT"

	string_class: ET_CLASS
			-- Class "STRING"

	array_class: ET_CLASS
			-- Class "ARRAY"

	special_class: ET_CLASS
			-- Class "SPECIAL"

	boolean_class: ET_CLASS
			-- Class "BOOLEAN"

	character_class: ET_CLASS
			-- Class "CHARACTER"

	wide_character_class: ET_CLASS
			-- Class "WIDE_CHARACTER"

	integer_class: ET_CLASS
			-- Class "INTEGER"

	integer_8_class: ET_CLASS
			-- Class "INTEGER_8"

	integer_16_class: ET_CLASS
			-- Class "INTEGER_16"

	integer_32_class: ET_CLASS
			-- Class "INTEGER_32"

	integer_64_class: ET_CLASS
			-- Class "INTEGER_64"

	natural_class: ET_CLASS
			-- Class "NATURAL"

	natural_8_class: ET_CLASS
			-- Class "NATURAL_8"

	natural_16_class: ET_CLASS
			-- Class "NATURAL_16"

	natural_32_class: ET_CLASS
			-- Class "NATURAL_32"

	natural_64_class: ET_CLASS
			-- Class "NATURAL_64"

	real_class: ET_CLASS
			-- Class "REAL"

	double_class: ET_CLASS
			-- Class "DOUBLE"

	pointer_class: ET_CLASS
			-- Class "POINTER"

	typed_pointer_class: ET_CLASS
			-- Class "TYPED_POINTER"

	type_class: ET_CLASS
			-- Class "TYPE"

	routine_class: ET_CLASS
			-- Class "ROUTINE"

	procedure_class: ET_CLASS
			-- Class "PROCEDURE"

	predicate_class: ET_CLASS
			-- Class "PREDICATE"

	function_class: ET_CLASS
			-- Class "FUNCTION"

	arguments_class: ET_CLASS
			-- Class "ARGUMENTS"

	platform_class: ET_CLASS
			-- Class "PLATFORM"

	system_object_class: ET_CLASS
			-- Class "SYSTEM_OBJECT" (in Eiffel for .NET)

	unknown_class: ET_CLASS
			-- Class "*UNKNOWN*"
			-- This class is equal to no other classes, not even itself;
			-- it does conform to no type, not even itself, and no type
			-- conforms to it

	any_type: ET_CLASS_TYPE
			-- Class type "ANY"

	none_type: ET_CLASS_TYPE
			-- Class type "NONE"

	string_type: ET_CLASS_TYPE
			-- Class type "STRING"

	array_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [ANY]"

	array_none_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [NONE]"

	any_parent: ET_PARENT
			-- Default parent

	any_parents: ET_PARENT_LIST
			-- Default parents

feature -- Basic classes (compatibility with 5.6.0610, to be removed later)

	boolean_ref_class: ET_CLASS
			-- Class "BOOLEAN_REF"

	character_ref_class: ET_CLASS
			-- Class "CHARACTER_REF"

	wide_character_ref_class: ET_CLASS
			-- Class "WIDE_CHARACTER_REF"

	integer_ref_class: ET_CLASS
			-- Class "INTEGER_REF"

	integer_8_ref_class: ET_CLASS
			-- Class "INTEGER_8_REF"

	integer_16_ref_class: ET_CLASS
			-- Class "INTEGER_16_REF"

	integer_64_ref_class: ET_CLASS
			-- Class "INTEGER_64_REF"

	natural_8_ref_class: ET_CLASS
			-- Class "NATURAL_8_REF"

	natural_16_ref_class: ET_CLASS
			-- Class "NATURAL_16_REF"

	natural_32_ref_class: ET_CLASS
			-- Class "NATURAL_32_REF"

	natural_64_ref_class: ET_CLASS
			-- Class "NATURAL_64_REF"

	real_ref_class: ET_CLASS
			-- Class "REAL_REF"

	double_ref_class: ET_CLASS
			-- Class "DOUBLE_REF"

	pointer_ref_class: ET_CLASS
			-- Class "POINTER_REF"

	numeric_class: ET_CLASS
			-- Class "NUMERIC"

	comparable_class: ET_CLASS
			-- Class "COMPARABLE"

	part_comparable_class: ET_CLASS
			-- Class "PART_COMPARABLE"

	hashable_class: ET_CLASS
			-- Class "HASHABLE"

feature -- Feature access

	integer_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_8

	integer_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_16

	integer_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER

	integer_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_64

	natural_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_8

	natural_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_16

	natural_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_32

	natural_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL_64

	real_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL

	double_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to DOUBLE

	default_create_seed: INTEGER
			-- Seed of feature 'default_create' in class ANY

	copy_seed: INTEGER
			-- Seed of feature 'copy' in class ANY

	void_seed: INTEGER
			-- Seed of feature 'Void' in class ANY

feature -- Feature access (for compatibility with 5.6.0610, to be removed later)

	boolean_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to BOOLEAN

	character_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to CHARACTER

	wide_character_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to WIDE_CHARACTER

	pointer_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to POINTER

feature -- Feature setting

	set_default_create_seed (a_seed: INTEGER) is
			-- Set `default_create_seed' to `a_seed'.
		require
			a_seed_non_negative: a_seed >= 0
		do
			default_create_seed := a_seed
		ensure
			default_create_seed_set: default_create_seed = a_seed
		end

	set_copy_seed (a_seed: INTEGER) is
			-- Set `copy_seed' to `a_seed'.
		require
			a_seed_non_negative: a_seed >= 0
		do
			copy_seed := a_seed
		ensure
			copy_seed_set: copy_seed = a_seed
		end

	set_void_seed (a_seed: INTEGER) is
			-- Set `void_seed' to `a_seed'.
		require
			a_seed_non_negative: a_seed >= 0
		do
			void_seed := a_seed
		ensure
			void_seed_set: void_seed = a_seed
		end

feature -- Feature registration

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			feature_count := feature_count + 1
			a_feature.set_id (feature_count)
		ensure
			registered: a_feature.is_registered
		end

	feature_count: INTEGER
			-- Number of features already registered

feature -- Measurement

	parsed_classes_count: INTEGER is
			-- Number of parsed classes in universe
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
		do
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.is_parsed then
					Result := Result + 1
				end
				a_cursor.forth
			end
		ensure
			parsed_classes_count_non_negative: Result >= 0
		end

	cluster_count: INTEGER is
			-- Number (recursively) of non-abstract clusters
		do
			if clusters /= Void then
				Result := clusters.count
			end
		ensure
			cluster_count_non_negavite: Result >= 0
		end

	override_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only override clusters
		do
			if clusters /= Void then
				Result := clusters.override_count
			end
		ensure
			override_cluster_count_non_negavite: Result >= 0
		end

	read_write_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only clusters
		do
			if clusters /= Void then
				Result := clusters.read_write_count
			end
		ensure
			read_write_cluster_count_non_negavite: Result >= 0
		end

feature -- Setting

	set_root_class (a_name: ET_CLASS_NAME) is
			-- Set `root_class'.
		require
			a_name_not_void: a_name /= Void
		do
			root_class := eiffel_class (a_name)
			root_class.set_in_system (True)
		ensure
			root_class_not_void: root_class /= Void
			root_class_set: root_class.name.same_class_name (a_name)
		end

	set_root_creation (a_name: like root_creation) is
			-- Set `root_creation' to `a_name'.
		do
			root_creation := a_name
		ensure
			root_creation_set: root_creation = a_name
		end

	set_system_name (a_name: like system_name) is
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_error_handler (a_handler: like error_handler) is
			-- Set `error_handler' to `a_handler'.
		require
			a_handler_not_void: a_handler /= Void
		do
			error_handler := a_handler
		ensure
			error_handler_set: error_handler = a_handler
		end

	set_ast_factory (a_factory: like ast_factory) is
			-- Set `ast_factory' to `a_factory'.
		require
			a_factory_not_void: a_factory /= Void
		do
			ast_factory := a_factory
		ensure
			ast_factory_set: ast_factory = a_factory
		end

feature -- Parser status report

	use_assign_keyword: BOOLEAN
			-- Should 'assign' be considered as
			-- a keyword (otherwise identifier)?

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?

	use_convert_keyword: BOOLEAN
			-- Should 'convert' be considered as
			-- a keyword (otherwise identifier)?

	use_create_keyword: BOOLEAN
			-- Should 'create' be considered as
			-- a keyword (otherwise identifier)?

	use_recast_keyword: BOOLEAN
			-- Should 'recast' be considered as
			-- a keyword (otherwise identifier)?

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?

	use_void_keyword: BOOLEAN
			-- Should 'void' be considered as
			-- a keyword (otherwise identifier)?

	providers_enabled: BOOLEAN
			-- Should providers be built when parsing a class?

	cluster_dependence_enabled: BOOLEAN
			-- Should cluster dependence constraint be checked?

feature -- Parser setting

	set_use_assign_keyword (b: BOOLEAN) is
			-- Set `use_assign_keyword' to `b'.
		do
			use_assign_keyword := b
		ensure
			use_assign_keyword_set: use_assign_keyword = b
		end

	set_use_attribute_keyword (b: BOOLEAN) is
			-- Set `use_attribute_keyword' to `b'.
		do
			use_attribute_keyword := b
		ensure
			use_attribute_keyword_set: use_attribute_keyword = b
		end

	set_use_convert_keyword (b: BOOLEAN) is
			-- Set `use_convert_keyword' to `b'.
		do
			use_convert_keyword := b
		ensure
			use_convert_keyword_set: use_convert_keyword = b
		end

	set_use_create_keyword (b: BOOLEAN) is
			-- Set `use_create_keyword' to `b'.
		do
			use_create_keyword := b
		ensure
			use_create_keyword_set: use_create_keyword = b
		end

	set_use_recast_keyword (b: BOOLEAN) is
			-- Set `use_recast_keyword' to `b'.
		do
			use_recast_keyword := b
		ensure
			use_recast_keyword_set: use_recast_keyword = b
		end

	set_use_reference_keyword (b: BOOLEAN) is
			-- Set `use_reference_keyword' to `b'.
		do
			use_reference_keyword := b
		ensure
			use_reference_keyword_set: use_reference_keyword = b
		end

	set_use_void_keyword (b: BOOLEAN) is
			-- Set `use_void_keyword' to `b'.
		do
			use_void_keyword := b
		ensure
			use_void_keyword_set: use_void_keyword = b
		end

	set_providers_enabled (b: BOOLEAN) is
			-- Set `providers_enabled' to `b'.
		do
			providers_enabled := b
		ensure
			providers_enabled_set: providers_enabled = b
		end

	set_cluster_dependence_enabled (b: BOOLEAN) is
			-- Set `cluster_dependence_enabled' to `b'.
		do
			cluster_dependence_enabled := b
		ensure
			cluster_dependence_enabled_set: cluster_dependence_enabled = b
		end

feature -- Implementation checking status report

	flat_mode: BOOLEAN
			-- Should the inherited features be checked
			-- again in the descendant classes?

	flat_dbc_mode: BOOLEAN
			-- Should the inherited pre- and postconditions be
			-- checked again in the redeclaration of features?

feature -- Implementation checking status setting

	set_flat_mode (b: BOOLEAN) is
			-- Set `flat_mode' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			flat_mode := b
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_mode (b)
			end
		ensure
			flat_mode_set: flat_mode = b
		end

	set_flat_dbc_mode (b: BOOLEAN) is
			-- Set `flat_dbc_mode' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			flat_dbc_mode := b
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_dbc_mode (b)
			end
		ensure
			flat_dbc_mode_set: flat_dbc_mode = b
		end

feature -- Element change

	add_implicit_subclusters is
			-- Add (recursively) implicit subclusters when clusters are recursive.
			-- Note that these subclusters will otherwise be added when running one of
			-- the `preparse_*' or `parse_all' routines.
		do
			if clusters /= Void then
				clusters.add_implicit_subclusters
			end
		end

feature -- Parsing

	preparse is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Use `preparse_multiple' policy by default (this
			-- can be redefined in descendants).
		do
			preparse_multiple
		ensure
			preparsed: is_preparsed
		end

	preparse_shallow is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_shallow (clusters)
				end
				is_preparsed := True
			end
		ensure
			preparsed: is_preparsed
		end

	preparse_single is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly
			-- one class.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_single (clusters)
				end
				is_preparsed := True
			end
		ensure
			preparsed: is_preparsed
		end

	preparse_multiple is
			-- Traverse all clusters and build a mapping between
			-- class names and filenames in each cluster. Classes
			-- are added to `classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_multiple (clusters)
				end
				is_preparsed := True
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_shallow is
			-- Traverse all non-read-only clusters again and rebuild the mapping between
			-- class names and filenames in each cluster. Modified classes are reset and
			-- left unparsed. New classes are added to `classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_modified: BOOLEAN
			a_time_stamp: INTEGER
		do
			if not is_preparsed then
				preparse_shallow
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist anymore).
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed then
							if a_class2.cluster.is_read_only then
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							elseif a_class2.is_parsed then
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							elseif not file_system.file_exists (a_class2.filename) then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							end
						else
							a_class2 := a_class2.overridden_class
							a_class1.set_overridden_class (a_class2)
						end
					end
					if a_class.is_preparsed then
						if a_class.cluster.is_read_only then
							-- Do nothing.
						elseif a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						elseif a_class.is_parsed then
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						elseif not file_system.file_exists (a_class.filename) then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						end
					else
						a_class2 := a_class.overridden_class
						if a_class2 /= Void then
							a_modified := True
							a_class.copy (a_class2)
						elseif a_class.is_parsed then
								-- When reporting VTCT errors on a class, `is_parsed'
								-- is set to True even if it was not preparsed
								-- (and hence not actually parsed).
							a_modified := True
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_shallow (clusters, False, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_single is
			-- Traverse all non-read-only clusters again and rebuild the mapping between
			-- class names and filenames in each cluster. Modified classes are reset and
			-- left unparsed. New classes are added to `classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly one class.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed then
							if a_class2.cluster.is_read_only then
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class2 := a_class2.overridden_class
							a_class1.set_overridden_class (a_class2)
						end
					end
					if a_class.is_preparsed then
						if a_class.cluster.is_read_only then
							-- Do nothing.
						elseif a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					else
						a_class2 := a_class.overridden_class
						if a_class2 /= Void then
							a_modified := True
							a_class.copy (a_class2)
						elseif a_class.is_parsed then
								-- When reporting VTCT errors on a class, `is_parsed'
								-- is set to True even if it was not preparsed
								-- (and hence not actually parsed).
							a_modified := True
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_single (clusters, False, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_multiple is
			-- Traverse all non-read-only clusters again and rebuild the mapping between
			-- class names and filenames in each cluster. Modified classes are reset and
			-- left unparsed. New classes are added to `classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed then
							if a_class2.cluster.is_read_only then
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class2 := a_class2.overridden_class
							a_class1.set_overridden_class (a_class2)
						end
					end
					if a_class.is_preparsed then
						if a_class.cluster.is_read_only then
							-- Do nothing.
						elseif a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					else
						a_class2 := a_class.overridden_class
						if a_class2 /= Void then
							a_modified := True
							a_class.copy (a_class2)
						elseif a_class.is_parsed then
								-- When reporting VTCT errors on a class, `is_parsed'
								-- is set to True even if it was not preparsed
								-- (and hence not actually parsed).
							a_modified := True
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_multiple (clusters, False, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_override_shallow is
			-- Traverse all non-read-only override clusters again and rebuild the mapping
			-- between class names and filenames in each cluster. Modified classes are reset
			-- and left unparsed. New classes are added to `classes', but are not parsed.
			-- Filenames are supposed to be of the form 'classname.e'.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_modified: BOOLEAN
			a_time_stamp: INTEGER
		do
			if not is_preparsed then
				preparse_shallow
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist anymore).
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed and then a_class2.cluster.is_override and then not a_class2.cluster.is_read_only then
							if a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							elseif a_class2.is_parsed then
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							elseif not file_system.file_exists (a_class2.filename) then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							end
						else
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						end
					end
					if a_class.is_preparsed and then a_class.cluster.is_override and then not a_class.cluster.is_read_only then
						if a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						elseif a_class.is_parsed then
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						elseif not file_system.file_exists (a_class.filename) then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_shallow (clusters, True, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_override_single is
			-- Traverse all non-read-only override clusters again and rebuild the mapping
			-- between class names and filenames in each cluster. Modified classes are reset
			-- and left unparsed. New classes are added to `classes', but are not parsed.
			-- Each Eiffel file is supposed to contain exactly one class.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed and then a_class2.cluster.is_override and then not a_class2.cluster.is_read_only then
							if a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						end
					end
					if a_class.is_preparsed and then a_class.cluster.is_override and then not a_class.cluster.is_read_only then
						if a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_single (clusters, True, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	repreparse_override_multiple is
			-- Traverse all non-read-only override clusters again and rebuild the mapping
			-- between class names and filenames in each cluster. Modified classes are reset
			-- and left unparsed. New classes are added to `classes', but are not parsed.
			-- Each Eiffel file can contain more than one class.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed and then a_class2.cluster.is_override and then not a_class2.cluster.is_read_only then
							if a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						end
					end
					if a_class.is_preparsed and then a_class.cluster.is_override and then not a_class.cluster.is_read_only then
						if a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					end
					a_cursor.forth
				end
				eiffel_preparser.repreparse_clusters_multiple (clusters, True, False)
				if a_modified or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	parse_all is
			-- Parse whole universe.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway.
		do
			if clusters /= Void then
				eiffel_parser.parse_clusters (clusters)
			end
			is_preparsed := True
		ensure
			preparsed: is_preparsed
		end

	reparse_all is
			-- Parse all classes in non-read-only clusters again.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				parse_all
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed and a_class2.is_parsed then
							if a_class2.cluster.is_read_only then
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class2 := a_class2.overridden_class
							a_class1.set_overridden_class (a_class2)
						end
					end
					if a_class.is_preparsed and a_class.is_parsed then
						if a_class.cluster.is_read_only then
							-- Do nothing.
						elseif a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					else
						a_modified := True
						a_class2 := a_class.overridden_class
						if a_class2 /= Void then
							a_class.copy (a_class2)
						else
							a_class.reset_all
						end
					end
					a_cursor.forth
				end
				eiffel_parser.reparse_clusters (clusters, False, False)
				if a_modified or eiffel_parser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	reparse_override_all is
			-- Parse all classes in non-read-only override clusters again.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_modified: BOOLEAN
		do
			if not is_preparsed then
				parse_all
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					from
						a_class1 := a_class
						a_class2 := a_class1.overridden_class
					until
						a_class2 = Void
					loop
						if a_class2.is_preparsed and a_class2.is_parsed and then a_class2.cluster.is_override and then not a_class2.cluster.is_read_only then
							if a_class2.cluster.is_abstract then
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							else
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						else
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						end
					end
					if a_class.is_preparsed and a_class.is_parsed and then a_class.cluster.is_override and then not a_class.cluster.is_read_only then
						if a_class.cluster.is_abstract then
							a_modified := True
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class.copy (a_class2)
							else
								a_class.reset_all
							end
						else
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
								a_modified := True
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class.copy (a_class2)
								else
									a_class.reset_all
								end
							end
						end
					end
					a_cursor.forth
				end
				eiffel_parser.reparse_clusters (clusters, True, False)
				if a_modified or eiffel_parser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes
				end
			end
		ensure
			preparsed: is_preparsed
		end

	parse_system is
			-- Parse whole system.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			not_done: BOOLEAN
			a_parser: like eiffel_parser
		do
			if root_class /= Void then
				a_parser := eiffel_parser
				root_class.process (a_parser)
				if root_class = none_class then
					parse_all
				elseif not root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (root_class)
				else
					not_done := True
					a_cursor := classes.new_cursor
					from until not not_done loop
						not_done := False
						from a_cursor.start until a_cursor.after loop
							a_class := a_cursor.item
							if a_class.in_system and then not a_class.is_parsed then
								a_class.process (a_parser)
								not_done := True
							end
							a_cursor.forth
						end
					end
				end
			end
		end

	parse_file (a_file: KI_CHARACTER_INPUT_STREAM; a_filename: STRING; a_time_stamp: INTEGER; a_cluster: ET_CLUSTER) is
			-- Parse all classes in `a_file' within cluster `a_cluster'.
			-- `a_filename' is the filename of `a_file' and `a_time_stamp'
			-- its time stamp just before it was open.
		require
			a_file_not_void: a_file /= Void
			a_file_open_read: a_file.is_open_read
			a_filename_not_void: a_filename /= Void
			a_cluster_not_void: a_cluster /= Void
		do
			eiffel_parser.parse_file (a_file, a_filename, a_time_stamp, a_cluster)
		end

feature -- Compilation status report

	is_ecma: BOOLEAN
			-- Should the compilation process use ECMA's semantics?

	is_ise: BOOLEAN
			-- Should the compilation process use ISE's semantics?

feature -- Compilation setting

	set_ecma (b: BOOLEAN) is
			-- Set `is_ecma' to `b'.
		do
			is_ecma := b
		ensure
			ecma_set: is_ecma = b
		end

	set_ise (b: BOOLEAN) is
			-- Set `is_ise' to `b'.
		do
			is_ise := b
		ensure
			ise_set: is_ise = b
		end

feature -- Compilation

	compile is
			-- Compile universe.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
		do
			if root_class = Void or root_class = none_class then
				compile_all
			else
				compile_system
			end
		end

	compile_system is
			-- Compile all classes in the system.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			debug ("ericb")
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			preparse_single
			debug ("ericb")
				print_time (dt1, "Degree 6")
				dt1 := l_clock.system_clock.date_time_now
			end
			parse_system
			debug ("ericb")
				std.output.put_string ("Preparsed ")
				std.output.put_integer (classes.count)
				std.output.put_line (" classes")
				std.output.put_string ("Parsed ")
				std.output.put_integer (parsed_classes_count)
				std.output.put_line (" classes")
				std.output.put_integer (feature_count)
				std.output.put_line (" features")
			end
			debug ("ericb")
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			debug ("ericb")
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			debug ("ericb")
				print_time (dt1, "Degree 3")
			end
		end

	compile_all is
			-- Compile all classes in the universe.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			debug ("ericb")
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
--			preparse_single
--			debug ("ericb")
--				print_time (dt1, "Degree 6")
--				dt1 := l_clock.system_clock.date_time_now
--			end
--			compile_degree_5
			parse_all
			check_provider_validity
			debug ("ericb")
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			debug ("ericb")
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			debug ("ericb")
				print_time (dt1, "Degree 3")
			end
		end

	compile_degree_5 is
			-- Equivalent of ISE's Degree 5.
		local
			a_parser: like eiffel_parser
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
				-- Parse classes.
			a_parser := eiffel_parser
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.is_preparsed then
					a_class.process (a_parser)
				end
				a_cursor.forth
			end
			check_provider_validity
			debug ("ericb")
				std.output.put_string ("Parsed ")
				std.output.put_integer (classes.count)
				std.output.put_line (" classes")
				std.output.put_integer (feature_count)
				std.output.put_line (" features")
			end
		end

	compile_degree_4 is
			-- Equivalent of ISE Eiffel's Degree 4.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			nb: INTEGER
		do
				-- Build ancestors.
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.is_parsed then
					a_class.process (ancestor_builder)
				end
				a_cursor.forth
			end
				-- Flatten features.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.ancestors_built then
					nb := nb + 1
					a_class.process (feature_flattener)
				end
				a_cursor.forth
			end
				-- Check interface.
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.features_flattened then
					a_class.process (interface_checker)
				end
				a_cursor.forth
			end
			debug ("ericb")
				std.output.put_string ("Flattened ")
				std.output.put_integer (nb)
				std.output.put_line (" classes")
				std.output.put_integer (feature_count)
				std.output.put_line (" features")
			end
		end

	compile_degree_3 is
			-- Equivalent of ISE Eiffel's Degree 3.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
				-- Check implementation.
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_mode (flat_mode)
				a_checker.set_flat_dbc_mode (flat_dbc_mode)
			end
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.interface_checked then
					a_class.process (implementation_checker)
				end
				a_cursor.forth
			end
		end

	check_provider_validity is
			-- Check cluster dependence constraints.
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			if cluster_dependence_enabled then
				a_cursor := classes.new_cursor
				from a_cursor.start until a_cursor.after loop
					a_class := a_cursor.item
					if a_class.is_parsed then
						a_class.process (provider_checker)
					end
					a_cursor.forth
				end
			end
		end

feature -- Client/Supplier relationship

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of an expression
			-- in feature `a_feature' in type `a_client'.
			-- (Note that `a_supplier' may be altered after the execution of
			-- this routine. Therefore if you want to keep a reference to it
			-- you should duplicate it or use its base type for example.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_supplier_valid: a_supplier.is_valid_context
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_expression_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of a formal
			-- argument of feature `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_argument_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of the
			-- result of query `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_result_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of a
			-- static call in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_static_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the explicit type of a creation
			-- instruction or expression in `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_create_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_FEATURE) is
			-- Report the fact that `a_supplier' is the type of a
			-- local variable of feature `a_feature' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_feature.implementation_class'. Its
			-- formal generic parameters should be resolved in the
			-- base class of `a_client' first before using `a_client'
			-- as its context.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_feature_not_void: a_feature /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	supplier_handler: ET_SUPPLIER_HANDLER
			-- Supplier handler

	set_supplier_handler (a_handler: like supplier_handler) is
			-- Set `supplier_handler' to `a_handler'.
		do
			supplier_handler := a_handler
		ensure
			supplier_handler_set: supplier_handler = a_handler
		end

feature -- Processors

	eiffel_preparser: ET_EIFFEL_PREPARSER is
			-- Eiffel preparser
		do
			Result := internal_eiffel_preparser
			if Result = Void then
				create Result.make_with_factory (Current, ast_factory, error_handler)
				internal_eiffel_preparser := Result
			end
			Result.set_use_assign_keyword (use_assign_keyword)
			Result.set_use_attribute_keyword (use_attribute_keyword)
			Result.set_use_convert_keyword (use_convert_keyword)
			Result.set_use_create_keyword (use_create_keyword)
			Result.set_use_recast_keyword (use_recast_keyword)
			Result.set_use_reference_keyword (use_reference_keyword)
			Result.set_use_void_keyword (use_void_keyword)
		ensure
			eiffel_preparser_not_void: Result /= Void
		end

	eiffel_parser: ET_EIFFEL_PARSER is
			-- Eiffel parser
		do
			Result := internal_eiffel_parser
			if Result = Void then
				create Result.make_with_factory (Current, ast_factory, error_handler)
				internal_eiffel_parser := Result
			end
			Result.set_universe (Current)
			Result.set_ast_factory (ast_factory)
			Result.set_error_handler (error_handler)
			Result.set_use_assign_keyword (use_assign_keyword)
			Result.set_use_attribute_keyword (use_attribute_keyword)
			Result.set_use_convert_keyword (use_convert_keyword)
			Result.set_use_create_keyword (use_create_keyword)
			Result.set_use_recast_keyword (use_recast_keyword)
			Result.set_use_reference_keyword (use_reference_keyword)
			Result.set_use_void_keyword (use_void_keyword)
			Result.set_providers_enabled (providers_enabled)
		ensure
			eiffel_parser_not_void: Result /= Void
		end

	provider_checker: ET_AST_PROCESSOR
			-- Provider checker

	ancestor_builder: ET_AST_PROCESSOR
			-- Ancestor builder

	feature_flattener: ET_AST_PROCESSOR
			-- Feature flattener

	interface_checker: ET_AST_PROCESSOR
			-- Interface checker

	implementation_checker: ET_AST_PROCESSOR
			-- Implementation checker

	null_processor: ET_AST_NULL_PROCESSOR
			-- Null processor

	activate_processors is
			-- Activate processors.
		local
			l_feature_flattener: ET_FEATURE_FLATTENER
			l_interface_checker: ET_INTERFACE_CHECKER
		do
			if provider_checker = null_processor then
				create {ET_PROVIDER_CHECKER} provider_checker.make (Current)
			end
			if ancestor_builder = null_processor then
				create {ET_ANCESTOR_BUILDER} ancestor_builder.make (Current)
			end
			if feature_flattener = null_processor then
				create l_feature_flattener.make (Current)
				feature_flattener := l_feature_flattener
			end
			if interface_checker = null_processor then
				create l_interface_checker.make (Current)
				interface_checker := l_interface_checker
			end
			if implementation_checker = null_processor then
				create {ET_IMPLEMENTATION_CHECKER} implementation_checker.make (Current)
			end
		end

	set_provider_checker (a_provider_checker: like provider_checker) is
			-- Set `provider_checker' to `a_provider_checker'.
		require
			a_provider_checker_not_void: a_provider_checker /= Void
		do
			provider_checker := a_provider_checker
		ensure
			provider_checker_set: provider_checker = a_provider_checker
		end

	set_ancestor_builder (an_ancestor_builder: like ancestor_builder) is
			-- Set `ancestor_builder' to `an_ancestor_builder'.
		require
			an_ancestor_builder_not_void: an_ancestor_builder /= Void
		do
			ancestor_builder := an_ancestor_builder
		ensure
			ancestor_builder_set: ancestor_builder = an_ancestor_builder
		end

	set_feature_flattener (a_feature_flattener: like feature_flattener) is
			-- Set `feature_flattener' to `a_feature_flattener'.
		require
			a_feature_flattener_not_void: a_feature_flattener /= Void
		do
			feature_flattener := a_feature_flattener
		ensure
			feature_flattener_set: feature_flattener = a_feature_flattener
		end

	set_interface_checker (an_interface_checker: like interface_checker) is
			-- Set `interface_checker' to `an_interface_checker'.
		require
			an_interface_checker_not_void: an_interface_checker /= Void
		do
			interface_checker := an_interface_checker
		ensure
			interface_checker_set: interface_checker = an_interface_checker
		end

	set_implementation_checker (a_checker: like implementation_checker) is
			-- Set `implementation_chcker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			implementation_checker := a_checker
		ensure
			implementation_checker_set: implementation_checker = a_checker
		end

feature -- Timing

	print_time (a_start: DT_DATE_TIME; a_degree: STRING) is
			-- Print time spent in `a_degree' since `a_start'.
		require
			a_start_not_void: a_start /= Void
			a_degree_not_void: a_degree /= Void
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt2: DT_DATE_TIME
			dtd: DT_DATE_TIME_DURATION
		do
			create l_clock
			dt2 := l_clock.system_clock.date_time_now
			dtd := dt2 - a_start
			dtd.set_canonical (a_start)
			std.output.put_string (a_degree)
			std.output.put_string (": ")
			std.output.put_line (dtd.out)
			debug ("stop")
				io.read_line
			end
		end

feature {NONE} -- Implementation

	internal_eiffel_preparser: ET_EIFFEL_PREPARSER
			-- Eiffel preparser

	internal_eiffel_parser: ET_EIFFEL_PARSER
			-- Eiffel parser

feature {NONE} -- Constants

	initial_classes_by_cluster_capacity: INTEGER is
			-- Initial capacity for `classes_by_cluster'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
	any_class_not_void: any_class /= Void
	general_class_not_void: general_class /= Void
	none_class_not_void: none_class /= Void
	tuple_class_not_void: tuple_class /= Void
	bit_class_not_void: bit_class /= Void
	string_class_not_void: string_class /= Void
	array_class_not_void: array_class /= Void
	special_class_not_void: special_class /= Void
	boolean_class_not_void: boolean_class /= Void
	character_class_not_void: character_class /= Void
	wide_character_class_not_void: wide_character_class /= Void
	integer_class_not_void: integer_class /= Void
	integer_8_class_not_void: integer_8_class /= Void
	integer_16_class_not_void: integer_16_class /= Void
	integer_32_class_not_void: integer_32_class /= Void
	integer_64_class_not_void: integer_64_class /= Void
	natural_class_not_void: natural_class /= Void
	natural_8_class_not_void: natural_8_class /= Void
	natural_16_class_not_void: natural_16_class /= Void
	natural_32_class_not_void: natural_32_class /= Void
	natural_64_class_not_void: natural_64_class /= Void
	real_class_not_void: real_class /= Void
	double_class_not_void: double_class /= Void
	pointer_class_not_void: pointer_class /= Void
	typed_pointer_class_not_void: typed_pointer_class /= Void
	type_class_not_void: type_class /= Void
	routine_class_not_void: routine_class /= Void
	procedure_class_not_void: procedure_class /= Void
	predicate_class_not_void: predicate_class /= Void
	function_class_not_void: function_class /= Void
	arguments_class_not_void: arguments_class /= Void
	platform_class_not_void: platform_class /= Void
	system_object_class_not_void: system_object_class /= Void
	unknown_class_not_void: unknown_class /= Void
	any_type_not_void: any_type /= Void
	none_type_not_void: none_type /= Void
	string_type_not_void: string_type /= Void
	array_any_type_not_void: array_any_type /= Void
	array_none_type_not_void: array_none_type /= Void
	any_parent_not_void: any_parent /= Void
	any_parents_not_void: any_parents /= Void
	integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
	integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
	integer_convert_feature_not_void: integer_convert_feature /= Void
	integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
	natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
	natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
	natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
	natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
	real_convert_feature_not_void: real_convert_feature /= Void
	double_convert_feature_not_void: double_convert_feature /= Void
	default_create_seed_non_negative: default_create_seed >= 0
	void_seed_non_negative: void_seed >= 0
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	null_processor_not_void: null_processor /= Void
	boolean_ref_class_not_void: boolean_ref_class /= Void
	character_ref_class_not_void: character_ref_class /= Void
	wide_character_ref_class_not_void: wide_character_ref_class /= Void
	integer_ref_class_not_void: integer_ref_class /= Void
	integer_8_ref_class_not_void: integer_8_ref_class /= Void
	integer_16_ref_class_not_void: integer_16_ref_class /= Void
	integer_64_ref_class_not_void: integer_64_ref_class /= Void
	natural_8_ref_class_not_void: natural_8_ref_class /= Void
	natural_16_ref_class_not_void: natural_16_ref_class /= Void
	natural_32_ref_class_not_void: natural_32_ref_class /= Void
	natural_64_ref_class_not_void: natural_64_ref_class /= Void
	real_ref_class_not_void: real_ref_class /= Void
	double_ref_class_not_void: double_ref_class /= Void
	pointer_ref_class_not_void: pointer_ref_class /= Void
	numeric_class_not_void: numeric_class /= Void
	comparable_class_not_void: comparable_class /= Void
	part_comparable_class_not_void: part_comparable_class /= Void
	hashable_class_not_void: hashable_class /= Void
	boolean_convert_feature_not_void: boolean_convert_feature /= Void
	character_convert_feature_not_void: character_convert_feature /= Void
	wide_character_convert_feature_not_void: wide_character_convert_feature /= Void
	pointer_convert_feature_not_void: pointer_convert_feature /= Void

end
