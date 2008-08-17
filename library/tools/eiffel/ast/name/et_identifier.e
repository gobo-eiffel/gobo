indexing

	description:

		"Eiffel identifiers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER

inherit

	ET_FEATURE_NAME
		undefine
			first_position, last_position
		redefine
			reset, is_tuple_label,
			is_local, is_argument,
			is_identifier, is_equal,
			local_name, argument_name,
			object_test_local_name,
			is_object_test_local
		end

	ET_CLASS_NAME
		undefine
			first_position, last_position,
			is_identifier, is_equal
		end

	ET_LOCAL_NAME
		undefine
			first_position, last_position,
			reset, is_equal
		redefine
			is_never_void
		end

	ET_OBJECT_TEST_LOCAL_NAME
		undefine
			first_position, last_position,
			reset, is_equal
		redefine
			is_never_void
		end

	ET_ARGUMENT_NAME
		undefine
			first_position, last_position,
			reset, is_equal, is_never_void
		end

	ET_LABEL
		undefine
			first_position, last_position,
			is_equal
		end

	ET_TAG
		undefine
			first_position, last_position,
			is_equal
		end

	ET_WRITABLE
		undefine
			first_position, last_position,
			reset, is_equal, is_never_void
		end

	ET_CHOICE_CONSTANT
		undefine
			first_position, last_position,
			reset, is_equal, is_never_void
		end

	ET_INDEXING_TERM
		undefine
			first_position, last_position,
			is_equal
		end

	ET_TOKEN
		rename
			text as name
		undefine
			is_equal
		redefine
			make
		end

	ET_FEATURE_CALL_EXPRESSION
		rename
			name as identifier
		undefine
			first_position, last_position,
			is_tuple_label, reset, is_equal,
			is_never_void
		end

	ET_FEATURE_CALL_INSTRUCTION
		rename
			name as identifier
		undefine
			first_position, last_position,
			is_tuple_label, reset, is_equal
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

	make (a_name: like name) is
			-- Create a new identifier.
		do
			make_with_hash_code (a_name, new_hash_code (a_name))
		end

	make_with_hash_code (a_name: like name; a_code: INTEGER) is
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

	reset is
			-- Reset identifier as it was just after it was last parsed.
		do
			if not is_local and not is_argument then
				seed := 0
			end
		end

feature -- Access

	lower_name: STRING is
			-- Lower-name of identifier
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

	upper_name: STRING is
			-- Upper-name of identifer
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

	target: ET_EXPRESSION is
			-- Target
		do
		ensure then
			no_target: Result = Void
		end

	arguments: ET_ACTUAL_ARGUMENTS is
			-- Arguments
		do
		ensure then
			no_arguments: Result = Void
		end

	hash_code: INTEGER
			-- Hash code value

	identifier: ET_IDENTIFIER is
			-- Identifier
		do
			Result := Current
		end

feature -- Status report

	is_identifier: BOOLEAN is True
			-- Is current feature name an identifier?

	is_local: BOOLEAN is
			-- Is current identifier a local variable name?
		do
			Result := (status_code = local_code)
		end

	is_object_test_local: BOOLEAN is
			-- Is current identifier actually an object-test local name?
		do
			Result := (status_code = object_test_local_code)
		end

	is_temporary: BOOLEAN is
			-- Is current identifier a temporary variable name?
			-- (Used in C code generation for example.)
		do
			Result := (status_code = temporary_code)
		end

	is_argument: BOOLEAN is
			-- Is current identifier a formal argument name?
		do
			Result := (status_code = argument_code)
		end

	is_tuple_label: BOOLEAN is
			-- Is current identifier a tuple label?
		do
			Result := (status_code = tuple_label_code)
		end

	is_agent_open_operand: BOOLEAN is
			-- Is current identifier an agent open operand?
		do
			Result := (status_code = agent_open_operand_code)
		end

	is_agent_closed_operand: BOOLEAN is
			-- Is current identifier an agent closed operand?
		do
			Result := (status_code = agent_closed_operand_code)
		end

	is_instruction: BOOLEAN is
			-- Is current identifier an argumentless unqualified call?
		do
			Result := (status_code = instruction_code)
		end

	is_never_void: BOOLEAN is
			-- Can current expression never be void?
		do
			Result := is_object_test_local
		end

feature -- Status setting

	set_local (b: BOOLEAN) is
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

	set_object_test_local (b: BOOLEAN) is
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

	set_temporary (b: BOOLEAN) is
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

	set_argument (b: BOOLEAN) is
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

	set_tuple_label (b: BOOLEAN) is
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

	set_agent_open_operand (b: BOOLEAN) is
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

	set_agent_closed_operand (b: BOOLEAN) is
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

	set_instruction (b: BOOLEAN) is
			-- Set `is_instruction' to `b'.
		do
			if b then
				status_code := instruction_code
			else
				status_code := no_code
			end
		ensure
			instruction_set: is_instruction = b
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		local
			an_id: ET_IDENTIFIER
			l_name: STRING
		do
			if other = Current then
				Result := True
			else
				an_id ?= other
				if an_id /= Void then
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
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		local
			an_id: ET_IDENTIFIER
			l_name: STRING
		do
			if other = Current then
				Result := True
			else
				an_id ?= other
				if an_id /= Void then
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
		end

	same_class_name (other: ET_CLASS_NAME): BOOLEAN is
			-- Are class name and `other' the same class name?
			-- (case insensitive)
		local
			an_id: ET_IDENTIFIER
			l_name: STRING
		do
			if other = Current then
				Result := True
			else
				an_id ?= other
				if an_id /= Void then
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
		end

	same_identifier (other: ET_IDENTIFIER): BOOLEAN is
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

	is_equal (other: like Current): BOOLEAN is
			-- Are current identifier and `other' considered equal?
		do
			if ANY_.same_types (Current, other) then
				Result := same_identifier (other)
			end
		end

feature -- Conversion

	local_name: ET_LOCAL_NAME is
			-- Current name viewed as a local name
		do
			Result := Current
		end

	argument_name: ET_ARGUMENT_NAME is
			-- Current name viewed as an argument name
		do
			Result := Current
		end

	object_test_local_name: ET_OBJECT_TEST_LOCAL_NAME is
			-- Current name viewed as an object-test local name
		do
			Result := Current
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_identifier (Current)
		end

feature {NONE} -- Implementation

	new_hash_code (a_name: STRING): INTEGER is
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

	status_code: CHARACTER
	local_code: CHARACTER is 'l'
	object_test_local_code: CHARACTER is 'm'
	argument_code: CHARACTER is 'a'
	temporary_code: CHARACTER is 'v'
	tuple_label_code: CHARACTER is 't'
	instruction_code: CHARACTER is 'i'
	agent_open_operand_code: CHARACTER is 'o'
	agent_closed_operand_code: CHARACTER is 'c'
	no_code: CHARACTER is '%U'
			-- Status codes

end
