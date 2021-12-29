note

	description:

		"Eiffel feature call names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_CALL_NAME

inherit

	ET_AST_NODE

	HASHABLE

	KL_IMPORTED_ANY_ROUTINES
		export {NONE} all end

feature -- Initialization

	reset
			-- Reset call name as it was when it was last parsed.
		do
			seed := 0
		end

feature -- Access

	name: STRING
			-- Name of feature call
			-- (using UTF-8 encoding)
		deferred
		ensure
			name_not_void: Result /= Void
			name_not_empty: Result.count > 0
			name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
		end

	lower_name: STRING
			-- Lower-name of feature call
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in lower case,
			-- otherwise return a new object at each call.)
		deferred
		ensure
			lower_name_not_void: Result /= Void
			lower_name_not_empty: Result.count > 0
			lower_name_is_string: {KL_ANY_ROUTINES}.same_types (Result, "")
			valid_utf8_lower_name: {UC_UTF8_ROUTINES}.valid_utf8 (Result)
			definition: Result.is_equal (name.as_lower)
		end

	seed: INTEGER
			-- One of the seeds of feature in enclosing class,
			-- or index of formal argument or local variable
			-- in the enclosing feature, or index of label in
			-- tuple type

feature -- Setting

	set_seed (a_seed: INTEGER)
			-- Set `seed' to `a_seed'.
		do
			seed := a_seed
		ensure
			seed_set: seed = a_seed
		end

feature -- Status report

	is_identifier: BOOLEAN
			-- Is current call name an identifier?
		do
			-- Result := False
		end

	is_local: BOOLEAN
			-- Is current call name actually a local variable name?
		do
			-- Result := False
		end

	is_object_test_local: BOOLEAN
			-- Is current call name actually an object-test local name?
		do
			-- Result := False
		end

	is_iteration_item: BOOLEAN
			-- Is current call name actually an iteration item name?
		do
			-- Result := False
		end

	is_argument: BOOLEAN
			-- Is current call name actually a formal argument name?
		do
			-- Result := False
		end

	is_tuple_label: BOOLEAN
			-- Is current call name a tuple label?
		do
			-- Result := False
		end

	is_feature_name: BOOLEAN
			-- Is current call name a feature name?
		do
			-- Result := False
		end

	is_infix: BOOLEAN
			-- Is current call name of the form binary 'alias "..."'?
		do
			-- Result := False
		end

	is_infix_and: BOOLEAN
			-- Is current call name of the form binary 'alias "and"'?
		do
			-- Result := False
		end

	is_infix_and_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "∧"'?
		do
			-- Result := False
		end

	is_infix_and_then: BOOLEAN
			-- Is current call name of the form binary 'alias "and then"'?
		do
			-- Result := False
		end

	is_infix_and_then_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "∧…"'?
		do
			-- Result := False
		end

	is_infix_div: BOOLEAN
			-- Is current call name of the form binary 'alias "//"'?
		do
			-- Result := False
		end

	is_infix_divide: BOOLEAN
			-- Is current call name of the form binary 'alias "/"'?
		do
			-- Result := False
		end

	is_infix_freeop: BOOLEAN
			-- Is current call name of the form binary 'alias "free-operator"'?
		do
			-- Result := False
		end

	is_infix_ge: BOOLEAN
			-- Is current call name of the form binary 'alias ">="'?
		do
			-- Result := False
		end

	is_infix_gt: BOOLEAN
			-- Is current call name of the form binary 'alias ">"'?
		do
			-- Result := False
		end

	is_infix_implies: BOOLEAN
			-- Is current call name of the form binary 'alias "implies"'?
		do
			-- Result := False
		end

	is_infix_implies_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "⇒"'?
		do
			-- Result := False
		end

	is_infix_le: BOOLEAN
			-- Is current call name of the form binary 'alias "<="'?
		do
			-- Result := False
		end

	is_infix_lt: BOOLEAN
			-- Is current call name of the form binary 'alias "<"'?
		do
			-- Result := False
		end

	is_infix_minus: BOOLEAN
			-- Is current call name of the form binary 'alias "-"'?
		do
			-- Result := False
		end

	is_infix_mod: BOOLEAN
			-- Is current call name of the form binary 'alias "\\"'?
		do
			-- Result := False
		end

	is_infix_or: BOOLEAN
			-- Is current call name of the form binary 'alias "or"'?
		do
			-- Result := False
		end

	is_infix_or_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "∨"'?
		do
			-- Result := False
		end

	is_infix_or_else: BOOLEAN
			-- Is current call name of the form binary 'alias "or else"'?
		do
			-- Result := False
		end

	is_infix_or_else_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "∨…"'?
		do
			-- Result := False
		end

	is_infix_plus: BOOLEAN
			-- Is current call name of the form binary 'alias "+"'?
		do
			-- Result := False
		end

	is_infix_power: BOOLEAN
			-- Is current call name of the form binary 'alias "^"'?
		do
			-- Result := False
		end

	is_infix_times: BOOLEAN
			-- Is current call name of the form binary 'alias "*"'?
		do
			-- Result := False
		end

	is_infix_xor: BOOLEAN
			-- Is current call name of the form binary 'alias "xor"'?
		do
			-- Result := False
		end

	is_infix_xor_symbol: BOOLEAN
			-- Is current call name of the form binary 'alias "⊻"'?
		do
			-- Result := False
		end

	is_infix_dotdot: BOOLEAN
			-- Is current call name of the form binary 'alias ".."'?
		do
			-- Result := False
		end

	is_prefix: BOOLEAN
			-- Is current call name of the form unary 'alias "..."'?
		do
			-- Result := False
		end

	is_prefix_minus: BOOLEAN
			-- Is current call name of the form unary 'alias "-"'?
		do
			-- Result := False
		end

	is_prefix_plus: BOOLEAN
			-- Is current call name of the form unary 'alias "+"'?
		do
			-- Result := False
		end

	is_prefix_freeop: BOOLEAN
			-- Is current call name of the form unary 'alias "free-operator"'?
		do
			-- Result := False
		end

	is_prefix_not: BOOLEAN
			-- Is current call name of the form unary 'alias "not"'?
		do
			-- Result := False
		end

	is_prefix_not_symbol: BOOLEAN
			-- Is current call name of the form unary 'alias "¬"'?
		do
			-- Result := False
		end

	is_bracket: BOOLEAN
			-- Is current call name of the form 'alias "[]"'?
		do
			-- Result := False
		end

	is_parenthesis: BOOLEAN
			-- Is current call name of the form 'alias "()"'?
		do
			-- Result := False
		end

	is_alias: BOOLEAN
			-- Is current call name of the form 'alias "..."'?
		do
			-- Result := False
		end

	is_precursor: BOOLEAN
			-- Is current call name of the form 'precursor'?
		do
			-- Result := False
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same names of the same feature?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		deferred
		end

feature -- Conversion

	precursor_keyword: ET_PRECURSOR_KEYWORD
			-- Current name viewed as a 'precursor' keyword
		require
			is_precursor: is_precursor
		do
			check is_precursor: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	local_name: ET_LOCAL_NAME
			-- Current name viewed as a local name
		require
			is_local: is_local
		do
			check is_local: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	argument_name: ET_ARGUMENT_NAME
			-- Current name viewed as an argument name
		require
			is_argument: is_argument
		do
			check is_argument: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	object_test_local_name: ET_OBJECT_TEST_LOCAL_NAME
			-- Current name viewed as an object-test local name
		require
			is_object_test_local: is_object_test_local
		do
			check is_object_test_local: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	iteration_item_name: ET_IDENTIFIER
			-- Current name viewed as an iteration item name
		require
			is_iteration_item: is_iteration_item
		do
			check is_iteration_item: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

	feature_name: ET_FEATURE_NAME
			-- Current name viewed as a feature name
		require
			is_feature_name: is_feature_name
		do
			check is_feature_name: False then end
		ensure
			definition: ANY_.same_objects (Result, Current)
		end

end
