note

	description:

		"Eiffel alias 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_FREE_NAME

inherit

	ET_ALIAS_NAME
		undefine
			hash_code,
			lower_name,
			same_call_name,
			is_bracket,
			is_parenthesis,
			is_infix_and,
			is_infix_and_symbol,
			is_infix_and_then,
			is_infix_and_then_symbol,
			is_infix_div,
			is_infix_divide,
			is_infix_ge,
			is_infix_gt,
			is_infix_implies,
			is_infix_implies_symbol,
			is_infix_le,
			is_infix_lt,
			is_infix_minus,
			is_infix_mod,
			is_infix_or,
			is_infix_or_symbol,
			is_infix_or_else,
			is_infix_or_else_symbol,
			is_infix_plus,
			is_infix_power,
			is_infix_times,
			is_infix_xor,
			is_infix_xor_symbol,
			is_infix_dotdot,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not,
			is_prefix_not_symbol,
			operator_lower_name
		redefine
			alias_name, alias_lower_name,
			operator_name,
			process,
			is_infix, is_infix_freeop,
			is_prefix, is_prefix_freeop,
			is_prefixable, is_infixable,
			set_prefix, set_infix,
			same_alias_name
		end

	ET_FREE_NAME
		undefine
			is_alias, is_infix, is_prefix,
			is_prefix_freeop, is_infix_freeop
		end

create

	make_infix, make_prefix

feature {NONE} -- Initialization

	make_infix (a_string: like alias_string)
			-- Create a new infix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_string: like alias_string)
			-- Create a new prefix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.prefix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Status report

	is_prefix: BOOLEAN
			-- Is current feature name of the form unary 'alias "..."'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix: BOOLEAN
			-- Is current feature name of the form binary 'alias "..."'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_prefix_freeop: BOOLEAN
			-- Is current feature name of the form unary 'alias "free-operator"'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix_freeop: BOOLEAN
			-- Is current feature name of the form binary 'alias "free-operator"'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_prefixable: BOOLEAN
			-- Can current alias be used as the name of a prefix feature?
		do
			Result := True
		end

	is_infixable: BOOLEAN
			-- Can current alias be used as the name of an infix feature?
		do
			Result := True
		end

feature -- Access

	alias_name: STRING
			-- Name of alias
			-- (using UTF-8 encoding)
		do
			create Result.make (operator_name.count + 8)
			Result.append_string (alias_double_quote)
			Result.append_string (operator_name)
			Result.append_character ('%"')
		end

	alias_lower_name: STRING
			-- Lower-name of alias
			-- (using UTF-8 encoding)
			-- (May return the same object as `alias_name' if already in lower case.)
		local
			i, nb: INTEGER
			c: CHARACTER
		do
			Result := alias_name
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

	operator_name: STRING
			-- Name of free operator
			-- (using UTF-8 encoding)
		do
			Result := alias_string.value
		end

feature -- Status setting

	set_infix
			-- Set `is_infix_freeop'.
		do
			code := tokens.infix_freeop_code
		ensure then
			is_infix_freeop: is_infix_freeop
		end

	set_prefix
			-- Set `is_prefix_freeop'.
		do
			code := tokens.prefix_freeop_code
		ensure then
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Comparison

	same_alias_name (other: ET_ALIAS_NAME): BOOLEAN
			-- Are `Current' and `other' the same alias name?
			-- Do not take "infix" and "prefix" properties into account.
		do
			if other = Current then
				Result := True
			elseif attached {ET_FREE_NAME} other as op then
				if hash_code = op.hash_code then
					if op.operator_name = operator_name then
						Result := True
					else
						Result := STRING_.same_case_insensitive (operator_name, op.operator_name)
					end
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_alias_free_name (Current)
		end

feature {NONE} -- Constants

	alias_double_quote: STRING = "alias %""

invariant

	alias_string_not_empty: alias_string.value.count > 0

end
