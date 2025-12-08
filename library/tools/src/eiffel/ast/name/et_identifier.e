note

	description:

		"Eiffel identifiers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2024, Eric Bezault and others"
	license: "MIT License"

class ET_IDENTIFIER

inherit

	ET_FEATURE_NAME
		undefine
			first_position,
			last_position,
			break
		redefine
			reset,
			is_feature_name,
			is_tuple_label,
			is_local,
			is_argument,
			is_identifier,
			is_equal,
			local_name,
			argument_name,
			object_test_local_name,
			is_object_test_local,
			iteration_item_name,
			is_iteration_item,
			inline_separate_argument_name,
			is_inline_separate_argument,
			as_expression
		end

	ET_CLASS_NAME
		undefine
			first_position,
			last_position,
			is_identifier,
			is_equal,
			break
		end

	ET_LOCAL_NAME
		undefine
			first_position,
			last_position,
			reset,
			is_equal,
			break
		redefine
			is_instance_free,
			is_never_void,
			add_separate_arguments
		end

	ET_OBJECT_TEST_LOCAL_NAME
		undefine
			first_position,
			last_position,
			reset,
			is_equal,
			break
		redefine
			is_instance_free,
			is_never_void,
			add_separate_arguments
		end

	ET_ARGUMENT_NAME
		undefine
			first_position,
			last_position,
			reset,
			is_equal,
			break
		redefine
			is_instance_free,
			is_never_void,
			add_separate_arguments
		end

	ET_LABEL
		undefine
			first_position,
			last_position,
			is_equal,
			break
		end

	ET_TAG
		undefine
			first_position,
			last_position,
			is_equal,
			break
		end

	ET_WRITABLE
		undefine
			first_position,
			last_position,
			reset,
			is_equal,
			break
		redefine
			is_instance_free,
			is_never_void,
			add_separate_arguments
		end

	ET_CHOICE_CONSTANT
		undefine
			first_position,
			last_position,
			reset,
			is_equal,
			break
		redefine
			is_instance_free,
			is_never_void,
			add_separate_arguments
		end

	ET_NOTE_TERM
		undefine
			first_position,
			last_position,
			is_equal,
			break
		end

	ET_TOKEN
		rename
			text as name,
			set_text as set_name
		undefine
			is_equal
		redefine
			make,
			set_name
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

	KL_IMPORTED_ANY_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

create

	make, make_with_hash_code

feature {NONE} -- Initialization

	make (a_name: like name)
			-- Create a new identifier.
		do
			make_with_hash_code (a_name, new_hash_code (a_name))
		end

	make_with_hash_code (a_name: like name; a_code: INTEGER)
			-- Create a new identifier with hash code `a_code'.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_code_not_void: a_code >= 0
		do
			hash_code := a_code
			name := a_name
			make_leaf
		ensure
			name_set: name = a_name
			line_set: line = no_line
			column_set: column = no_column
			hash_code_set: hash_code = a_code
		end

feature -- Initialization

	reset
			-- Reset identifier as it was just after it was last parsed.
		do
			index := 0
			if not is_local and not is_argument and not is_object_test_local and not is_inline_separate_argument then
				seed := 0
				if is_tuple_label then
					set_feature_name (True)
				end
			end
		end

feature -- Access

	lower_name: STRING
			-- Lower-name of identifier
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in lower case,
			-- otherwise return a new object at each call.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := name
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c >= 'A' and c <= 'Z' then
					Result := Result.as_lower
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	upper_name: STRING
			-- Upper-name of identifer
			-- (using UTF-8 encoding)
			-- (May return the same object as `name' if already in upper case,
			-- otherwise return a new object at each call.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := name
			nb := Result.count
			from i := 1 until i > nb loop
				c := Result.item (i)
				if c >= 'a' and c <= 'z' then
					Result := Result.as_upper
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	hash_code: INTEGER
			-- Hash code value

	identifier: ET_IDENTIFIER
			-- Identifier
		do
			Result := Current
		end

	note_term_value: STRING
			-- Value of current note term
		do
			Result := name
		end

feature -- Status report

	is_identifier: BOOLEAN = True
			-- Is current feature name an identifier?

	is_feature_name: BOOLEAN
			-- Is current identier a feature name?
		do
			Result := (status_code = feature_name_code)
		end

	is_local: BOOLEAN
			-- Is current identifier a local variable name?
		do
			Result := (status_code = local_code)
		end

	is_object_test_local: BOOLEAN
			-- Is current identifier actually an object-test local name?
		do
			Result := (status_code = object_test_local_code)
		end

	is_iteration_item: BOOLEAN
			-- Is current identifier actually an iteration item name
			-- (or an iteration cursor name when using some obsolete syntax)?
		do
			Result := (status_code = iteration_item_code)
		end

	is_temporary: BOOLEAN
			-- Is current identifier a temporary variable name?
			-- (Used in C code generation for example.)
		do
			Result := (status_code = temporary_code)
		end

	is_argument: BOOLEAN
			-- Is current identifier a formal argument name?
		do
			Result := (status_code = argument_code)
		end

	is_tuple_label: BOOLEAN
			-- Is current identifier a tuple label?
		do
			Result := (status_code = tuple_label_code)
		end

	is_agent_open_operand: BOOLEAN
			-- Is current identifier an agent open operand?
		do
			Result := (status_code = agent_open_operand_code)
		end

	is_agent_closed_operand: BOOLEAN
			-- Is current identifier an agent closed operand?
		do
			Result := (status_code = agent_closed_operand_code)
		end

	is_inline_separate_argument: BOOLEAN
			-- Is current identifier an inline separate instruction argument name?
		do
			Result := (status_code = inline_separate_argument_code)
		end

	is_never_void: BOOLEAN
			-- Can current expression never be void?
		do
			Result := is_object_test_local
		end

	is_instance_free: BOOLEAN
			-- Does current expression not depend on 'Current' or its attributes?
			-- Note that we do not consider unqualified calls and Precursors as
			-- instance-free because it's not always possible syntactically
			-- to determine whether the feature being called is a class feature
			-- or not.
		do
			Result := status_code /= no_code and
				not is_feature_name and not is_tuple_label
		end

	has_note_term_value (a_value: STRING): BOOLEAN
			-- Does current note term have value `a_value'?
			-- (case-insensitive comparison)
		do
			Result := STRING_.same_case_insensitive (name, a_value)
		end

	valid_name (a_name: READABLE_STRING_GENERAL): BOOLEAN
			-- Is `a_name' a valid value for `name'?
		require
			a_name_not_void: a_name /= Void
		do
			Result := {RX_PCRE_ROUTINES}.regexp (name_regexp).recognizes (a_name)
		ensure
			instance_free: class
			definition: Result = {RX_PCRE_ROUTINES}.regexp (name_regexp).recognizes (a_name)
		end

feature -- Status setting

	set_feature_name (b: BOOLEAN)
			-- Set `is_feature_name' to `b'.
		do
			if b then
				status_code := feature_name_code
			else
				status_code := no_code
			end
		ensure
			feature_name_set: is_feature_name = b
		end

	set_local (b: BOOLEAN)
			-- Set `is_local' to `b'.
		do
			if b then
				status_code := local_code
			else
				status_code := no_code
			end
		ensure
			local_set: is_local = b
		end

	set_object_test_local (b: BOOLEAN)
			-- Set `is_object_test_local' to `b'.
		do
			if b then
				status_code := object_test_local_code
			else
				status_code := no_code
			end
		ensure
			object_test_local_set: is_object_test_local = b
		end

	set_iteration_item (b: BOOLEAN)
			-- Set `is_iteration_item' to `b'.
		do
			if b then
				status_code := iteration_item_code
			else
				status_code := no_code
			end
		ensure
			iteration_item_set: is_iteration_item = b
		end

	set_temporary (b: BOOLEAN)
			-- Set `is_temporary' to `b'.
		do
			if b then
				status_code := temporary_code
			else
				status_code := no_code
			end
		ensure
			temporary_set: is_temporary = b
		end

	set_argument (b: BOOLEAN)
			-- Set `is_argument' to `b'.
		do
			if b then
				status_code := argument_code
			else
				status_code := no_code
			end
		ensure
			argument_set: is_argument = b
		end

	set_tuple_label (b: BOOLEAN)
			-- Set `is_tuple_label' to `b'.
		do
			if b then
				status_code := tuple_label_code
			else
				status_code := no_code
			end
		ensure
			tuple_label_set: is_tuple_label = b
		end

	set_agent_open_operand (b: BOOLEAN)
			-- Set `is_agent_open_operand' to `b'.
		do
			if b then
				status_code := agent_open_operand_code
			else
				status_code := no_code
			end
		ensure
			agent_open_operand_set: is_agent_open_operand = b
		end

	set_agent_closed_operand (b: BOOLEAN)
			-- Set `is_agent_closed_operand' to `b'.
		do
			if b then
				status_code := agent_closed_operand_code
			else
				status_code := no_code
			end
		ensure
			agent_closed_operand_set: is_agent_closed_operand = b
		end

	set_inline_separate_argument (b: BOOLEAN)
			-- Set `is_inline_separate_argument' to `b'.
		do
			if b then
				status_code := inline_separate_argument_code
			else
				status_code := no_code
			end
		ensure
			inline_separate_argument_set: is_inline_separate_argument = b
		end

feature -- Setting

	set_name (a_name: like name)
			-- Set `name' to `a_name'.
		do
			name := a_name
			hash_code := new_hash_code (a_name)
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		local
			l_name: STRING
		do
			if other = Current then
				Result := True
			elseif attached {ET_IDENTIFIER} other as an_id then
				if hash_code = an_id.hash_code then
					l_name := an_id.name
					if l_name = name then
						Result := True
					else
						Result := STRING_.same_case_insensitive (name, l_name)
					end
				end
			end
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			l_name: STRING
		do
			if other = Current then
				Result := True
			elseif attached {ET_IDENTIFIER} other as an_id then
				if hash_code = an_id.hash_code then
					l_name := an_id.name
					if l_name = name then
						Result := True
					else
						Result := STRING_.same_case_insensitive (name, l_name)
					end
				end
			end
		end

	same_class_name (other: ET_CLASS_NAME): BOOLEAN
			-- Are class name and `other' the same class name?
			-- (case insensitive)
		local
			l_name: STRING
		do
			if other = Current then
				Result := True
			elseif attached {ET_IDENTIFIER} other as an_id then
				if hash_code = an_id.hash_code then
					l_name := an_id.name
					if l_name = name then
						Result := True
					else
						Result := STRING_.same_case_insensitive (name, l_name)
					end
				end
			end
		end

	same_identifier (other: ET_IDENTIFIER): BOOLEAN
			-- Are current identifier and `other' the same identifier?
			-- (case insensitive)
		require
			other_not_void: other /= Void
		local
			l_name: STRING
		do
			if other = Current then
				Result := True
			elseif hash_code = other.hash_code then
				l_name := other.name
				if l_name = name then
					Result := True
				else
					Result := STRING_.same_case_insensitive (name, l_name)
				end
			end
		end

	is_equal (other: like Current): BOOLEAN
			-- Are current identifier and `other' considered equal?
		do
			if ANY_.same_types (Current, other) then
				Result := same_identifier (other)
			end
		end

feature -- Conversion

	local_name: ET_LOCAL_NAME
			-- Current name viewed as a local name
		do
			Result := Current
		end

	argument_name: ET_ARGUMENT_NAME
			-- Current name viewed as an argument name
		do
			Result := Current
		end

	object_test_local_name: ET_OBJECT_TEST_LOCAL_NAME
			-- Current name viewed as an object-test local name
		do
			Result := Current
		end

	iteration_item_name: ET_IDENTIFIER
			-- Current name viewed as an iteration item name
		do
			Result := Current
		end

	inline_separate_argument_name: ET_IDENTIFIER
			-- Current name viewed as an inline separate argument name
		do
			Result := Current
		end

	as_expression: ET_EXPRESSION
			-- Current name viewed as an expression
		do
			Result := Current
		end

feature -- SCOOP

	add_separate_arguments (a_list: DS_ARRAYED_LIST [ET_IDENTIFIER]; a_closure: ET_CLOSURE)
			-- Add to `a_list' inline separate arguments or formal arguments which
			-- when controlled (i.e. when their type is separate) implies that when
			-- the current expression is involved in the target of a separate call
			-- this target is also controlled.
			-- `a_closure' is the closure (i.e. inline agent or enclosing feature)
			-- in which the current expression appears.
			-- (Used when determining the SCOOP sessions to be used when recording
			-- a separate call to another SCOOP processor.)
		local
			i, nb: INTEGER
			l_found: BOOLEAN
			l_id: ET_IDENTIFIER
		do
			if is_inline_separate_argument then
					-- Avoid adding twice the same inline separate argument.
					-- Linear search is fine here because it is not expected
					-- to have many items in `a_list'.
				nb := a_list.count
				from i := 1 until i > nb loop
					l_id := a_list.item (i)
					if l_id.is_inline_separate_argument and then l_id.seed = seed then
						l_found := True
							-- Jump out of the loop.
						i := nb
					end
					i := i + 1
				end
				if not l_found then
					a_list.force_last (Current)
				end
			elseif is_argument then
					-- Avoid adding twice the same formal argument.
					-- Linear search is fine here because it is not expected
					-- to have many items in `a_list'.
				nb := a_list.count
				from i := 1 until i > nb loop
					l_id := a_list.item (i)
					if l_id.is_argument and then l_id.seed = seed then
						l_found := True
							-- Jump out of the loop.
						i := nb
					end
					i := i + 1
				end
				if not l_found then
					a_list.force_last (Current)
				end
			elseif is_object_test_local then
				if attached a_closure.object_tests as l_object_tests and then (seed >= 1 and seed <= l_object_tests.count) then
					l_object_tests.object_test (seed).expression.add_separate_arguments (a_list, a_closure)
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_identifier (Current)
		end

feature {NONE} -- Implementation

	new_hash_code (a_name: STRING): INTEGER
			-- Hash code value of `a_name' which doesn't
			-- take case sensitivity into account
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			nb := a_name.count
			from i := 1 until i > nb loop
					-- The magic number 8388593 below is the greatest prime lower than
					-- 2^23 so that this magic number shifted to the left does not exceed 2^31.
				Result := ((Result \\ 8388593) |<< 8) + a_name.item (i).upper.code
				i := i + 1
			end
			if Result < 0 then
				Result := - (Result + 1)
			end
		ensure
			new_hash_code_not_negatige: Result >= 0
		end


	name_regexp: STRING = "[a-zA-Z][a-zA-Z0-9_]*"
			-- Regular expression for `name'

	status_code: CHARACTER
	feature_name_code: CHARACTER = 'f'
	local_code: CHARACTER = 'l'
	object_test_local_code: CHARACTER = 'm'
	iteration_item_code: CHARACTER = 'i'
	argument_code: CHARACTER = 'a'
	temporary_code: CHARACTER = 'v'
	tuple_label_code: CHARACTER = 't'
	agent_open_operand_code: CHARACTER = 'o'
	agent_closed_operand_code: CHARACTER = 'c'
	inline_separate_argument_code: CHARACTER = 's'
	no_code: CHARACTER = '%U'
			-- Status codes

end
