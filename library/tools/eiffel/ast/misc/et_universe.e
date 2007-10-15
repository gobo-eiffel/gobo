indexing

	description:

		"Eiffel class universes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2007, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_UNIVERSE

inherit

	ANY

	KL_IMPORTED_ARRAY_ROUTINES

	KL_IMPORTED_STRING_ROUTINES
			export {NONE} all end

	KL_SHARED_FILE_SYSTEM
			export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
			export {NONE} all end

	ET_SHARED_CLASS_NAME_TESTER
			export {NONE} all end

	ET_SHARED_TOKEN_CONSTANTS
			export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

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
			create basic_classes.make_map (sized_basic_type_count)
			basic_classes.set_key_equality_tester (class_name_tester)
			error_handler := an_error_handler
			ast_factory := a_factory
			set_default_keyword_usage
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
			create external_library_pathnames.make (20)
			console_application_mode := True
			make_basic_classes
			create null_processor.make (Current)
			provider_checker := null_processor
			ancestor_builder := null_processor
			feature_flattener := null_processor
			interface_checker := null_processor
			implementation_checker := null_processor
			flat_implementation_checker := null_processor
		ensure
			clusters_set: clusters = a_clusters
			ast_factory_set: ast_factory = a_factory
			error_handler_set: error_handler = an_error_handler
		end

	make_basic_classes is
			-- Create basic classes.
		local
			a_parameters: ET_ACTUAL_PARAMETER_LIST
			a_none_group: ET_NONE_GROUP
			a_system_object_parent: ET_PARENT
		do
				-- Basic classes.
			any_class := eiffel_class (tokens.any_class_name)
			any_class.set_in_system (True)
			general_class := eiffel_class (tokens.general_class_name)
			none_class := eiffel_class (tokens.none_class_name)
			create a_none_group.make
			none_class.set_group (a_none_group)
			none_class.set_in_system (True)
			tuple_class := eiffel_class (tokens.tuple_class_name)
			tuple_class.set_in_system (True)
			bit_class := eiffel_class (tokens.bit_class_name)
			bit_class.set_in_system (True)
			string_8_class := eiffel_class (tokens.string_8_class_name)
			string_8_class.set_in_system (True)
			string_32_class := eiffel_class (tokens.string_32_class_name)
			string_32_class.set_in_system (True)
			string_class := string_8_class
			basic_classes.force_last (string_class, tokens.string_class_name)
			array_class := eiffel_class (tokens.array_class_name)
			array_class.set_in_system (True)
			special_class := eiffel_class (tokens.special_class_name)
			special_class.set_in_system (True)
			native_array_class := eiffel_class (tokens.native_array_class_name)
			native_array_class.set_in_system (True)
			boolean_class := eiffel_class (tokens.boolean_class_name)
			boolean_class.set_in_system (True)
			character_8_class := eiffel_class (tokens.character_8_class_name)
			character_8_class.set_in_system (True)
			character_32_class := eiffel_class (tokens.character_32_class_name)
			character_32_class.set_in_system (True)
			character_class := character_8_class
			basic_classes.force_last (character_class, tokens.character_class_name)
			wide_character_class := character_32_class
			basic_classes.force_last (wide_character_class, tokens.wide_character_class_name)
			integer_8_class := eiffel_class (tokens.integer_8_class_name)
			integer_8_class.set_in_system (True)
			integer_16_class := eiffel_class (tokens.integer_16_class_name)
			integer_16_class.set_in_system (True)
			integer_32_class := eiffel_class (tokens.integer_32_class_name)
			integer_32_class.set_in_system (True)
			integer_64_class := eiffel_class (tokens.integer_64_class_name)
			integer_64_class.set_in_system (True)
			integer_class := integer_32_class
			basic_classes.force_last (integer_class, tokens.integer_class_name)
			natural_8_class := eiffel_class (tokens.natural_8_class_name)
			natural_8_class.set_in_system (True)
			natural_16_class := eiffel_class (tokens.natural_16_class_name)
			natural_16_class.set_in_system (True)
			natural_32_class := eiffel_class (tokens.natural_32_class_name)
			natural_32_class.set_in_system (True)
			natural_64_class := eiffel_class (tokens.natural_64_class_name)
			natural_64_class.set_in_system (True)
			natural_class := natural_32_class
			basic_classes.force_last (natural_class, tokens.natural_class_name)
			real_32_class := eiffel_class (tokens.real_32_class_name)
			real_32_class.set_in_system (True)
			real_64_class := eiffel_class (tokens.real_64_class_name)
			real_64_class.set_in_system (True)
			real_class := real_32_class
			basic_classes.force_last (real_class, tokens.real_class_name)
			double_class := real_64_class
			basic_classes.force_last (double_class, tokens.double_class_name)
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
			identified_routines_class := eiffel_class (tokens.identified_routines_class_name)
			platform_class := eiffel_class (tokens.platform_class_name)
			system_object_class := eiffel_class (tokens.system_object_class_name)
			system_string_class := eiffel_class (tokens.system_string_class_name)
				-- Unknown class.
			create unknown_class.make_unknown (tokens.unknown_class_name)
				-- Type "ANY".
			create any_type.make (Void, any_class.name, any_class)
				-- Type "NONE".
			create none_type.make (Void, none_class.name, none_class)
				-- Type "INTEGER".
			create integer_type.make (Void, tokens.integer_class_name, integer_class)
				-- Type "NATURAL".
			create natural_type.make (Void, tokens.natural_class_name, natural_class)
				-- Type "CHARACTER".
			create character_type.make (Void, tokens.character_class_name, character_class)
				-- Type "STRING".
			create string_type.make (Void, tokens.string_class_name, string_class)
				-- Type "REAL".
			create real_type.make (Void, tokens.real_class_name, real_class)
				-- Type "DOUBLE".
			create double_type.make (Void, tokens.double_class_name, double_class)
				-- Type "TUPLE".
			create tuple_type.make (Void)
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
				-- Implicit parent "SYSTEM_OBJECT".
			create a_system_object_parent.make (system_object_class, Void, Void, Void, Void, Void)
			create system_object_parents.make_with_capacity (1)
			system_object_parents.put_first (a_system_object_parent)
				-- Built-in conversion features.
			create integer_convert_feature.make (integer_type)
			create integer_8_convert_feature.make (integer_8_class)
			create integer_16_convert_feature.make (integer_16_class)
			create integer_32_convert_feature.make (integer_32_class)
			create integer_64_convert_feature.make (integer_64_class)
			create natural_convert_feature.make (natural_type)
			create natural_8_convert_feature.make (natural_8_class)
			create natural_16_convert_feature.make (natural_16_class)
			create natural_32_convert_feature.make (natural_32_class)
			create natural_64_convert_feature.make (natural_64_class)
			create real_convert_feature.make (real_type)
			create double_convert_feature.make (double_type)
			create real_32_convert_feature.make (real_32_class)
			create real_64_convert_feature.make (real_64_class)
				-- Needed for compatibility with 5.6.0610 (to be removed later):
			boolean_ref_class := eiffel_class (tokens.boolean_ref_class_name)
			character_8_ref_class := eiffel_class (tokens.character_8_ref_class_name)
			character_32_ref_class := eiffel_class (tokens.character_32_ref_class_name)
			character_ref_class := character_8_ref_class
			basic_classes.force_last (character_ref_class, tokens.character_ref_class_name)
			wide_character_ref_class := character_32_ref_class
			basic_classes.force_last (wide_character_ref_class, tokens.wide_character_ref_class_name)
			integer_8_ref_class := eiffel_class (tokens.integer_8_ref_class_name)
			integer_16_ref_class := eiffel_class (tokens.integer_16_ref_class_name)
			integer_32_ref_class := eiffel_class (tokens.integer_32_ref_class_name)
			integer_64_ref_class := eiffel_class (tokens.integer_64_ref_class_name)
			integer_ref_class := integer_32_ref_class
			basic_classes.force_last (integer_ref_class, tokens.integer_ref_class_name)
			natural_8_ref_class := eiffel_class (tokens.natural_8_ref_class_name)
			natural_16_ref_class := eiffel_class (tokens.natural_16_ref_class_name)
			natural_32_ref_class := eiffel_class (tokens.natural_32_ref_class_name)
			natural_64_ref_class := eiffel_class (tokens.natural_64_ref_class_name)
			natural_ref_class := natural_32_ref_class
			basic_classes.force_last (natural_ref_class, tokens.natural_ref_class_name)
			real_32_ref_class := eiffel_class (tokens.real_32_ref_class_name)
			real_64_ref_class := eiffel_class (tokens.real_64_ref_class_name)
			real_ref_class := real_32_ref_class
			basic_classes.force_last (real_ref_class, tokens.real_ref_class_name)
			double_ref_class := real_64_ref_class
			basic_classes.force_last (double_ref_class, tokens.double_ref_class_name)
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
			string_8_class_not_void: string_8_class /= Void
			string_32_class_not_void: string_32_class /= Void
			array_class_not_void: array_class /= Void
			special_class_not_void: special_class /= Void
			native_array_class_not_void: native_array_class /= Void
			boolean_class_not_void: boolean_class /= Void
			character_class_not_void: character_class /= Void
			character_8_class_not_void: character_8_class /= Void
			character_32_class_not_void: character_32_class /= Void
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
			real_32_class_not_void: real_32_class /= Void
			real_64_class_not_void: real_64_class /= Void
			double_class_not_void: double_class /= Void
			pointer_class_not_void: pointer_class /= Void
			typed_pointer_class_not_void: typed_pointer_class /= Void
			type_class_not_void: type_class /= Void
			routine_class_not_void: routine_class /= Void
			procedure_class_not_void: procedure_class /= Void
			predicate_class_not_void: predicate_class /= Void
			function_class_not_void: function_class /= Void
			arguments_class_not_void: arguments_class /= Void
			identified_routines_class_not_void: identified_routines_class /= Void
			platform_class_not_void: platform_class /= Void
			system_object_class_not_void: system_object_class /= Void
			system_string_class_not_void: system_string_class /= Void
			unknown_class_not_void: unknown_class /= Void
			any_type_not_void: any_type /= Void
			none_type_not_void: none_type /= Void
			integer_type_not_void: integer_type /= Void
			natural_type_not_void: natural_type /= Void
			character_type_not_void: character_type /= Void
			string_type_not_void: string_type /= Void
			real_type_not_void: real_type /= Void
			double_type_not_void: double_type /= Void
			tuple_type_not_void: tuple_type /= Void
			array_any_type_not_void: array_any_type /= Void
			array_none_type_not_void: array_none_type /= Void
			any_parent_not_void: any_parent /= Void
			any_parents_not_void: any_parents /= Void
			system_object_parents_not_void: system_object_parents /= Void
			integer_convert_feature_not_void: integer_convert_feature /= Void
			integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
			integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
			integer_32_convert_feature_not_void: integer_32_convert_feature /= Void
			integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
			natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
			natural_convert_feature_not_void: natural_convert_feature /= Void
			natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
			natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
			natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
			real_convert_feature_not_void: real_convert_feature /= Void
			real_32_convert_feature_not_void: real_32_convert_feature /= Void
			real_64_convert_feature_not_void: real_64_convert_feature /= Void
			double_convert_feature_not_void: double_convert_feature /= Void
			boolean_ref_class_not_void: boolean_ref_class /= Void
			character_ref_class_not_void: character_ref_class /= Void
			character_8_ref_class_not_void: character_8_ref_class /= Void
			character_32_ref_class_not_void: character_32_ref_class /= Void
			wide_character_ref_class_not_void: wide_character_ref_class /= Void
			integer_ref_class_not_void: integer_ref_class /= Void
			integer_8_ref_class_not_void: integer_8_ref_class /= Void
			integer_16_ref_class_not_void: integer_16_ref_class /= Void
			integer_32_ref_class_not_void: integer_16_ref_class /= Void
			integer_64_ref_class_not_void: integer_64_ref_class /= Void
			natural_ref_class_not_void: natural_ref_class /= Void
			natural_8_ref_class_not_void: natural_8_ref_class /= Void
			natural_16_ref_class_not_void: natural_16_ref_class /= Void
			natural_32_ref_class_not_void: natural_32_ref_class /= Void
			natural_64_ref_class_not_void: natural_64_ref_class /= Void
			real_ref_class_not_void: real_ref_class /= Void
			real_32_ref_class_not_void: real_32_ref_class /= Void
			real_64_ref_class_not_void: real_64_ref_class /= Void
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
			-- Reset classes as they were just after they were last parsed.
			-- Do nothing if not parsed.
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
					l_class.reset_after_parsed
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
		end

	reset_classes_incremental is
			-- Reset parts of the classes which may not be valid anymore
			-- because of changes in other classes. Re-processing these
			-- classes will not affect the parts which didn't need to be reset.
			-- This allows to perform incremental code analysis or compilation
			-- when only a few classes have been modified.
			--
			-- For example, when a class have been modified, we need to
			-- reparse that class, but not necessarily the other classes.
			-- When a class has been reparsed, we need to rebuild its ancestors
			-- as well as the ancestors of its descendant classes. When the
			-- ancestors of a class have been rebuilt, we need to rebuild
			-- the feature table for this class. When the feature table of
			-- a class has been rebuild, we need to recheck the validity
			-- of the feature calls in the clients of this class.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_ancestors_status_checker: ET_ANCESTORS_STATUS_CHECKER
			l_flattening_status_checker: ET_FLATTENING_STATUS_CHECKER
			l_interface_status_checker: ET_INTERFACE_STATUS_CHECKER
			l_implementation_status_checker: ET_IMPLEMENTATION_STATUS_CHECKER
		do
				-- Start by taking care of classes containing errors, and
				-- also reset overridden class as they were when last parsed.
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.ancestors_built then
					if l_class.has_ancestors_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_parsed
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_ancestors_error
					end
				end
				if l_class.features_flattened then
					if l_class.has_flattening_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_ancestors_built
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_flattening_error
					end
				end
				if l_class.interface_checked then
					if not l_class.implementation_checked then
							-- It is possible to check the implementation of features
							-- individiually without setting ET_CLASS.implementation_checked.
							-- It is safer to force a reset just in case we are in this
							-- situation.
						l_class.reset_after_interface_checked
					end
					if l_class.has_interface_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_features_flattened
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_interface_error
					end
				end
				if l_class.implementation_checked then
					if l_class.has_implementation_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_interface_checked
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.set_implementation_error
					end
				end
				if l_class.flat_implementation_checked then
					if l_class.has_flat_implementation_error then
							-- This class had an error, so we need to reprocess it.
						l_class.reset_after_interface_checked
					else
							-- We mark this class with an error here to indicate that
							-- we need to check whether it is still correct. If the error
							-- is confirmed (because the class processing has become
							-- invalid due to other classes having been modified or
							-- recursively made invalid), then the class will be reset
							-- to the previous processing step. Otherwise the error
							-- flag will be cleared.
						l_class.reset_flat_implementation_checked
						l_class.set_implementation_error
					end
				end
					-- Reset overridden class as they were when last parsed.
				from
					l_class := l_class.overridden_class
				until
					l_class = Void
				loop
					l_class.reset_after_parsed
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
				-- Reset ancestors building.
			create l_ancestors_status_checker.make (Current)
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.ancestors_built then
					l_class.process (l_ancestors_status_checker)
				end
				l_cursor.forth
			end
				-- Reset feature flattening.
			create l_flattening_status_checker.make (Current)
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.features_flattened then
					l_class.process (l_flattening_status_checker)
				end
				l_cursor.forth
			end
				-- Reset interface checking.
			create l_interface_status_checker.make (Current)
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.interface_checked then
					l_class.process (l_interface_status_checker)
				end
				l_cursor.forth
			end
				-- Reset implementation checking.
			create l_implementation_status_checker.make (Current)
			from l_cursor.start until l_cursor.after loop
				l_class := l_cursor.item
				if l_class.implementation_checked then
					l_class.process (l_implementation_status_checker)
				end
				l_cursor.forth
			end
		end

	reset_errors is
			-- Reset classes as they were before their first error was reported.
			-- Errors will be reported again if classes are processed again.
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_reparse_needed: BOOLEAN
		do
			l_cursor := classes.new_cursor
			from l_cursor.start until l_cursor.after loop
				from
					l_class := l_cursor.item
					if l_class.is_parsed and then l_class.has_syntax_error then
						l_reparse_needed := True
					end
				until
					l_class = Void
				loop
					l_class.reset_errors
					l_class := l_class.overridden_class
				end
				l_cursor.forth
			end
			if l_reparse_needed then
					-- Some classes which had a syntax error will be reparsed.
					-- As a consequence, it is wiser to incrementally reset
					-- the classes that depend on them.
				reset_classes_incremental
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
				Result := l_class.is_preparsed
			else
				basic_classes.search (a_name)
				if basic_classes.found then
					l_class := basic_classes.found_item
					Result := l_class.is_preparsed
				end
			end
		ensure
			is_preparsed: Result implies eiffel_class (a_name).is_preparsed
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
		do
			Result := dotnet_assemblies /= Void and then dotnet_assemblies.count > 0
		end

feature -- Access

	clusters: ET_CLUSTERS
			-- Clusters

	dotnet_assemblies: ET_DOTNET_ASSEMBLIES
			-- .NET assemblies

	root_class: ET_CLASS
			-- Root class

	root_creation: ET_FEATURE_NAME
			-- Root creation procedure

	classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Classes in universe

	basic_classes: DS_HASH_TABLE [ET_CLASS, ET_CLASS_NAME]
			-- Mapping between sized basic type names (e.g. INTEGER, STRING)
			-- and their actual classes (which are stored in `classes' under
			-- their actual names) when aliased

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
				basic_classes.search (a_name)
				if basic_classes.found then
					Result := basic_classes.found_item
				else
					Result := ast_factory.new_class (a_name, classes.count + 1)
					classes.force_last (Result, a_name)
				end
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
			else
				basic_classes.search (a_class_name)
				if basic_classes.found then
					Result := basic_classes.found_item
				end
			end
		end

	classes_by_group (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes in universe which are in `a_group';
			-- Create a new list at each call
		require
			a_group_not_void: a_group /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_by_group_capacity)
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				from
					a_class := a_cursor.item
				until
					a_class = Void
				loop
					if a_class.group = a_group then
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

	classes_in_group (a_group: ET_GROUP): DS_ARRAYED_LIST [ET_CLASS] is
			-- Classes in universe which are in `a_group'
			-- or recursively in one of its subgroups;
			-- Create a new list at each call
		require
			a_group_not_void: a_group /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class: ET_CLASS
		do
			create Result.make (initial_classes_by_group_capacity)
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				from
					a_class := a_cursor.item
				until
					a_class = Void
				loop
					if a_class.is_in_group (a_group) then
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

	classes_by_groups: DS_HASH_TABLE [DS_ARRAYED_LIST [ET_CLASS], ET_GROUP] is
			-- Classes in universe indexed by groups;
			-- Create a new data structure at each call
		local
			l_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			l_class: ET_CLASS
			l_group: ET_GROUP
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
					l_group := l_class.group
					Result.search (l_group)
					if Result.found then
						l_classes := Result.found_item
					else
						create l_classes.make (initial_classes_by_group_capacity)
						Result.force_last (l_classes, l_group)
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

	string_8_class: ET_CLASS
			-- Class "STRING_8"

	string_32_class: ET_CLASS
			-- Class "STRING_32"

	array_class: ET_CLASS
			-- Class "ARRAY"

	special_class: ET_CLASS
			-- Class "SPECIAL"

	native_array_class: ET_CLASS
			-- Class "NATIVE_ARRAY"

	boolean_class: ET_CLASS
			-- Class "BOOLEAN"

	character_class: ET_CLASS
			-- Class "CHARACTER"

	character_8_class: ET_CLASS
			-- Class "CHARACTER_8"

	character_32_class: ET_CLASS
			-- Class "CHARACTER_32"

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

	real_32_class: ET_CLASS
			-- Class "REAL_32"

	real_64_class: ET_CLASS
			-- Class "REAL_64"

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

	identified_routines_class: ET_CLASS
			-- Class "IDENTIFIED_ROUTINES"

	platform_class: ET_CLASS
			-- Class "PLATFORM"

	system_object_class: ET_CLASS
			-- Class "SYSTEM_OBJECT" (in Eiffel for .NET)

	system_string_class: ET_CLASS
			-- Class "SYSTEM_STRING" (in Eiffel for .NET)

	unknown_class: ET_CLASS
			-- Class "*UNKNOWN*"
			-- This class is equal to no other classes, not even itself;
			-- it does conform to no type, not even itself, and no type
			-- conforms to it

	any_type: ET_CLASS_TYPE
			-- Class type "ANY"

	none_type: ET_CLASS_TYPE
			-- Class type "NONE"

	integer_type: ET_CLASS_TYPE
			-- Class type "INTEGER"
			-- (To be used instead of `integer_class' when the name of the type
			-- matters, in error messages for example where it will display "INTEGER"
			-- instead of say "INTEGER_32" if it is mapped this way.)

	natural_type: ET_CLASS_TYPE
			-- Class type "NATURAL"
			-- (To be used instead of `natural_class' when the name of the type
			-- matters, in error messages for example where it will display "NATURAL"
			-- instead of say "NATURAL_32" if it is mapped this way.)

	character_type: ET_CLASS_TYPE
			-- Class type "CHARACTER"
			-- (To be used instead of `character_class' when the name of the type
			-- matters, in error messages for example where it will display "CHARACTER"
			-- instead of say "CHARACTER_8" if it is mapped this way.)

	string_type: ET_CLASS_TYPE
			-- Class type "STRING"
			-- (To be used instead of `string_class' when the name of the type
			-- matters, in error messages for example where it will display "STRING"
			-- instead of say "STRING_8" if it is mapped this way.)

	real_type: ET_CLASS_TYPE
			-- Class type "REAL"
			-- (To be used instead of `real_class' when the name of the type
			-- matters, in error messages for example where it will display "REAL"
			-- instead of say "REAL_32" if it is mapped this way.)

	double_type: ET_CLASS_TYPE
			-- Class type "DOUBLE"
			-- (To be used instead of `double_class' when the name of the type
			-- matters, in error messages for example where it will display "DOUBLE"
			-- instead of say "REAL_64" if it is mapped this way.)

	tuple_type: ET_TUPLE_TYPE
			-- Class type "TUPLE"

	array_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [ANY]"

	array_none_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [NONE]"

	any_parent: ET_PARENT
			-- Default parent

	any_parents: ET_PARENT_LIST
			-- Default parents

	system_object_parents: ET_PARENT_LIST
			-- Default parents under .NET

feature -- Basic classes (compatibility with 5.6.0610, to be removed later)

	boolean_ref_class: ET_CLASS
			-- Class "BOOLEAN_REF"

	character_ref_class: ET_CLASS
			-- Class "CHARACTER_REF"

	character_8_ref_class: ET_CLASS
			-- Class "CHARACTER_8_REF"

	character_32_ref_class: ET_CLASS
			-- Class "CHARACTER_32_REF"

	wide_character_ref_class: ET_CLASS
			-- Class "WIDE_CHARACTER_REF"

	integer_ref_class: ET_CLASS
			-- Class "INTEGER_REF"

	integer_8_ref_class: ET_CLASS
			-- Class "INTEGER_8_REF"

	integer_16_ref_class: ET_CLASS
			-- Class "INTEGER_16_REF"

	integer_32_ref_class: ET_CLASS
			-- Class "INTEGER_32_REF"

	integer_64_ref_class: ET_CLASS
			-- Class "INTEGER_64_REF"

	natural_ref_class: ET_CLASS
			-- Class "NATURAL_REF"

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

	real_32_ref_class: ET_CLASS
			-- Class "REAL_32_REF"

	real_64_ref_class: ET_CLASS
			-- Class "REAL_64_REF"

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

	integer_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER

	integer_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_8

	integer_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_16

	integer_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_32

	integer_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_64

	natural_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to NATURAL

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

	real_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_32

	real_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_64

	double_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to DOUBLE

	default_create_seed: INTEGER
			-- Seed of feature 'default_create' in class ANY

	copy_seed: INTEGER
			-- Seed of feature 'copy' in class ANY

	void_seed: INTEGER
			-- Seed of feature 'Void' in class ANY

	routine_call_seed: INTEGER
			-- Seed of feature 'call' in class ROUTINE

	function_item_seed: INTEGER
			-- Seed of feature 'item' in class FUNCTION

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
			a_seed_not_negative: a_seed >= 0
		do
			default_create_seed := a_seed
		ensure
			default_create_seed_set: default_create_seed = a_seed
		end

	set_copy_seed (a_seed: INTEGER) is
			-- Set `copy_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			copy_seed := a_seed
		ensure
			copy_seed_set: copy_seed = a_seed
		end

	set_void_seed (a_seed: INTEGER) is
			-- Set `void_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			void_seed := a_seed
		ensure
			void_seed_set: void_seed = a_seed
		end

	set_routine_call_seed (a_seed: INTEGER) is
			-- Set `routine_call_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			routine_call_seed := a_seed
		ensure
			routine_call_seed_set: routine_call_seed = a_seed
		end

	set_function_item_seed (a_seed: INTEGER) is
			-- Set `function_item_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			function_item_seed := a_seed
		ensure
			function_item_seed_set: function_item_seed = a_seed
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

feature -- Inline constant registration

	register_inline_constant (a_constant: ET_INLINE_CONSTANT) is
			-- Register `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			inline_constant_count := inline_constant_count + 1
			a_constant.set_id (inline_constant_count)
		end

	inline_constant_count: INTEGER
			-- Number of inline constants already registered

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
			parsed_classes_count_not_negative: Result >= 0
		end

	cluster_count: INTEGER is
			-- Number (recursively) of non-abstract clusters
		do
			if clusters /= Void then
				Result := clusters.count
			end
		ensure
			cluster_count_not_negavite: Result >= 0
		end

	override_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only override clusters
		do
			if clusters /= Void then
				Result := clusters.override_count
			end
		ensure
			override_cluster_count_not_negavite: Result >= 0
		end

	read_write_cluster_count: INTEGER is
			-- Number (recursively) of non-abstract non-read-only clusters
		do
			if clusters /= Void then
				Result := clusters.read_write_count
			end
		ensure
			read_write_cluster_count_not_negavite: Result >= 0
		end

	dotnet_assembly_count: INTEGER is
			-- Number of .NET assemblies
		do
			if dotnet_assemblies /= Void then
				Result := dotnet_assemblies.count
			end
		ensure
			dotnet_assembly_count_not_negavite: Result >= 0
		end

feature -- Setting

	set_non_aliased_sized_basic_classes is
			-- Set sized basic types (STRING, CHARACTER, WIDE_CHARACTER,
			-- INTEGER, NATURAL, REAL, DOUBLE) to be non-aliased.
		local
			l_name: ET_CLASS_NAME
		do
				-- Class "STRING".
			l_name := tokens.string_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				string_class := eiffel_class (l_name)
				string_class.set_in_system (True)
				create string_type.make (Void, tokens.string_class_name, string_class)
			end
				-- Class "CHARACTER".
			l_name := tokens.character_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				character_class := eiffel_class (l_name)
				character_class.set_in_system (True)
				create character_type.make (Void, tokens.character_class_name, character_class)
			end
				-- Class "CHARACTER_REF".
			l_name := tokens.character_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				character_ref_class := eiffel_class (l_name)
				character_ref_class.set_in_system (True)
			end
				-- Class "WIDE_CHARACTER".
			l_name := tokens.wide_character_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				wide_character_class := eiffel_class (l_name)
				wide_character_class.set_in_system (True)
			end
				-- Class "WIDE_CHARACTER_REF".
			l_name := tokens.wide_character_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				wide_character_ref_class := eiffel_class (l_name)
				wide_character_ref_class.set_in_system (True)
			end
				-- Class "INTEGER".
			l_name := tokens.integer_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				integer_class := eiffel_class (l_name)
				integer_class.set_in_system (True)
				create integer_type.make (Void, tokens.integer_class_name, integer_class)
				create integer_convert_feature.make (integer_type)
			end
				-- Class "INTEGER_REF".
			l_name := tokens.integer_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				integer_ref_class := eiffel_class (l_name)
				integer_ref_class.set_in_system (True)
			end
				-- Class "NATURAL".
			l_name := tokens.natural_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				natural_class := eiffel_class (l_name)
				natural_class.set_in_system (True)
				create natural_type.make (Void, tokens.natural_class_name, natural_class)
				create natural_convert_feature.make (natural_type)
			end
				-- Class "NATURAL_REF".
			l_name := tokens.natural_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				natural_ref_class := eiffel_class (l_name)
				natural_ref_class.set_in_system (True)
			end
				-- Class "REAL".
			l_name := tokens.real_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				real_class := eiffel_class (l_name)
				real_class.set_in_system (True)
				create real_type.make (Void, tokens.real_class_name, real_class)
				create real_convert_feature.make (real_type)
			end
				-- Class "REAL_REF".
			l_name := tokens.real_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				real_ref_class := eiffel_class (l_name)
				real_ref_class.set_in_system (True)
			end
				-- Class "DOUBLE".
			l_name := tokens.double_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				double_class := eiffel_class (l_name)
				double_class.set_in_system (True)
				create double_type.make (Void, tokens.double_class_name, double_class)
				create double_convert_feature.make (double_type)
			end
				-- Class "DOUBLE_REF".
			l_name := tokens.double_ref_class_name
			basic_classes.search (l_name)
			if basic_classes.found then
				basic_classes.remove_found_item
				double_ref_class := eiffel_class (l_name)
				double_ref_class.set_in_system (True)
			end
		end

	set_default_aliased_sized_basic_classes is
			-- Set sized basic types (STRING, CHARACTER, WIDE_CHARACTER,
			-- INTEGER, NATURAL, REAL, DOUBLE) to be aliased to their default.
		local
			l_name: ET_CLASS_NAME
		do
				-- Class "STRING".
			l_name := tokens.string_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				string_class := string_8_class
				basic_classes.force_last (string_class, l_name)
				create string_type.make (Void, tokens.string_class_name, string_class)
			end
				-- Class "CHARACTER".
			l_name := tokens.character_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				character_class := character_8_class
				basic_classes.force_last (character_class, l_name)
				create character_type.make (Void, tokens.character_class_name, character_class)
			end
				-- Class "CHARACTER_REF".
			l_name := tokens.character_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				character_ref_class := character_8_ref_class
				basic_classes.force_last (character_ref_class, l_name)
			end
				-- Class "WIDE_CHARACTER".
			l_name := tokens.wide_character_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				wide_character_class := character_32_class
				basic_classes.force_last (wide_character_class, l_name)
			end
				-- Class "WIDE_CHARACTER_REF".
			l_name := tokens.wide_character_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				wide_character_ref_class := character_32_ref_class
				basic_classes.force_last (wide_character_ref_class, l_name)
			end
				-- Class "INTEGER".
			l_name := tokens.integer_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				integer_class := integer_32_class
				basic_classes.force_last (integer_class, l_name)
				create integer_type.make (Void, tokens.integer_class_name, integer_class)
				create integer_convert_feature.make (integer_type)
			end
				-- Class "INTEGER_REF".
			l_name := tokens.integer_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				integer_ref_class := integer_32_ref_class
				basic_classes.force_last (integer_ref_class, l_name)
			end
				-- Class "NATURAL".
			l_name := tokens.natural_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				natural_class := natural_32_class
				basic_classes.force_last (natural_class, l_name)
				create natural_type.make (Void, tokens.natural_class_name, natural_class)
				create natural_convert_feature.make (natural_type)
			end
				-- Class "NATURAL_REF".
			l_name := tokens.natural_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				natural_ref_class := natural_32_ref_class
				basic_classes.force_last (natural_ref_class, l_name)
			end
				-- Class "REAL".
			l_name := tokens.real_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				real_class := real_32_class
				basic_classes.force_last (real_class, l_name)
				create real_type.make (Void, tokens.real_class_name, real_class)
				create real_convert_feature.make (real_type)
			end
				-- Class "REAL_REF".
			l_name := tokens.real_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				real_ref_class := real_32_ref_class
				basic_classes.force_last (real_ref_class, l_name)
			end
				-- Class "DOUBLE".
			l_name := tokens.double_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				double_class := real_64_class
				basic_classes.force_last (double_class, l_name)
				create double_type.make (Void, tokens.double_class_name, double_class)
				create double_convert_feature.make (double_type)
			end
				-- Class "DOUBLE_REF".
			l_name := tokens.double_ref_class_name
			basic_classes.search (l_name)
			if not basic_classes.found then
				classes.remove (l_name)
				double_ref_class := real_64_ref_class
				basic_classes.force_last (double_ref_class, l_name)
			end
		end

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

	set_clusters (a_clusters: like clusters) is
			-- Set `a_clusters' to `clusters'.
		do
			clusters := a_clusters
		ensure
			clusters_set: clusters = a_clusters
		end

	set_dotnet_assemblies (a_assemblies: like dotnet_assemblies) is
			-- Set `a_assemblies' to `dotnet_assemblies'.
		do
			dotnet_assemblies := a_assemblies
		ensure
			dotnet_assemblies_set: dotnet_assemblies = a_assemblies
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

feature -- Compilation options

	console_application_mode: BOOLEAN
			-- Should the generated application be a console application
			-- (or a Windows GUI application)?

	trace_mode: BOOLEAN
			-- Should the generated application be compiled with trace turned on?

	system_name: STRING
			-- Name of system

	external_include_pathnames: DS_ARRAYED_LIST [STRING]
			-- External include pathnames

	external_object_pathnames: DS_ARRAYED_LIST [STRING]
			-- External object pathnames

	external_library_pathnames: DS_ARRAYED_LIST [STRING]
			-- External library pathnames

feature -- Compilation options setting

	set_console_application_mode (b: BOOLEAN) is
			-- Set `console_application_mode' to `b'.
		do
			console_application_mode := b
		ensure
			console_application_mode_set: console_application_mode = b
		end

	set_trace_mode (b: BOOLEAN) is
			-- Set `trace_mode' to `b'.
		do
			trace_mode := b
		ensure
			trace_mode_set: trace_mode = b
		end

	set_system_name (a_name: like system_name) is
			-- Set `system_name' to `a_name'.
		do
			system_name := a_name
		ensure
			system_name_set: system_name = a_name
		end

	set_external_include_pathnames (a_pathnames: like external_include_pathnames) is
			-- Set `external_include_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has (Void)
		do
			external_include_pathnames := a_pathnames
		ensure
			external_include_pathnames_set: external_include_pathnames = a_pathnames
		end

	set_external_object_pathnames (a_pathnames: like external_object_pathnames) is
			-- Set `external_object_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has (Void)
		do
			external_object_pathnames := a_pathnames
		ensure
			external_object_pathnames_set: external_object_pathnames = a_pathnames
		end

	set_external_library_pathnames (a_pathnames: like external_library_pathnames) is
			-- Set `external_library_pathnames' to `a_pathnames'.
		require
			a_pathnames_not_void: a_pathnames /= Void
			no_void_pathname: not a_pathnames.has (Void)
		do
			external_library_pathnames := a_pathnames
		ensure
			external_library_pathnames_set: external_library_pathnames = a_pathnames
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

	set_default_keyword_usage is
			-- Set default keyword usage.
		do
			set_use_assign_keyword (True)
			set_use_attribute_keyword (True)
			set_use_convert_keyword (True)
			set_use_create_keyword (True)
			set_use_recast_keyword (False)
			set_use_reference_keyword (True)
			set_use_void_keyword (True)
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

	suppliers_enabled: BOOLEAN
			-- Should suppliers of classes be computed?

feature -- Implementation checking status setting

	set_flat_mode (b: BOOLEAN) is
			-- Set `flat_mode' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			flat_mode := b
			if b then
				a_checker ?= flat_implementation_checker
			else
				a_checker ?= implementation_checker
			end
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
			a_checker ?= flat_implementation_checker
			if a_checker /= Void then
				a_checker.set_flat_dbc_mode (b)
			end
		ensure
			flat_dbc_mode_set: flat_dbc_mode = b
		end

	set_suppliers_enabled (b: BOOLEAN) is
			-- Set `suppliers_enabled' to `b'.
		local
			a_checker: ET_IMPLEMENTATION_CHECKER
		do
			suppliers_enabled := b
			a_checker ?= implementation_checker
			if a_checker /= Void then
				a_checker.set_suppliers_enabled (b)
			end
			a_checker ?= flat_implementation_checker
			if a_checker /= Void then
				a_checker.set_suppliers_enabled (b)
			end
		ensure
			suppliers_enabled_set: suppliers_enabled = b
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
			-- Also consume .NET assemblies.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_shallow (clusters)
				end
				if dotnet_assemblies /= Void then
					dotnet_assembly_consumer.consume_assemblies (dotnet_assemblies)
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
			-- Also consume .NET assemblies.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_single (clusters)
				end
				if dotnet_assemblies /= Void then
					dotnet_assembly_consumer.consume_assemblies (dotnet_assemblies)
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
			-- Also consume .NET assemblies.
		do
			if not is_preparsed then
				if clusters /= Void then
					eiffel_preparser.preparse_clusters_multiple (clusters)
				end
				if dotnet_assemblies /= Void then
					dotnet_assembly_consumer.consume_assemblies (dotnet_assemblies)
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_shallow
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist anymore).
				create a_modified.make (False)
				reset_modified_classes (True, False, False, False, a_modified)
				eiffel_preparser.repreparse_clusters_shallow (clusters, False, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
				create a_modified.make (False)
				reset_modified_classes (False, False, False, False, a_modified)
				eiffel_preparser.repreparse_clusters_single (clusters, False, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_multiple
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				create a_modified.make (False)
				reset_modified_classes (False, False, False, False, a_modified)
				eiffel_preparser.repreparse_clusters_multiple (clusters, False, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_shallow
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist anymore).
				create a_modified.make (False)
				reset_modified_classes (True, False, True, False, a_modified)
				eiffel_preparser.repreparse_clusters_shallow (clusters, True, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_single
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
				create a_modified.make (False)
				reset_modified_classes (False, False, True, False, a_modified)
				eiffel_preparser.repreparse_clusters_single (clusters, True, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				preparse_multiple
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				create a_modified.make (False)
				reset_modified_classes (False, False, True, False, a_modified)
				eiffel_preparser.repreparse_clusters_multiple (clusters, True, False)
				if a_modified.item or eiffel_preparser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			-- Also consume .NET assemblies.
		do
			if clusters /= Void then
				eiffel_parser.parse_clusters (clusters)
			end
			if dotnet_assemblies /= Void then
				dotnet_assembly_consumer.consume_assemblies (dotnet_assemblies)
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				parse_all
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				create a_modified.make (False)
				reset_modified_classes (False, True, False, False, a_modified)
				eiffel_parser.reparse_clusters (clusters, False, False)
				if a_modified.item or eiffel_parser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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
			a_modified: DS_CELL [BOOLEAN]
		do
			if not is_preparsed then
				parse_all
			elseif clusters /= Void then
					-- Take care of possibly removed classes (either their old files do not exist
					-- anymore, or they have been modified and may contain another class).
					-- Note that if a file contains two classes and is modified between the
					-- time we check the first class and the second class then the preparse
					-- will give inconsistent results and will need to be rerun again.
				create a_modified.make (False)
				reset_modified_classes (False, True, True, False, a_modified)
				eiffel_parser.reparse_clusters (clusters, True, False)
				if a_modified.item or eiffel_parser.overriding_class_added then
						-- A class has been modified (or removed) or
						-- may have been overridden by a new class.
					reset_classes_incremental
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

feature {NONE} -- Parsing

	reset_modified_classes (a_shallow, a_parse_all, a_override, a_read_only: BOOLEAN; a_modified: DS_CELL [BOOLEAN]) is
			-- Take care of modified and possibly removed classes (either their
			-- old files do not exist anymore, or they have been modified and
			-- may contain another class) so that they will be (pre)parsed again.
			-- Note that if a file contains two classes and is modified between
			-- the time we check the first class and the second class then the
			-- re(pre)parse will give inconsistent results and will need to be
			-- rerun again.
			-- `a_shallow' means that the "shallow" algorithm is been used for
			-- preparsing (i.e. the file is named "classname.e").
			-- `a_parse_all' means that files will be fully parsed without going
			-- through the preparsing phase.
			-- `a_override' means that only override clusters are taken into account.
			-- `a_read_only' means that read-only clusters are taken into account.
		require
			a_modified_not_void: a_modified /= Void
		local
			a_cursor: DS_HASH_TABLE_CURSOR [ET_CLASS, ET_CLASS_NAME]
			a_class, a_class1, a_class2: ET_CLASS
			a_time_stamp: INTEGER
			a_cluster: ET_CLUSTER
		do
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
					--
					-- Start to process the overridden classes.
					--
				from
					a_class1 := a_class
					a_class2 := a_class1.overridden_class
				until
					a_class2 = Void
				loop
					if a_class2.is_preparsed and then (a_parse_all implies a_class2.is_parsed) then
						if a_class2.is_in_cluster then
							a_cluster := a_class2.group.cluster
							if a_override and then not a_cluster.is_override then
									-- This class does not belong to an override cluster.
									-- Just skip it.
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif not a_read_only and then a_cluster.is_read_only then
									-- This class belongs to an read-only cluster (i.e. a cluster
									-- which is not traversed again during incremental compilation).
									-- Just skip this class.
								a_class1 := a_class2
								a_class2 := a_class1.overridden_class
							elseif a_cluster.is_abstract then
									-- The class belongs to a cluster which is marked as abstract.
									-- This means that the class of this cluster are ignored.
									-- So we have to get rid of this class.
								a_class2 := a_class2.overridden_class
								a_class1.set_overridden_class (a_class2)
							elseif not a_shallow or else a_class2.is_parsed then
									-- With the "shallow" algorithm the time-stamp is only set when
									-- parsing the class. Hence the test above.
								a_time_stamp := a_class2.time_stamp
								if a_time_stamp < 0 or else file_system.file_time_stamp (a_class2.filename) /= a_time_stamp then
										-- The time-stamp of the file has changed or was never recorded.
										-- The file may have been modified or removed. Get rid of this
										-- class so that the (pre-)parser will look for its content again.
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
										-- The time-stamp of tje file has not changed.
										-- Just skip this class.
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							elseif a_shallow then
									-- The class is not marked as parsed. It has only been
									-- preparsed using the "shallow" algorithm (i.e. the
									-- file is named "classname.e").
								if not file_system.file_exists (a_class2.filename) then
										-- The file does not exist anymore.
										-- So we have to get rid of this class.
									a_class2 := a_class2.overridden_class
									a_class1.set_overridden_class (a_class2)
								else
										-- The file still exists.
										-- Just skip this class.
									a_class1 := a_class2
									a_class2 := a_class1.overridden_class
								end
							end
						elseif a_class2.is_in_dotnet_assembly then
								-- This class belongs to a .NET assembly.
								-- Just skip it.
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						else
								-- This class does not belong to a cluster.
								-- Just skip it.
							a_class1 := a_class2
							a_class2 := a_class1.overridden_class
						end
					elseif a_override then
							-- This class is not preparsed and hence not in an
							-- override cluster. Just skip it.
						a_class1 := a_class2
						a_class2 := a_class1.overridden_class
					else
							-- This class is not preparsed. We can just
							-- get rid of it since it belongs to no group.
						a_class2 := a_class2.overridden_class
						a_class1.set_overridden_class (a_class2)
					end
				end
					--
					-- Now take care of the master class.
					--
				if a_class.is_preparsed and then (a_parse_all implies a_class.is_parsed) then
					if a_class.is_in_cluster then
						a_cluster := a_class.group.cluster
						if a_override and then not a_cluster.is_override then
							-- This class does not belong to an override cluster.
							-- Just skip it.
						elseif not a_read_only and then a_cluster.is_read_only then
							-- This class belongs to an read-only cluster (i.e. a cluster
							-- which is not traversed again during incremental compilation).
							-- Just skip this class.
						elseif a_cluster.is_abstract then
								-- The class belongs to a cluster which is marked as abstract.
								-- This means that the class of this cluster are ignored.
								-- So we can get rid of this class if it overrides other
								-- classes. Otherwise we will mark it as not preparsed.
							a_modified.put (True)
							a_class2 := a_class.overridden_class
							if a_class2 /= Void then
								a_class2.reset_after_parsed
								a_class.copy (a_class2)
							else
								a_class.reset
							end
						elseif not a_shallow or else a_class.is_parsed then
								-- With the "shallow" algorithm the time-stamp is only set when
								-- parsing the class. Hence the test above.
							a_time_stamp := a_class.time_stamp
							if a_time_stamp < 0 or else file_system.file_time_stamp (a_class.filename) /= a_time_stamp then
									-- The time-stamp of the file has changed or was never recorded.
									-- The file may have been modified or removed. Get rid of this
									-- class if it overrides other class, or otherwise mark it as
									-- not preparsed. That way the (pre-)parser will look for its
									-- content again.
								a_modified.put (True)
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class2.reset_after_parsed
									a_class.copy (a_class2)
								else
									a_class.reset
								end
							end
						elseif a_shallow then
								-- The class is not marked as parsed. It has only been
								-- preparsed using the "shallow" algorithm (i.e. the
								-- file is named "classname.e").
							if not file_system.file_exists (a_class.filename) then
									-- The file does not exist anymore. Get rid of this
									-- class if it overrides other class, or otherwise mark it as
									-- not preparsed. That way the (pre-)parser will look for its
									-- content again.
								a_modified.put (True)
								a_class2 := a_class.overridden_class
								if a_class2 /= Void then
									a_class2.reset_after_parsed
									a_class.copy (a_class2)
								else
									a_class.reset
								end
							end
						end
					elseif a_class.is_in_dotnet_assembly then
						-- This class belongs to a .NET assembly.
						-- Just skip it.
					else
						-- This class does not belong to a cluster.
						-- Just skip it.
					end
				elseif a_override then
						-- This class is not preparsed and hence not in an
						-- override cluster. Just skip it.
					if a_class.is_parsed then
							-- When reporting VTCT errors on a class, `is_parsed'
							-- is set to True even if it was not preparsed
							-- (and hence not actually parsed).
						a_class.reset_parsed
					end
				else
						-- This class is not preparsed. We can get rid of it if it
						-- overrides other classes since it belongs to no group.
						-- Otherwise we will let it marked as not preparsed.
					a_class2 := a_class.overridden_class
					if a_class2 /= Void then
						a_modified.put (True)
						a_class2.reset_after_parsed
						a_class.copy (a_class2)
					elseif a_class.is_parsed then
							-- When reporting VTCT errors on a class, `is_parsed'
							-- is set to True even if it was not preparsed
							-- (and hence not actually parsed).
						a_modified.put (True)
						a_class.reset_parsed
					elseif a_parse_all then
						a_modified.put (True)
						a_class.reset
					end
				end
				a_cursor.forth
			end
		end

feature -- Compilation status report

	is_ecma: BOOLEAN is
			-- Should the compilation process use ECMA's semantics?
		do
			Result := (ecma_version /= Void)
		ensure
			definition: Result = (ecma_version /= Void)
		end

	ecma_version: UT_VERSION
			-- ECMA version, if any, whose semantics should be
			-- used by the compilation process

	is_ise: BOOLEAN is
			-- Should the compilation process use ISE's semantics?
		do
			Result := (ise_version /= Void)
		ensure
			definition: Result = (ise_version /= Void)
		end

	ise_version: UT_VERSION
			-- ISE version, if any, whose semantics should be
			-- used by the compilation process

feature -- Compilation setting

	set_ecma_version (a_version: like ecma_version) is
			-- Set `ecma_version' to `a_version'.
		do
			ecma_version := a_version
			if ecma_version /= Void then
				set_use_assign_keyword (True)
				set_use_attribute_keyword (True)
				set_use_convert_keyword (True)
				set_use_create_keyword (True)
				set_use_recast_keyword (False)
				set_use_reference_keyword (True)
				set_use_void_keyword (True)
				set_default_aliased_sized_basic_classes
			elseif ise_version /= Void then
				set_ise_version (ise_version)
			else
				set_default_keyword_usage
				set_default_aliased_sized_basic_classes
			end
		ensure
			ecma_version_set: ecma_version = a_version
		end

	set_ise_version (a_version: like ise_version) is
			-- Set `ise_version' to `a_version'.
		do
			ise_version := a_version
			if ise_version /= Void then
				set_use_assign_keyword (True)
				set_use_attribute_keyword (False)
				set_use_convert_keyword (True)
				set_use_create_keyword (True)
				set_use_recast_keyword (False)
				set_use_reference_keyword (True)
				set_use_void_keyword (True)
				if ise_version < ise_5_7_60362 then
					set_non_aliased_sized_basic_classes
				else
					set_default_aliased_sized_basic_classes
				end
			elseif ecma_version /= Void then
				set_ecma_version (ecma_version)
			else
				set_default_keyword_usage
				set_default_aliased_sized_basic_classes
			end
		ensure
			ise_version_set: ise_version = a_version
		end

feature -- Compilation

	compile is
			-- Compile universe.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
		do
			if root_class = Void or root_class = none_class or root_class = any_class then
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
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			preparse_single
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 6")
				dt1 := l_clock.system_clock.date_time_now
			end
			parse_system
			if error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Preparsed ")
				error_handler.info_file.put_integer (classes.count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (parsed_classes_count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (feature_count)
				error_handler.info_file.put_line (" features")
			end
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			if error_handler.benchmark_shown then
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
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
--			preparse_single
--			if error_handler.benchmark_shown then
--				print_time (dt1, "Degree 6")
--				dt1 := l_clock.system_clock.date_time_now
--			end
--			compile_degree_5
			parse_all
			check_provider_validity
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 5")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_4
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 4")
				dt1 := l_clock.system_clock.date_time_now
			end
			compile_degree_3
			if error_handler.benchmark_shown then
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
			if error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (classes.count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (feature_count)
				error_handler.info_file.put_line (" features")
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
			if error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Flattened ")
				error_handler.info_file.put_integer (nb)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (feature_count)
				error_handler.info_file.put_line (" features")
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
			a_processor: ET_AST_PROCESSOR
		do
				-- Check implementation.
			if flat_mode then
				a_processor := flat_implementation_checker
			else
				a_processor := implementation_checker
			end
			a_checker ?= a_processor
			if a_checker /= Void then
				a_checker.set_flat_mode (flat_mode)
				a_checker.set_flat_dbc_mode (flat_dbc_mode)
				a_checker.set_suppliers_enabled (suppliers_enabled)
			end
			a_cursor := classes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_class := a_cursor.item
				if a_class.interface_checked then
					a_class.process (a_processor)
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

	report_expression_supplier (a_supplier: ET_TYPE_CONTEXT; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of an expression
			-- in `a_feature' in type `a_client'.
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

	report_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_routine: ET_ROUTINE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of `a_routine' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_routine_not_void: a_routine /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_argument_supplier (a_supplier, a_client, a_routine)
			end
		end

	report_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_query: ET_QUERY) is
			-- Report the fact that `a_supplier' is the type of the result
			-- of `a_query' in type `a_client'.
			-- (Note that `a_supplier' is assumed to be interpreted in
			-- the context of `a_client'.)
		require
			a_supplier_not_void: a_supplier /= Void
			a_client_not_void: a_client /= Void
			a_client_valid: a_client.is_valid_context
			a_query_not_void: a_query /= Void
		do
			if supplier_handler /= Void then
				supplier_handler.report_result_supplier (a_supplier, a_client, a_query)
			end
		end

	report_static_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a static call
			-- in `a_feature' in type `a_client'.
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

	report_create_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the explicit type of a
			-- creation instruction or expression in `a_feature' in type `a_client'.
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
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of `a_feature' in type `a_client'.
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

	report_inline_agent_argument_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a formal argument
			-- of an inline agent in `a_feature' in type `a_client'.
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
				supplier_handler.report_inline_agent_argument_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_local_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of a local variable
			-- of an inline agent in `a_feature' in type `a_client'.
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
				supplier_handler.report_inline_agent_local_supplier (a_supplier, a_client, a_feature)
			end
		end

	report_inline_agent_result_supplier (a_supplier: ET_TYPE; a_client: ET_BASE_TYPE; a_feature: ET_STANDALONE_CLOSURE) is
			-- Report the fact that `a_supplier' is the type of the result of
			-- an inline agent in `a_feature' in type `a_client'.
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
				supplier_handler.report_inline_agent_result_supplier (a_supplier, a_client, a_feature)
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

	dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER is
			-- .NET assembly consumer
		do
			Result := internal_dotnet_assembly_consumer
			if Result = Void then
				create {ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER} Result.make (Current)
				internal_dotnet_assembly_consumer := Result
			end
		ensure
			dotnet_assembly_consumer_not_void: Result /= Void
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

	flat_implementation_checker: ET_AST_PROCESSOR
			-- Implementation checker in flat mode

	null_processor: ET_AST_NULL_PROCESSOR
			-- Null processor

	activate_processors is
			-- Activate processors.
		local
			l_feature_flattener: ET_FEATURE_FLATTENER
			l_interface_checker: ET_INTERFACE_CHECKER
			l_implementation_checker: ET_IMPLEMENTATION_CHECKER
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
			if flat_implementation_checker = null_processor then
				create l_implementation_checker.make (Current)
				l_implementation_checker.set_flat_mode (True)
				flat_implementation_checker := l_implementation_checker
			end
		end

	set_dotnet_assembly_consumer (a_consumer: like dotnet_assembly_consumer) is
			-- Set `dotnet_assembly_consumer' to `a_consumer'.
		require
			a_consumer_not_void: a_consumer /= Void
		do
			internal_dotnet_assembly_consumer := a_consumer
		ensure
			dotnet_assembly_consumer_set: dotnet_assembly_consumer = a_consumer
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

	set_flat_implementation_checker (a_checker: like flat_implementation_checker) is
			-- Set `flat_implementation_chcker' to `a_checker'.
		require
			a_checker_not_void: a_checker /= Void
		do
			flat_implementation_checker := a_checker
		ensure
			flat_implementation_checker_set: flat_implementation_checker = a_checker
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
			error_handler.info_file.put_string (a_degree)
			error_handler.info_file.put_string (": ")
			error_handler.info_file.put_line (dtd.out)
			debug ("stop")
				io.read_line
			end
		end

feature {NONE} -- Implementation

	internal_eiffel_preparser: ET_EIFFEL_PREPARSER
			-- Eiffel preparser

	internal_eiffel_parser: ET_EIFFEL_PARSER
			-- Eiffel parser

	internal_dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer

feature {NONE} -- Constants

	sized_basic_type_count: INTEGER is 13
			-- Number of sized basic types
			-- (STRING, CHARATER, WIDE_CHARACTER, INTEGER, NATURAL, REAL, DOUBLE,
			-- CHARACTER_REF, WIDE_CHARACTER_REF, INTEGER_REF, NATURAL_REF, REAL_REF, DOUBLE_REF)

	initial_classes_by_group_capacity: INTEGER is
			-- Initial capacity for `classes_by_group'
		once
			Result := 20
		ensure
			capacity_positive: Result > 0
		end

invariant

	classes_not_void: classes /= Void
	no_void_class: not classes.has_item (Void)
	basic_classes_not_void: basic_classes /= Void
	no_void_basic_class: not basic_classes.has_item (Void)
	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
	any_class_not_void: any_class /= Void
	general_class_not_void: general_class /= Void
	none_class_not_void: none_class /= Void
	tuple_class_not_void: tuple_class /= Void
	bit_class_not_void: bit_class /= Void
	string_class_not_void: string_class /= Void
	string_8_class_not_void: string_8_class /= Void
	string_32_class_not_void: string_32_class /= Void
	array_class_not_void: array_class /= Void
	special_class_not_void: special_class /= Void
	native_array_class_not_void: native_array_class /= Void
	boolean_class_not_void: boolean_class /= Void
	character_class_not_void: character_class /= Void
	character_8_class_not_void: character_8_class /= Void
	character_32_class_not_void: character_32_class /= Void
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
	real_32_class_not_void: real_32_class /= Void
	real_64_class_not_void: real_64_class /= Void
	double_class_not_void: double_class /= Void
	pointer_class_not_void: pointer_class /= Void
	typed_pointer_class_not_void: typed_pointer_class /= Void
	type_class_not_void: type_class /= Void
	routine_class_not_void: routine_class /= Void
	procedure_class_not_void: procedure_class /= Void
	predicate_class_not_void: predicate_class /= Void
	function_class_not_void: function_class /= Void
	arguments_class_not_void: arguments_class /= Void
	identified_routines_class_not_void: identified_routines_class /= Void
	platform_class_not_void: platform_class /= Void
	system_object_class_not_void: system_object_class /= Void
	system_string_class_not_void: system_string_class /= Void
	unknown_class_not_void: unknown_class /= Void
	any_type_not_void: any_type /= Void
	none_type_not_void: none_type /= Void
	integer_type_not_void: integer_type /= Void
	natural_type_not_void: natural_type /= Void
	character_type_not_void: character_type /= Void
	string_type_not_void: string_type /= Void
	real_type_not_void: real_type /= Void
	double_type_not_void: double_type /= Void
	tuple_type_not_void: tuple_type /= Void
	array_any_type_not_void: array_any_type /= Void
	array_none_type_not_void: array_none_type /= Void
	any_parent_not_void: any_parent /= Void
	any_parents_not_void: any_parents /= Void
	system_object_parents_not_void: system_object_parents /= Void
	integer_convert_feature_not_void: integer_convert_feature /= Void
	integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
	integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
	integer_32_convert_feature_not_void: integer_32_convert_feature /= Void
	integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
	natural_convert_feature_not_void: natural_convert_feature /= Void
	natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
	natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
	natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
	natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
	real_32_convert_feature_not_void: real_32_convert_feature /= Void
	real_64_convert_feature_not_void: real_64_convert_feature /= Void
	real_convert_feature_not_void: real_convert_feature /= Void
	double_convert_feature_not_void: double_convert_feature /= Void
	default_create_seed_non_negative: default_create_seed >= 0
	void_seed_non_negative: void_seed >= 0
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	flat_implementation_checker_not_void: flat_implementation_checker /= Void
	null_processor_not_void: null_processor /= Void
	boolean_ref_class_not_void: boolean_ref_class /= Void
	character_ref_class_not_void: character_ref_class /= Void
	character_8_ref_class_not_void: character_8_ref_class /= Void
	character_32_ref_class_not_void: character_32_ref_class /= Void
	wide_character_ref_class_not_void: wide_character_ref_class /= Void
	integer_ref_class_not_void: integer_ref_class /= Void
	integer_8_ref_class_not_void: integer_8_ref_class /= Void
	integer_16_ref_class_not_void: integer_16_ref_class /= Void
	integer_32_ref_class_not_void: integer_32_ref_class /= Void
	integer_64_ref_class_not_void: integer_64_ref_class /= Void
	natural_ref_class_not_void: natural_ref_class /= Void
	natural_8_ref_class_not_void: natural_8_ref_class /= Void
	natural_16_ref_class_not_void: natural_16_ref_class /= Void
	natural_32_ref_class_not_void: natural_32_ref_class /= Void
	natural_64_ref_class_not_void: natural_64_ref_class /= Void
	real_ref_class_not_void: real_ref_class /= Void
	real_32_ref_class_not_void: real_32_ref_class /= Void
	real_64_ref_class_not_void: real_64_ref_class /= Void
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
	external_include_pathnames_not_void: external_include_pathnames /= Void
	no_void_external_include_pathname: not external_include_pathnames.has (Void)
	external_object_pathnames_not_void: external_object_pathnames /= Void
	no_void_external_object_pathname: not external_object_pathnames.has (Void)
	external_library_pathnames_not_void: external_library_pathnames /= Void
	no_void_external_library_pathname: not external_library_pathnames.has (Void)

end
