note

	description:

		"Eiffel class codes"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2009-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date:  $"
	revision: "$Revision: $"

class ET_CLASS_CODES

inherit

		ANY

		ET_SHARED_CLASS_NAME_TESTER
			export {NONE} all end

		ET_SHARED_TOKEN_CONSTANTS
			export {NONE} all end

feature -- Status report

	is_basic (a_code: NATURAL_8): BOOLEAN
			-- Does `a_code' correspond to a basic class?
			--
			-- Note: a basic class is one of "BOOLEAN", "CHARACTER_8",
			-- "CHARACTER_32", "INTEGER_8", "INTEGER_16", "INTEGER_32",
			-- "INTEGER_64", "NATURAL_8", "NATURAL_16", "NATURAL_32",
			-- "NATURAL_64", "POINTER", "REAL_32", "REAL_64".
		do
			Result := boolean_class_code <= a_code and a_code <= pointer_class_code
		ensure
			instance_free: class
		end

	is_numeric (a_code: NATURAL_8): BOOLEAN
			-- Does `a_code' correspond to a numeric class?
			--
			-- Note: a numeric class is one of "INTEGER_8", "INTEGER_16",
			-- "INTEGER_32", "INTEGER_64", "NATURAL_8", "NATURAL_16",
			-- "NATURAL_32", "NATURAL_64", "REAL_32", "REAL_64".
		do
			Result := integer_8_class_code <= a_code and a_code <= real_64_class_code
		ensure
			instance_free: class
		end

feature -- Access

	class_code (a_class_name: ET_CLASS_NAME): NATURAL_8
			-- Code corresponding to class with name `a_class_name'
		require
			a_class_name_not_void: a_class_name /= Void
		local
			l_codes_by_name: DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME]
		do
			l_codes_by_name := codes_by_name
			l_codes_by_name.search (a_class_name)
			if l_codes_by_name.found then
				Result := l_codes_by_name.found_item
			else
				Result := no_class_code
			end
		ensure
			instance_free: class
		end

feature -- Codes

	no_class_code: NATURAL_8 = 0
			-- Not one of the classes with a specific code (see list below)

	boolean_class_code: NATURAL_8 = 1
			-- Code for class "BOOLEAN"

	character_8_class_code: NATURAL_8 = 11
			-- Code for class "CHARACTER_8"

	character_32_class_code: NATURAL_8 = 12
			-- Code for class "CHARACTER_32"

	integer_8_class_code: NATURAL_8 = 21
			-- Code for class "INTEGER_8"

	integer_16_class_code: NATURAL_8 = 22
			-- Code for class "INTEGER_16"

	integer_32_class_code: NATURAL_8 = 23
			-- Code for class "INTEGER_32"

	integer_64_class_code: NATURAL_8 = 24
			-- Code for class "INTEGER_64"

	natural_8_class_code: NATURAL_8 = 31
			-- Code for class "NATURAL_8"

	natural_16_class_code: NATURAL_8 = 32
			-- Code for class "NATURAL_16"

	natural_32_class_code: NATURAL_8 = 33
			-- Code for class "NATURAL_32"

	natural_64_class_code: NATURAL_8 = 34
			-- Code for class "NATURAL_64"

	real_32_class_code: NATURAL_8 = 41
			-- Code for class "REAL_32"

	real_64_class_code: NATURAL_8 = 42
			-- Code for class "REAL_64"

	pointer_class_code: NATURAL_8 = 51
			-- Code for class "POINTER"

	tuple_class_code: NATURAL_8 = 61
			-- Code for class "TUPLE"

	function_class_code: NATURAL_8 = 71
			-- Code for class "FUNCTION"

	predicate_class_code: NATURAL_8 = 72
			-- Code for class "PREDICATE"

	procedure_class_code: NATURAL_8 = 73
			-- Code for class "PROCEDURE"

	routine_class_code: NATURAL_8 = 74
			-- Code for class "ROUTINE"

	special_class_code: NATURAL_8 = 101
			-- Code for class "SPECIAL"

	type_class_code: NATURAL_8 = 102
			-- Code for class "TYPE"

	typed_pointer_class_code: NATURAL_8 = 103
			-- Code for class "TYPED_POINTER"

	array_class_code: NATURAL_8 = 104
			-- Code for class "ARRAY"

	any_class_code: NATURAL_8 = 105
			-- Code for class "ANY"

	system_object_class_code: NATURAL_8 = 106
			-- Code for class "SYSTEM_OBJECT"

	disposable_class_code: NATURAL_8 = 107
			-- Code for class "DISPOSABLE"

	iterable_class_code: NATURAL_8 = 108
			-- Code for class "ITERABLE"

	iteration_cursor_class_code: NATURAL_8 = 109
			-- Code for class "ITERATION_CURSOR"

	codes_by_name: DS_HASH_TABLE [NATURAL_8, ET_CLASS_NAME]
			-- Class codes indexed by class names
		once
			create Result.make_map (28)
			Result.set_key_equality_tester (class_name_tester)
			Result.force_last (boolean_class_code, tokens.boolean_class_name)
			Result.force_last (character_8_class_code, tokens.character_8_class_name)
			Result.force_last (character_32_class_code, tokens.character_32_class_name)
			Result.force_last (integer_8_class_code, tokens.integer_8_class_name)
			Result.force_last (integer_16_class_code, tokens.integer_16_class_name)
			Result.force_last (integer_32_class_code, tokens.integer_32_class_name)
			Result.force_last (integer_64_class_code, tokens.integer_64_class_name)
			Result.force_last (natural_8_class_code, tokens.natural_8_class_name)
			Result.force_last (natural_16_class_code, tokens.natural_16_class_name)
			Result.force_last (natural_32_class_code, tokens.natural_32_class_name)
			Result.force_last (natural_64_class_code, tokens.natural_64_class_name)
			Result.force_last (real_32_class_code, tokens.real_32_class_name)
			Result.force_last (real_64_class_code, tokens.real_64_class_name)
			Result.force_last (pointer_class_code, tokens.pointer_class_name)
			Result.force_last (tuple_class_code, tokens.tuple_class_name)
			Result.force_last (function_class_code, tokens.function_class_name)
			Result.force_last (predicate_class_code, tokens.predicate_class_name)
			Result.force_last (procedure_class_code, tokens.procedure_class_name)
			Result.force_last (routine_class_code, tokens.routine_class_name)
			Result.force_last (special_class_code, tokens.special_class_name)
			Result.force_last (type_class_code, tokens.type_class_name)
			Result.force_last (typed_pointer_class_code, tokens.typed_pointer_class_name)
			Result.force_last (array_class_code, tokens.array_class_name)
			Result.force_last (any_class_code, tokens.any_class_name)
			Result.force_last (system_object_class_code, tokens.system_object_class_name)
			Result.force_last (disposable_class_code, tokens.disposable_class_name)
			Result.force_last (iterable_class_code, tokens.iterable_class_name)
			Result.force_last (iteration_cursor_class_code, tokens.iteration_cursor_class_name)
		ensure
			instance_free: class
			codes_by_name_not_void: Result /= Void
		end

end
