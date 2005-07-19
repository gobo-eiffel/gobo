indexing

	description:

		"Eiffel identifiers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_IDENTIFIER

inherit

	ET_FEATURE_NAME
		undefine
			first_position, last_position
		redefine
			reset,
			is_local, is_argument,
			is_identifier, is_equal
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
		end

	ET_ARGUMENT_NAME
		undefine
			first_position, last_position,
			reset, is_equal
		end

	ET_TAG
		undefine
			first_position, last_position,
			is_equal
		end

	ET_WRITABLE
		undefine
			first_position, last_position,
			reset, is_equal
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
			reset, is_equal, is_instruction,
			as_instruction
		end

	ET_FEATURE_CALL_INSTRUCTION
		rename
			name as identifier
		undefine
			first_position, last_position,
			reset, is_equal, is_expression,
			as_expression
		end

	KL_IMPORTED_STRING_ROUTINES
		export
			{NONE} all
		undefine
			is_equal
		end

	KL_IMPORTED_CHARACTER_ROUTINES
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
			-- Reset identifier as it was when it was first parsed.
		do
			if not is_local and not is_argument then
				seed := 0
			end
		end

feature -- Access

	lower_name: STRING is
			-- Lower-name of identifier
			-- (May return the same object as `name' if already in lower case.)
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
			-- (May return the same object as `name' if already in upper case.)
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

	is_local: BOOLEAN
			-- Is current identifier a local variable name?

	is_argument: BOOLEAN
			-- Is current identifier a formal argument name?

feature -- Status setting

	set_local (b: BOOLEAN) is
			-- Set `is_local' to `b'.
		do
			is_local := b
		ensure
			local_set: is_local = b
		end

	set_argument (b: BOOLEAN) is
			-- Set `is_argument' to `b'.
		do
			is_argument := b
		ensure
			argument_set: is_argument = b
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
			c: INTEGER
			i, nb: INTEGER
		do
			nb := a_name.count
			from i := 1 until i > nb loop
				c := CHARACTER_.as_upper (a_name.item (i)).code - 48
				inspect i \\ 5
				when 0 then
					Result := INTEGER_.bit_or (Result, c)
				when 1 then
					Result := INTEGER_.bit_or (Result, c * 64) -- 2^6
				when 2 then
					Result := INTEGER_.bit_or (Result, c * 4096) -- 2^12
				when 3 then
					Result := INTEGER_.bit_or (Result, c * 262144) -- 2^18
				when 4 then
					Result := INTEGER_.bit_or (Result, c * 16777216) -- 2^24
				else
				end
				i := i + 1
			end
			if Result < 0 then
				Result := - (Result + 1)
			end
		ensure
			new_hash_code_non_negatige: Result >= 0
		end

end
