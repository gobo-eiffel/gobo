indexing

	description:

		"Eiffel systems"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYSTEM

inherit

	ET_INTERNAL_UNIVERSE
		redefine
			preparse_local,
			parse_all_local
		end

	KL_IMPORTED_STRING_ROUTINES
			export {NONE} all end

	KL_SHARED_EXECUTION_ENVIRONMENT
			export {NONE} all end

	UT_SHARED_ISE_VERSIONS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new Eiffel system.
			-- Error messages will be sent to standard files.
			-- Use default Eiffel AST factory.
		do
			error_handler := tokens.standard_error_handler
			ast_factory := tokens.default_ast_factory
			current_system := Current
			initialize
			set_default_keyword_usage
			set_preparse_shallow_mode
			create external_include_pathnames.make (20)
			create external_object_pathnames.make (20)
			create external_library_pathnames.make (20)
			console_application_mode := True
			unknown_builtin_reported := True
			set_basic_classes
			set_default_class_mapping
			create null_processor.make
			eiffel_preparser := null_processor
			eiffel_parser := null_processor
			provider_checker := null_processor
			ancestor_builder := null_processor
			feature_flattener := null_processor
			interface_checker := null_processor
			implementation_checker := null_processor
			flat_implementation_checker := null_processor
		end

feature -- Status report

	is_dotnet: BOOLEAN is
			-- Does current universe contain Eiffel for .NET kernel classes?
			-- Hence follow Eiffel for .NET validity rules.
		do
			Result := dotnet_assemblies /= Void and then dotnet_assemblies.count > 0
		end

feature -- Access

	root_class: ET_CLASS
			-- Root class

	root_creation: ET_FEATURE_NAME
			-- Root creation procedure

	error_handler: ET_ERROR_HANDLER
			-- Error handler

	ast_factory: ET_AST_FACTORY
			-- Abstract Syntax Tree factory

feature -- Basic classes

	any_class: ET_CLASS
			-- Class "ANY"

	any_type: ET_CLASS_TYPE
			-- Class type "ANY"

	any_parent: ET_PARENT
			-- Default parent

	any_parents: ET_PARENT_LIST
			-- Default parents

	any_clients: ET_CLIENT_LIST
			-- Default client clause

	arguments_class: ET_CLASS
			-- Class "ARGUMENTS"

	array_class: ET_CLASS
			-- Class "ARRAY"

	array_any_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [ANY]"

	array_none_type: ET_GENERIC_CLASS_TYPE
			-- Class type "ARRAY [NONE]"

	bit_class: ET_CLASS
			-- Class "BIT"

	boolean_class: ET_CLASS
			-- Class "BOOLEAN"

	boolean_ref_class: ET_CLASS
			-- Class "BOOLEAN_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	character_8_class: ET_CLASS
			-- Class "CHARACTER_8"

	character_8_ref_class: ET_CLASS
			-- Class "CHARACTER_8_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	character_32_class: ET_CLASS
			-- Class "CHARACTER_32"

	character_32_ref_class: ET_CLASS
			-- Class "CHARACTER_32_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	disposable_class: ET_CLASS
			-- Class "DISPOSABLE"

	function_class: ET_CLASS
			-- Class "FUNCTION"

	general_class: ET_CLASS
			-- Class "GENERAL"

	identified_routines_class: ET_CLASS
			-- Class "IDENTIFIED_ROUTINES"

	integer_8_class: ET_CLASS
			-- Class "INTEGER_8"

	integer_8_ref_class: ET_CLASS
			-- Class "INTEGER_8_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	integer_16_class: ET_CLASS
			-- Class "INTEGER_16"

	integer_16_ref_class: ET_CLASS
			-- Class "INTEGER_16_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	integer_32_class: ET_CLASS
			-- Class "INTEGER_32"

	integer_32_ref_class: ET_CLASS
			-- Class "INTEGER_32_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	integer_64_class: ET_CLASS
			-- Class "INTEGER_64"

	integer_64_ref_class: ET_CLASS
			-- Class "INTEGER_64_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	native_array_class: ET_CLASS
			-- Class "NATIVE_ARRAY"

	natural_8_class: ET_CLASS
			-- Class "NATURAL_8"

	natural_8_ref_class: ET_CLASS
			-- Class "NATURAL_8_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	natural_16_class: ET_CLASS
			-- Class "NATURAL_16"

	natural_16_ref_class: ET_CLASS
			-- Class "NATURAL_16_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	natural_32_class: ET_CLASS
			-- Class "NATURAL_32"

	natural_32_ref_class: ET_CLASS
			-- Class "NATURAL_32_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	natural_64_class: ET_CLASS
			-- Class "NATURAL_64"

	natural_64_ref_class: ET_CLASS
			-- Class "NATURAL_64_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	none_class: ET_CLASS
			-- Class "NONE"

	none_type: ET_CLASS_TYPE
			-- Class type "NONE"

	platform_class: ET_CLASS
			-- Class "PLATFORM"

	pointer_class: ET_CLASS
			-- Class "POINTER"

	pointer_ref_class: ET_CLASS
			-- Class "POINTER_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	predicate_class: ET_CLASS
			-- Class "PREDICATE"

	procedure_class: ET_CLASS
			-- Class "PROCEDURE"

	real_32_class: ET_CLASS
			-- Class "REAL_32"

	real_32_ref_class: ET_CLASS
			-- Class "REAL_32_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	real_64_class: ET_CLASS
			-- Class "REAL_64"

	real_64_ref_class: ET_CLASS
			-- Class "REAL_64_REF"
			-- (Note that _REF classes are kept for backward compatibility with
			-- ISE Eiffel, they are not part of ECMA Eiffel.)

	routine_class: ET_CLASS
			-- Class "ROUTINE"

	special_class: ET_CLASS
			-- Class "SPECIAL"

	string_8_class: ET_CLASS
			-- Class "STRING_8"

	string_32_class: ET_CLASS
			-- Class "STRING_32"

	system_object_class: ET_CLASS
			-- Class "SYSTEM_OBJECT" (in Eiffel for .NET)

	system_object_parents: ET_PARENT_LIST
			-- Default parents under .NET

	system_string_class: ET_CLASS
			-- Class "SYSTEM_STRING" (in Eiffel for .NET)

	tuple_class: ET_CLASS
			-- Class "TUPLE"

	tuple_type: ET_TUPLE_TYPE
			-- Type "TUPLE"

	type_class: ET_CLASS
			-- Class "TYPE"

	typed_pointer_class: ET_CLASS
			-- Class "TYPED_POINTER"

	set_basic_classes is
			-- Set basic classes.
		local
			l_class: ET_CLASS
			l_none_group: ET_NONE_GROUP
		do
				-- Make sure that `array_class' is set before `set_any_class'
				-- and `set_none_class' are set, otherwise we have calls on
				-- Void target when called from the creation procedure.
			array_class := ast_factory.new_class (tokens.array_class_name)
			register_class (array_class)
			array_class.set_in_system (True)
				-- Class "ANY".
			l_class := ast_factory.new_class (tokens.any_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_any_class (l_class)
				-- Class "ARGUMENTS".
			arguments_class := ast_factory.new_class (tokens.arguments_class_name)
			register_class (arguments_class)
				-- Class "BIT".
			bit_class := ast_factory.new_class (tokens.bit_class_name)
			register_class (bit_class)
			bit_class.set_in_system (True)
				-- Class "BOOLEAN".
			if boolean_class /= Void then
				boolean_class.set_basic (False)
			end
			boolean_class := ast_factory.new_class (tokens.boolean_class_name)
			register_class (boolean_class)
			boolean_class.set_basic (True)
			boolean_class.set_in_system (True)
				-- Class "BOOLEAN_REF".
			boolean_ref_class := ast_factory.new_class (tokens.boolean_ref_class_name)
			register_class (boolean_ref_class)
				-- Class "CHARACTER_8".
			l_class := ast_factory.new_class (tokens.character_8_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_character_8_class (l_class)
				-- Class "CHARACTER_8_REF".
			character_8_ref_class := ast_factory.new_class (tokens.character_8_ref_class_name)
			register_class (character_8_ref_class)
				-- Class "CHARACTER_32".
			l_class := ast_factory.new_class (tokens.character_32_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_character_32_class (l_class)
				-- Class "CHARACTER_32_REF".
			character_32_ref_class := ast_factory.new_class (tokens.character_32_ref_class_name)
			register_class (character_32_ref_class)
				-- Class "DISPOSABLE".
			disposable_class := ast_factory.new_class (tokens.disposable_class_name)
			register_class (disposable_class)
				-- Class "FUNCTION".
			function_class := ast_factory.new_class (tokens.function_class_name)
			register_class (function_class)
			function_class.set_in_system (True)
				-- Class "IDENTIFIER_ROUTINES".
			identified_routines_class := ast_factory.new_class (tokens.identified_routines_class_name)
			register_class (identified_routines_class)
				-- Class "INTEGER_8".
			l_class := ast_factory.new_class (tokens.integer_8_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_integer_8_class (l_class)
				-- Class "INTEGER_8_REF".
			integer_8_ref_class := ast_factory.new_class (tokens.integer_8_ref_class_name)
			register_class (integer_8_ref_class)
				-- Class "INTEGER_16".
			l_class := ast_factory.new_class (tokens.integer_16_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_integer_16_class (l_class)
				-- Class "INTEGER_16_REF".
			integer_16_ref_class := ast_factory.new_class (tokens.integer_16_ref_class_name)
			register_class (integer_16_ref_class)
				-- Class "INTEGER_32".
			l_class := ast_factory.new_class (tokens.integer_32_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_integer_32_class (l_class)
				-- Class "INTEGER_32_REF".
			integer_32_ref_class := ast_factory.new_class (tokens.integer_32_ref_class_name)
			register_class (integer_32_ref_class)
				-- Class "INTEGER_64".
			l_class := ast_factory.new_class (tokens.integer_64_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_integer_64_class (l_class)
				-- Class "INTEGER_64_REF".
			integer_64_ref_class := ast_factory.new_class (tokens.integer_64_ref_class_name)
			register_class (integer_64_ref_class)
				-- Class "NATIVE_ARRAY".
			native_array_class := ast_factory.new_class (tokens.native_array_class_name)
			register_class (native_array_class)
			native_array_class.set_in_system (True)
				-- Class "NATURAL_8".
			l_class := ast_factory.new_class (tokens.natural_8_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_natural_8_class (l_class)
				-- Class "NATURAL_8_REF".
			natural_8_ref_class := ast_factory.new_class (tokens.natural_8_ref_class_name)
			register_class (natural_8_ref_class)
				-- Class "NATURAL_16".
			l_class := ast_factory.new_class (tokens.natural_16_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_natural_16_class (l_class)
				-- Class "NATURAL_16_REF".
			natural_16_ref_class := ast_factory.new_class (tokens.natural_16_ref_class_name)
			register_class (natural_16_ref_class)
				-- Class "NATURAL_32".
			l_class := ast_factory.new_class (tokens.natural_32_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_natural_32_class (l_class)
				-- Class "NATURAL_32_REF".
			natural_32_ref_class := ast_factory.new_class (tokens.natural_32_ref_class_name)
			register_class (natural_32_ref_class)
				-- Class "NATURAL_64".
			l_class := ast_factory.new_class (tokens.natural_64_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_natural_64_class (l_class)
				-- Class "NATURAL_64_REF".
			natural_64_ref_class := ast_factory.new_class (tokens.natural_64_ref_class_name)
			register_class (natural_64_ref_class)
				-- Class "NONE".
			l_class := ast_factory.new_class (tokens.none_class_name)
			register_class (l_class)
			create l_none_group.make (Current)
			l_class.set_group (l_none_group)
			l_class.set_in_system (True)
			set_none_class (l_class)
				-- Class "PLATFORM".
			platform_class := ast_factory.new_class (tokens.platform_class_name)
			register_class (platform_class)
				-- Class "POINTER".
			if pointer_class /= Void then
				pointer_class.set_basic (False)
			end
			pointer_class := ast_factory.new_class (tokens.pointer_class_name)
			register_class (pointer_class)
			pointer_class.set_basic (True)
			pointer_class.set_in_system (True)
				-- Class "POINTER_REF".
			pointer_ref_class := ast_factory.new_class (tokens.pointer_ref_class_name)
			register_class (pointer_ref_class)
				-- Class "PREDICATE".
			predicate_class := ast_factory.new_class (tokens.predicate_class_name)
			register_class (predicate_class)
			predicate_class.set_in_system (True)
				-- Class "PROCEDURE".
			procedure_class := ast_factory.new_class (tokens.procedure_class_name)
			register_class (procedure_class)
			procedure_class.set_in_system (True)
				-- Class "REAL_32".
			l_class := ast_factory.new_class (tokens.real_32_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_real_32_class (l_class)
				-- Class "REAL_32_REF".
			real_32_ref_class := ast_factory.new_class (tokens.real_32_ref_class_name)
			register_class (real_32_ref_class)
				-- Class "REAL_64".
			l_class := ast_factory.new_class (tokens.real_64_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_real_64_class (l_class)
				-- Class "REAL_64_REF".
			real_64_ref_class := ast_factory.new_class (tokens.real_64_ref_class_name)
			register_class (real_64_ref_class)
				-- Class "ROUTINE".
			routine_class := ast_factory.new_class (tokens.routine_class_name)
			register_class (routine_class)
			routine_class.set_in_system (True)
				-- Class "SPECIAL".
			special_class := ast_factory.new_class (tokens.special_class_name)
			register_class (special_class)
			special_class.set_in_system (True)
				-- Class "STRING_8".
			l_class := ast_factory.new_class (tokens.string_8_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_string_8_class (l_class)
				-- Class "STRING_32".
			l_class := ast_factory.new_class (tokens.string_32_class_name)
			register_class (l_class)
			l_class.set_in_system (True)
			set_string_32_class (l_class)
				-- Class "SYSTEM_OBJECT".
			l_class := ast_factory.new_class (tokens.system_object_class_name)
			register_class (l_class)
			set_system_object_class (l_class)
				-- Class "SYSTEM_STRING".
			system_string_class := ast_factory.new_class (tokens.system_string_class_name)
			register_class (system_string_class)
				-- Class "TUPLE".
			tuple_class := ast_factory.new_class (tokens.tuple_class_name)
			register_class (tuple_class)
			tuple_class.set_in_system (True)
			create tuple_type.make (Void, Void, tuple_class)
				-- Class "TYPE".
			type_class := ast_factory.new_class (tokens.type_class_name)
			register_class (type_class)
			type_class.set_in_system (True)
				-- Class "TYPED_POINTER".
			typed_pointer_class := ast_factory.new_class (tokens.typed_pointer_class_name)
			register_class (typed_pointer_class)
			typed_pointer_class.set_in_system (True)
		end

	set_any_class (a_class: ET_CLASS) is
			-- Set `any_class' to `a_class'.
			-- Update `any_type', `any_parent', `any_parents'
			-- and `array_any_type' accordingly.
		require
			a_class_not_void: a_class /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
			l_any_client: ET_CLIENT
		do
			any_class := a_class
				-- Type "ANY".
			create any_type.make (Void, any_class.name, any_class)
				-- Implicit parent "ANY".
			create any_parent.make (any_type, Void, Void, Void, Void, Void)
			create any_parents.make_with_capacity (1)
			any_parents.put_first (any_parent)
				-- Implicit client clause.
			create any_clients.make_with_capacity (1)
			create l_any_client.make (tokens.any_class_name, any_class)
			any_clients.put_first (l_any_client)
				-- Type "ARRAY [ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create array_any_type.make (Void, array_class.name, l_parameters, array_class)
		ensure
			any_class_set: any_class = a_class
		end

	set_array_class (a_class: ET_CLASS) is
			-- Set `array_class' to `a_class'.
			-- Update `array_any_type' and `array_none_type' accordingly.
		require
			a_class_not_void: a_class /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			array_class := a_class
				-- Type "ARRAY [ANY]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (any_type)
			create array_any_type.make (Void, array_class.name, l_parameters, array_class)
				-- Type "ARRAY [NONE]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (none_type)
			create array_none_type.make (Void, array_class.name, l_parameters, array_class)
		ensure
			array_class_set: array_class = a_class
		end

	set_character_8_class (a_class: ET_CLASS) is
			-- Set `character_8_class' to `a_class'.
			-- Update `character_8_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if character_8_class /= Void then
				character_8_class.set_basic (False)
			end
			character_8_class := a_class
			character_8_class.set_basic (True)
				-- Built-in conversion features.
			create character_8_convert_feature.make (character_8_class)
		ensure
			character_8_class_set: character_8_class = a_class
		end

	set_character_32_class (a_class: ET_CLASS) is
			-- Set `character_32_class' to `a_class'.
			-- Update `character_32_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if character_32_class /= Void then
				character_32_class.set_basic (False)
			end
			character_32_class := a_class
			character_32_class.set_basic (True)
				-- Built-in conversion features.
			create character_32_convert_feature.make (character_32_class)
		ensure
			character_32_class_set: character_32_class = a_class
		end

	set_integer_8_class (a_class: ET_CLASS) is
			-- Set `integer_8_class' to `a_class'.
			-- Update `integer_8_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if integer_8_class /= Void then
				integer_8_class.set_basic (False)
			end
			integer_8_class := a_class
			integer_8_class.set_basic (True)
				-- Built-in conversion features.
			create integer_8_convert_feature.make (integer_8_class)
		ensure
			integer_8_class_set: integer_8_class = a_class
		end

	set_integer_16_class (a_class: ET_CLASS) is
			-- Set `integer_16_class' to `a_class'.
			-- Update `integer_16_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if integer_16_class /= Void then
				integer_16_class.set_basic (False)
			end
			integer_16_class := a_class
			integer_16_class.set_basic (True)
				-- Built-in conversion features.
			create integer_16_convert_feature.make (integer_16_class)
		ensure
			integer_16_class_set: integer_16_class = a_class
		end

	set_integer_32_class (a_class: ET_CLASS) is
			-- Set `integer_32_class' to `a_class'.
			-- Update `integer_32_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if integer_32_class /= Void then
				integer_32_class.set_basic (False)
			end
			integer_32_class := a_class
			integer_32_class.set_basic (True)
				-- Built-in conversion features.
			create integer_32_convert_feature.make (integer_32_class)
		ensure
			integer_32_class_set: integer_32_class = a_class
		end

	set_integer_64_class (a_class: ET_CLASS) is
			-- Set `integer_64_class' to `a_class'.
			-- Update `integer_64_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if integer_64_class /= Void then
				integer_64_class.set_basic (False)
			end
			integer_64_class := a_class
			integer_64_class.set_basic (true)
				-- Built-in conversion features.
			create integer_64_convert_feature.make (integer_64_class)
		ensure
			integer_64_class_set: integer_64_class = a_class
		end

	set_natural_8_class (a_class: ET_CLASS) is
			-- Set `natural_8_class' to `a_class'.
			-- Update `natural_8_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if natural_8_class /= Void then
				natural_8_class.set_basic (False)
			end
			natural_8_class := a_class
			natural_8_class.set_basic (True)
				-- Built-in conversion features.
			create natural_8_convert_feature.make (natural_8_class)
		ensure
			natural_8_class_set: natural_8_class = a_class
		end

	set_natural_16_class (a_class: ET_CLASS) is
			-- Set `natural_16_class' to `a_class'.
			-- Update `natural_16_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if natural_16_class /= Void then
				natural_16_class.set_basic (False)
			end
			natural_16_class := a_class
			natural_16_class.set_basic (True)
				-- Built-in conversion features.
			create natural_16_convert_feature.make (natural_16_class)
		ensure
			natural_16_class_set: natural_16_class = a_class
		end

	set_natural_32_class (a_class: ET_CLASS) is
			-- Set `natural_32_class' to `a_class'.
			-- Update `natural_32_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if natural_32_class /= Void then
				natural_32_class.set_basic (False)
			end
			natural_32_class := a_class
			natural_32_class.set_basic (True)
				-- Built-in conversion features.
			create natural_32_convert_feature.make (natural_32_class)
		ensure
			natural_32_class_set: natural_32_class = a_class
		end

	set_natural_64_class (a_class: ET_CLASS) is
			-- Set `natural_64_class' to `a_class'.
			-- Update `natural_64_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if natural_64_class /= Void then
				natural_64_class.set_basic (False)
			end
			natural_64_class := a_class
			natural_64_class.set_basic (True)
				-- Built-in conversion features.
			create natural_64_convert_feature.make (natural_64_class)
		ensure
			natural_64_class_set: natural_64_class = a_class
		end

	set_none_class (a_class: ET_CLASS) is
			-- Set `none_class' to `a_class'.
			-- Update `none_type' and `array_none_type' accordingly.
		require
			a_class_not_void: a_class /= Void
		local
			l_parameters: ET_ACTUAL_PARAMETER_LIST
		do
			none_class := a_class
				-- Type "NONE".
			create none_type.make (Void, none_class.name, none_class)
				-- Type "ARRAY [NONE]".
			create l_parameters.make_with_capacity (1)
			l_parameters.put_first (none_type)
			create array_none_type.make (Void, array_class.name, l_parameters, array_class)
		ensure
			none_class_set: none_class = a_class
		end

	set_real_32_class (a_class: ET_CLASS) is
			-- Set `real_32_class' to `a_class'.
			-- Update `real_32_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if real_32_class /= Void then
				real_32_class.set_basic (False)
			end
			real_32_class := a_class
			real_32_class.set_basic (True)
				-- Built-in conversion features.
			create real_32_convert_feature.make (real_32_class)
		ensure
			real_32_class_set: real_32_class = a_class
		end

	set_real_64_class (a_class: ET_CLASS) is
			-- Set `real_64_class' to `a_class'.
			-- Update `real_64_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			if real_64_class /= Void then
				real_64_class.set_basic (False)
			end
			real_64_class := a_class
			real_64_class.set_basic (True)
				-- Built-in conversion features.
			create real_64_convert_feature.make (real_64_class)
		ensure
			real_64_class_set: real_64_class = a_class
		end

	set_string_8_class (a_class: ET_CLASS) is
			-- Set `string_8_class' to `a_class'.
			-- Update `string_8_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			string_8_class := a_class
				-- Built-in conversion features.
			create string_8_convert_feature.make (string_8_class)
		ensure
			string_8_class_set: string_8_class = a_class
		end

	set_string_32_class (a_class: ET_CLASS) is
			-- Set `string_32_class' to `a_class'.
			-- Update `string_32_convert_feature' accordingly.
		require
			a_class_not_void: a_class /= Void
		do
			string_32_class := a_class
				-- Built-in conversion features.
			create string_32_convert_feature.make (string_32_class)
		ensure
			string_32_class_set: string_32_class = a_class
		end

	set_system_object_class (a_class: ET_CLASS) is
			-- Set `system_object_class' to `a_class'.
			-- Update `system_object_parents' accordingly.
		require
			a_class_not_void: a_class /= Void
		local
			l_system_object_parent: ET_PARENT
		do
			system_object_class := a_class
				-- Implicit parent "SYSTEM_OBJECT".
			create l_system_object_parent.make (system_object_class, Void, Void, Void, Void, Void)
			create system_object_parents.make_with_capacity (1)
			system_object_parents.put_first (l_system_object_parent)
		ensure
			system_object_class_set: system_object_class = a_class
		end

feature -- Built-in convert features

	character_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to CHARACTER_8

	character_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to CHARACTER_32

	integer_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_8

	integer_16_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_16

	integer_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to INTEGER_32

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

	real_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_32

	real_64_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to REAL_64

	string_8_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to STRING_8

	string_32_convert_feature: ET_BUILTIN_CONVERT_FEATURE
			-- Built-in conversion feature to STRING_32

feature -- Feature seeds

	default_create_seed: INTEGER
			-- Seed of feature 'default_create' in class ANY

	copy_seed: INTEGER
			-- Seed of feature 'copy' in class ANY

	is_equal_seed: INTEGER
			-- Seed of feature 'is_equal' in class ANY

	dispose_seed: INTEGER
			-- Seed of feature 'dispose' in class DISPOSABLE

	routine_call_seed: INTEGER
			-- Seed of feature 'call' in class ROUTINE

	function_item_seed: INTEGER
			-- Seed of feature 'item' in class FUNCTION

feature -- Feature seeds setting

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

	set_is_equal_seed (a_seed: INTEGER) is
			-- Set `is_equal_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			is_equal_seed := a_seed
		ensure
			is_equal_seed_set: is_equal_seed = a_seed
		end

	set_dispose_seed (a_seed: INTEGER) is
			-- Set `dispose_seed' to `a_seed'.
		require
			a_seed_not_negative: a_seed >= 0
		do
			dispose_seed := a_seed
		ensure
			dispose_seed_set: dispose_seed = a_seed
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

feature -- Class registration

	register_class (a_class: ET_CLASS) is
			-- Register `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			registered_class_count := registered_class_count + 1
			a_class.set_id (registered_class_count)
		end

	registered_class_count: INTEGER
			-- Number of classes already registered

feature -- Feature registration

	register_feature (a_feature: ET_FEATURE) is
			-- Register `a_feature'.
		require
			a_feature_not_void: a_feature /= Void
		do
			registered_feature_count := registered_feature_count + 1
			a_feature.set_id (registered_feature_count)
		ensure
			a_feature_registered: a_feature.is_registered
		end

	registered_feature_count: INTEGER
			-- Number of features already registered

feature -- Inline constant registration

	register_inline_constant (a_constant: ET_INLINE_CONSTANT) is
			-- Register `a_constant'.
		require
			a_constant_not_void: a_constant /= Void
		do
			registered_inline_constant_count := registered_inline_constant_count + 1
			a_constant.set_id (registered_inline_constant_count)
		end

	registered_inline_constant_count: INTEGER
			-- Number of inline constants already registered

feature -- Setting

	set_root_class (a_name: ET_CLASS_NAME) is
			-- Set `root_class'.
		require
			a_name_not_void: a_name /= Void
		do
			if a_name.same_class_name (tokens.none_class_name) then
				root_class := none_class
			elseif a_name.same_class_name (tokens.any_class_name) then
				root_class := any_class
			else
				root_class := eiffel_class (a_name)
			end
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

	exception_trace_mode: BOOLEAN
			-- Should the generated application be able to provide an exception trace?
			-- An exception trace is the execution path from the root creation procedure
			-- to the feature where an exception occurred.

	trace_mode: BOOLEAN
			-- Should the generated application be compiled with trace turned on?
			-- The trace is displayed each time the execution enters or exits
			-- from a feature.

	use_boehm_gc: BOOLEAN
			-- Should the application be compiled with the Boehm GC?

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

	set_exception_trace_mode (b: BOOLEAN) is
			-- Set `exception_trace_mode' to `b'.
		do
			exception_trace_mode := b
		ensure
			exception_trace_mode_set: exception_trace_mode = b
		end

	set_trace_mode (b: BOOLEAN) is
			-- Set `trace_mode' to `b'.
		do
			trace_mode := b
		ensure
			trace_mode_set: trace_mode = b
		end

	set_use_boehm_gc (b: BOOLEAN) is
			-- Set `use_boehm_gc' to `b'.
		do
			use_boehm_gc := b
		ensure
			use_boehm_gc_set: use_boehm_gc = b
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

	use_attribute_keyword: BOOLEAN
			-- Should 'attribute' be considered as
			-- a keyword (otherwise identifier)?

	use_reference_keyword: BOOLEAN
			-- Should 'reference' be considered as
			-- a keyword (otherwise identifier)?

	unknown_builtin_reported: BOOLEAN
			-- Should unknown built-in features be reported as
			-- an error when parsing a class?

	providers_enabled: BOOLEAN
			-- Should providers be built when parsing a class?

	cluster_dependence_enabled: BOOLEAN
			-- Should cluster dependence constraint be checked?

	qualified_anchored_types_enabled: BOOLEAN
			-- Are types of the form 'like a.b' or 'like {A}.b'
			-- (also known as qualified anchored types or remote
			-- anchored types) accepted?

	preparse_shallow_mode: BOOLEAN
			-- Are filenames are expected to be of the form 'classname.e'?

	preparse_single_mode: BOOLEAN
			-- Is each Eiffel file expected to contain exactly one class?
			-- (The filename is not necessarily expected to match the class name.)

	preparse_multiple_mode: BOOLEAN
			-- Can each Eiffel file contain more than one class?

	preparse_readonly_mode: BOOLEAN
			-- When a read-only group or universe had already been preparsed,
			-- can it nevertheless be reparsed again (as if it was not marked
			-- as read-only)?

	preparse_override_mode: BOOLEAN
			-- When reparsing universes, should only override clusters be
			-- traversed?

feature -- Parser setting

	set_use_attribute_keyword (b: BOOLEAN) is
			-- Set `use_attribute_keyword' to `b'.
		do
			use_attribute_keyword := b
		ensure
			use_attribute_keyword_set: use_attribute_keyword = b
		end

	set_use_reference_keyword (b: BOOLEAN) is
			-- Set `use_reference_keyword' to `b'.
		do
			use_reference_keyword := b
		ensure
			use_reference_keyword_set: use_reference_keyword = b
		end

	set_default_keyword_usage is
			-- Set default keyword usage.
		do
			set_use_attribute_keyword (False)
			set_use_reference_keyword (True)
		end

	set_unknown_builtin_reported (b: BOOLEAN) is
			-- Set `unknown_builtin_reported' to `b'.
		do
			unknown_builtin_reported := b
		ensure
			unknown_builtin_reported_set: unknown_builtin_reported = b
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

	set_qualified_anchored_types_enabled (b: BOOLEAN) is
			-- Set `qualified_anchored_types_enabled' to `b'.
		do
			qualified_anchored_types_enabled := b
		ensure
			qualified_anchored_types_enabled_set: qualified_anchored_types_enabled = b
		end

	set_preparse_shallow_mode is
			-- Set `preparse_shallow_mode' to True.
		do
			preparse_shallow_mode := True
			preparse_single_mode := False
			preparse_multiple_mode := False
		ensure
			preparse_shallow_mode_set: preparse_shallow_mode
			preparse_single_mode_unset: not preparse_single_mode
			preparse_multiple_mode_unset: not preparse_multiple_mode
		end

	set_preparse_single_mode is
			-- Set `preparse_single_mode' to True.
		do
			preparse_single_mode := True
			preparse_shallow_mode := False
			preparse_multiple_mode := False
		ensure
			preparse_single_mode_set: preparse_single_mode
			preparse_shallow_mode_unset: not preparse_shallow_mode
			preparse_multiple_mode_unset: not preparse_multiple_mode
		end

	set_preparse_multiple_mode is
			-- Set `preparse_multiple_mode' to True.
		do
			preparse_multiple_mode := True
			preparse_shallow_mode := False
			preparse_single_mode := False
		ensure
			preparse_multiple_mode_set: preparse_multiple_mode
			preparse_shallow_mode_unset: not preparse_shallow_mode
			preparse_single_mode_unset: not preparse_single_mode
		end

	set_preparse_readonly_mode (b: BOOLEAN) is
			-- Set `preparse_readonly_mode' to `b'.
		do
			preparse_readonly_mode := b
		ensure
			preparse_readonly_mode_set: preparse_readonly_mode = b
		end

	set_preparse_override_mode (b: BOOLEAN) is
			-- Set `preparse_override_mode' to `b'.
		do
			preparse_override_mode := b
		ensure
			preparse_override_mode_set: preparse_override_mode = b
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

feature -- Parsing

	preparse_local is
			-- Build a mapping between class names and their filenames and
			-- populate `classes' (both with classes declared locally and
			-- exported by other universes which are assumed to have been
			-- preparsed before this call), even if the classes have not been
			-- parsed yet. If current universe had already been reparsed,
			-- then rebuild the mapping between class names and filenames:
			-- modified classes are reset and left unparsed and new classes
			-- are added to `classes', but are not parsed.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			precursor
			if root_class /= Void then
				root_class := eiffel_class (root_class.name)
			end
		end

	parse_all_local is
			-- Parse all classes declared locally in the current universe.
			-- There is not need to call one of the preparse routines
			-- beforehand since the current routine will traverse all
			-- clusters and parse all Eiffel files anyway. The mapping
			-- between class names and their filenames will be done during
			-- this process and `classes' will be populated (both with classes
			-- declared locally and those exported by other universes which
			-- are assumed to have been preparsed before this call).
			-- If current universe had already been preparsed, then rebuild
			-- the mapping between class names and filenames and reparse
			-- the classes that have been modified or were not parsed yet.
			--
			-- The queries `current_system.preparse_*_mode' govern the way
			-- preparsing works. Read the header comments of these features
			-- for more details.
			--
			-- `classes_modified' and `classes_added' will be updated.
		do
			precursor
			if root_class /= Void then
				root_class := eiffel_class (root_class.name)
			end
		end

	parse_system is
			-- Parse all classes reachable from the root class.
			-- The Eiffel system needs to have been preparsed beforehand.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_parsed_class_count: INTEGER
			l_old_parsed_class_count: INTEGER
			l_done: BOOLEAN
		do
			if root_class /= Void then
				root_class.process (eiffel_parser)
				if root_class = none_class then
					parse_all
				elseif not root_class.is_preparsed then
						-- Error: unknown root class.
					error_handler.report_gvsrc4a_error (root_class)
				else
					l_done := False
					l_old_parsed_class_count := parsed_class_count
					from until l_done loop
						if stop_requested then
							l_done := True
						else
							classes_do_if_recursive_until (agent parse_class, agent {ET_CLASS}.in_system, stop_request)
							l_parsed_class_count := parsed_class_count
							l_done := (l_parsed_class_count = l_old_parsed_class_count)
							l_old_parsed_class_count := l_parsed_class_count
						end
					end
				end
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
				set_use_attribute_keyword (True)
				set_use_reference_keyword (True)
			elseif ise_version /= Void then
				set_ise_version (ise_version)
			else
				set_default_keyword_usage
			end
		ensure
			ecma_version_set: ecma_version = a_version
		end

	set_ise_version (a_version: like ise_version) is
			-- Set `ise_version' to `a_version'.
		do
			ise_version := a_version
			if ise_version /= Void then
				set_use_attribute_keyword (False)
				set_use_reference_keyword (True)
			elseif ecma_version /= Void then
				set_ecma_version (ecma_version)
			else
				set_default_keyword_usage
			end
		ensure
			ise_version_set: ise_version = a_version
		end

feature -- Compilation

	compile is
			-- Compile current Eiffel system.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
			if root_class = Void or root_class = none_class or root_class = any_class then
				compile_all
			else
				compile_system
			end
		end

	compile_system is
			-- Compile all classes reachable from the root class.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
			preparse
			if error_handler.benchmark_shown then
				print_time (dt1, "Degree 6")
				dt1 := l_clock.system_clock.date_time_now
			end
			parse_system
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Preparsed ")
				error_handler.info_file.put_integer (class_count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (parsed_class_count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
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
			-- Compile all classes in the current Eiffel system.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes during Degree 3.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features during Degree 3.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		local
			l_clock: DT_SHARED_SYSTEM_CLOCK
			dt1: DT_DATE_TIME
		do
			activate_processors
			if error_handler.benchmark_shown then
				create l_clock
				dt1 := l_clock.system_clock.date_time_now
			end
--			preparse
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
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
				-- Parse classes.
			classes_do_if_recursive_until (agent parse_class, agent {ET_CLASS}.is_preparsed, stop_request)
			check_provider_validity
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Parsed ")
				error_handler.info_file.put_integer (parsed_class_count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_4 is
			-- Equivalent of ISE Eiffel's Degree 4.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
				-- Build ancestors.
			classes_do_if_recursive_until (agent build_ancestors, agent {ET_CLASS}.is_parsed, stop_request)
				-- Flatten features.
			classes_do_if_recursive_until (agent flatten_features, agent {ET_CLASS}.ancestors_built, stop_request)
				-- Check interface.
			classes_do_if_recursive_until (agent check_interface, agent {ET_CLASS}.features_flattened, stop_request)
			if not stop_requested and then error_handler.benchmark_shown then
				error_handler.info_file.put_string ("Flattened ")
				error_handler.info_file.put_integer (parsed_class_count)
				error_handler.info_file.put_line (" classes")
				error_handler.info_file.put_integer (registered_feature_count)
				error_handler.info_file.put_line (" features")
			end
		end

	compile_degree_3 is
			-- Equivalent of ISE Eiffel's Degree 3.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
				-- Check implementation.
			classes_do_if_recursive_until (agent check_implementation, agent {ET_CLASS}.interface_checked, stop_request)
		end

	check_provider_validity is
			-- Check cluster dependence constraints.
			--
			-- Note that this operation will be interrupted if a stop request
			-- is received, i.e. `stop_request' starts returning True. No
			-- interruption if `stop_request' is Void.
		do
			if cluster_dependence_enabled then
				classes_do_if_recursive_until (agent check_providers, agent {ET_CLASS}.is_parsed, stop_request)
			end
		end

	parse_class (a_class: ET_CLASS) is
			-- Parse `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.process (eiffel_parser)
		end

	check_providers (a_class: ET_CLASS) is
			-- Check cluster dependence constraints of the providers of `a_class'
		require
			a_class_not_void: a_class /= Void
		do
			a_class.process (provider_checker)
		end

	build_ancestors (a_class: ET_CLASS) is
			-- Build ancestors of `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.process (ancestor_builder)
		end

	flatten_features (a_class: ET_CLASS) is
			-- Flatten features of `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.process (feature_flattener)
		end

	check_interface (a_class: ET_CLASS) is
			-- Check interface of `a_class'.
		require
			a_class_not_void: a_class /= Void
		do
			a_class.process (interface_checker)
		end

	check_implementation (a_class: ET_CLASS) is
			-- Check implementation of `a_class'.
			-- `flat_mode' means that the inherited features are checked
			-- again in the descendant classes.
			-- `flat_dbc_mode' means that the inherited pre- and postconditions
			-- are checked again in the redeclaration of features.
		require
			a_class_not_void: a_class /= Void
		local
			l_checker: ET_IMPLEMENTATION_CHECKER
			l_processor: ET_AST_PROCESSOR
		do
			if flat_mode then
				l_processor := flat_implementation_checker
			else
				l_processor := implementation_checker
			end
			l_checker ?= l_processor
			if l_checker /= Void then
				l_checker.set_flat_mode (flat_mode)
				l_checker.set_flat_dbc_mode (flat_dbc_mode)
				l_checker.set_suppliers_enabled (suppliers_enabled)
			end
			a_class.process (l_processor)
		end

feature -- Processors

	eiffel_preparser: ET_AST_PROCESSOR
			-- Eiffel preparser

	eiffel_parser: ET_AST_PROCESSOR
			-- Eiffel parser

	dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER is
			-- .NET assembly consumer
		do
			Result := internal_dotnet_assembly_consumer
			if Result = Void then
				create {ET_DOTNET_ASSEMBLY_CLASSIC_CONSUMER} Result.make (Current)
				internal_dotnet_assembly_consumer := Result
			end
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
			l_implementation_checker: ET_IMPLEMENTATION_CHECKER
		do
			if eiffel_preparser = null_processor then
				create {ET_EIFFEL_PREPARSER} eiffel_preparser.make
			end
			if eiffel_parser = null_processor then
				create {ET_EIFFEL_PARSER} eiffel_parser.make
			end
			if provider_checker = null_processor then
				create {ET_PROVIDER_CHECKER} provider_checker.make
			end
			if ancestor_builder = null_processor then
				create {ET_ANCESTOR_BUILDER} ancestor_builder.make
			end
			if feature_flattener = null_processor then
				create {ET_FEATURE_FLATTENER} feature_flattener.make
			end
			if interface_checker = null_processor then
				create {ET_INTERFACE_CHECKER} interface_checker.make
			end
			if implementation_checker = null_processor then
				create {ET_IMPLEMENTATION_CHECKER} implementation_checker.make
			end
			if flat_implementation_checker = null_processor then
				create l_implementation_checker.make
				l_implementation_checker.set_flat_mode (True)
				flat_implementation_checker := l_implementation_checker
			end
		end

	set_eiffel_preparser (a_eiffel_preparser: like eiffel_preparser) is
			-- Set `eiffel_preparser' to `a_eiffel_preparser'.
		require
			a_eiffel_preparser_not_void: a_eiffel_preparser /= Void
		do
			eiffel_preparser := a_eiffel_preparser
		ensure
			eiffel_preparser_set: eiffel_preparser = a_eiffel_preparser
		end

	set_eiffel_parser (a_eiffel_parser: like eiffel_parser) is
			-- Set `eiffel_parser' to `a_eiffel_parser'.
		require
			a_eiffel_parser_not_void: a_eiffel_parser /= Void
		do
			eiffel_parser := a_eiffel_parser
		ensure
			eiffel_parser_set: eiffel_parser = a_eiffel_parser
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

feature -- Stop

	stop_requested: BOOLEAN is
			-- Has the interruption of the current operation
			-- been requested? The operation will therefore be
			-- interrupted at the earliest possible time.
		do
			if stop_request /= Void then
				Result := stop_request.item ([])
			end
		end

	stop_request: FUNCTION [ANY, TUPLE, BOOLEAN]
			-- Agent used to figure out whether there has been
			-- a request to interrupt the current operation;
			-- No interruption if Void

	set_stop_request (a_stop_request: like stop_request) is
			-- Set `stop_request' to `a_stop_request'.
		do
			stop_request := a_stop_request
		ensure
			stop_request_set: stop_request = a_stop_request
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
			if not stop_requested then
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
		end

feature {NONE} -- Implementation

	internal_dotnet_assembly_consumer: ET_DOTNET_ASSEMBLY_CONSUMER
			-- .NET assembly consumer

invariant

	error_handler_not_void: error_handler /= Void
	ast_factory_not_void: ast_factory /= Void
		-- Basic classes.
	any_class_not_void: any_class /= Void
	any_type_not_void: any_type /= Void
	any_parent_not_void: any_parent /= Void
	any_parents_not_void: any_parents /= Void
	any_clients_not_void: any_clients /= Void
	arguments_class_not_void: arguments_class /= Void
	array_class_not_void: array_class /= Void
	array_any_type_not_void: array_any_type /= Void
	array_none_type_not_void: array_none_type /= Void
	bit_class_not_void: bit_class /= Void
	boolean_class_not_void: boolean_class /= Void
	boolean_ref_class_not_void: boolean_ref_class /= Void
	character_8_class_not_void: character_8_class /= Void
	character_8_ref_class_not_void: character_8_ref_class /= Void
	character_32_class_not_void: character_32_class /= Void
	character_32_ref_class_not_void: character_32_ref_class /= Void
	disposable_class_not_void: disposable_class /= Void
	function_class_not_void: function_class /= Void
	identified_routines_class_not_void: identified_routines_class /= Void
	integer_8_class_not_void: integer_8_class /= Void
	integer_8_ref_class_not_void: integer_8_ref_class /= Void
	integer_16_class_not_void: integer_16_class /= Void
	integer_16_ref_class_not_void: integer_16_ref_class /= Void
	integer_32_class_not_void: integer_32_class /= Void
	integer_32_ref_class_not_void: integer_32_ref_class /= Void
	integer_64_class_not_void: integer_64_class /= Void
	integer_64_ref_class_not_void: integer_64_ref_class /= Void
	native_array_class_not_void: native_array_class /= Void
	natural_8_class_not_void: natural_8_class /= Void
	natural_8_ref_class_not_void: natural_8_ref_class /= Void
	natural_16_class_not_void: natural_16_class /= Void
	natural_16_ref_class_not_void: natural_16_ref_class /= Void
	natural_32_class_not_void: natural_32_class /= Void
	natural_32_ref_class_not_void: natural_32_ref_class /= Void
	natural_64_class_not_void: natural_64_class /= Void
	natural_64_ref_class_not_void: natural_64_ref_class /= Void
	none_class_not_void: none_class /= Void
	none_type_not_void: none_type /= Void
	platform_class_not_void: platform_class /= Void
	pointer_class_not_void: pointer_class /= Void
	pointer_ref_class_not_void: pointer_ref_class /= Void
	predicate_class_not_void: predicate_class /= Void
	procedure_class_not_void: procedure_class /= Void
	real_32_class_not_void: real_32_class /= Void
	real_32_ref_class_not_void: real_32_ref_class /= Void
	real_64_class_not_void: real_64_class /= Void
	real_64_ref_class_not_void: real_64_ref_class /= Void
	routine_class_not_void: routine_class /= Void
	special_class_not_void: special_class /= Void
	string_8_class_not_void: string_8_class /= Void
	string_32_class_not_void: string_32_class /= Void
	system_object_class_not_void: system_object_class /= Void
	system_object_parents_not_void: system_object_parents /= Void
	system_string_class_not_void: system_string_class /= Void
	tuple_class_not_void: tuple_class /= Void
	tuple_type_not_void: tuple_type /= Void
	type_class_not_void: type_class /= Void
	typed_pointer_class_not_void: typed_pointer_class /= Void
		-- Built-in convert features.
	character_8_convert_feature_not_void: character_8_convert_feature /= Void
	character_32_convert_feature_not_void: character_32_convert_feature /= Void
	integer_8_convert_feature_not_void: integer_8_convert_feature /= Void
	integer_16_convert_feature_not_void: integer_16_convert_feature /= Void
	integer_32_convert_feature_not_void: integer_32_convert_feature /= Void
	integer_64_convert_feature_not_void: integer_64_convert_feature /= Void
	natural_8_convert_feature_not_void: natural_8_convert_feature /= Void
	natural_16_convert_feature_not_void: natural_16_convert_feature /= Void
	natural_32_convert_feature_not_void: natural_32_convert_feature /= Void
	natural_64_convert_feature_not_void: natural_64_convert_feature /= Void
	real_32_convert_feature_not_void: real_32_convert_feature /= Void
	real_64_convert_feature_not_void: real_64_convert_feature /= Void
	string_8_convert_feature_not_void: string_8_convert_feature /= Void
	string_32_convert_feature_not_void: string_32_convert_feature /= Void
		-- Feature seeds.
	default_create_seed_not_negative: default_create_seed >= 0
	copy_seed_not_negative: copy_seed >= 0
	is_equal_seed_not_negative: is_equal_seed >= 0
	dispose_seed_not_negative: dispose_seed >= 0
	routine_call_seed_not_negative: routine_call_seed >= 0
	function_item_seed_not_negative: function_item_seed >= 0
		-- Processors.
	eiffel_preparser_not_void: eiffel_preparser /= Void
	eiffel_parser_not_void: eiffel_parser /= Void
	provider_checker_not_void: provider_checker /= Void
	ancestor_builder_not_void: ancestor_builder /= Void
	feature_flattener_not_void: feature_flattener /= Void
	interface_checker_not_void: interface_checker /= Void
	implementation_checker_not_void: implementation_checker /= Void
	flat_implementation_checker_not_void: flat_implementation_checker /= Void
	null_processor_not_void: null_processor /= Void
		-- Compilation options.
	external_include_pathnames_not_void: external_include_pathnames /= Void
	no_void_external_include_pathname: not external_include_pathnames.has (Void)
	external_object_pathnames_not_void: external_object_pathnames /= Void
	no_void_external_object_pathname: not external_object_pathnames.has (Void)
	external_library_pathnames_not_void: external_library_pathnames /= Void
	no_void_external_library_pathname: not external_library_pathnames.has (Void)

end
