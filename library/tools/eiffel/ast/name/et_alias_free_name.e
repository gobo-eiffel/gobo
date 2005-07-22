indexing

	description:

		"Eiffel alias 'free-operator' feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
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
			is_infix_and,
			is_infix_and_then,
			is_infix_div,
			is_infix_divide,
			is_infix_ge,
			is_infix_gt,
			is_infix_implies,
			is_infix_le,
			is_infix_lt,
			is_infix_minus,
			is_infix_mod,
			is_infix_or,
			is_infix_or_else,
			is_infix_plus,
			is_infix_power,
			is_infix_times,
			is_infix_xor,
			is_infix_dotdot,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not
		redefine
			name, process,
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

	make_infix (a_string: like alias_string) is
			-- Create a new infix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (free_operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_infix_freeop: is_infix_freeop
		end

	make_prefix (a_string: like alias_string) is
			-- Create a new prefix 'alias "<free-operator>"' feature name.
		require
			a_string_not_void: a_string /= Void
			a_string_not_empty: a_string.value.count > 0
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.prefix_freeop_code
			hash_code := STRING_.case_insensitive_hash_code (free_operator_name)
		ensure
			alias_string_set: alias_string = a_string
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Status report

	is_prefix: BOOLEAN is
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix: BOOLEAN is
			-- Is current feature name of the form 'infix ...'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_prefix_freeop: BOOLEAN is
			-- Is current feature name of the form 'prefix "free-operator"'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_infix_freeop: BOOLEAN is
			-- Is current feature name of the form 'infix "free-operator"'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_prefixable: BOOLEAN is
			-- Can current alias be used as the name of a prefix feature?
		do
			Result := True
		end

	is_infixable: BOOLEAN is
			-- Can current alias be used as the name of an infix feature?
		do
			Result := True
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			create Result.make (free_operator_name.count + 8)
			Result.append_string (alias_double_quote)
			Result.append_string (free_operator_name)
			Result.append_character ('%"')
		end

	free_operator_name: STRING is
			-- Name of free operator
		do
			Result := alias_string.value
		end

feature -- Status setting

	set_infix is
			-- Set `is_infix_freeop'.
		do
			code := tokens.infix_freeop_code
		ensure then
			is_infix_freeop: is_infix_freeop
		end

	set_prefix is
			-- Set `is_prefix_freeop'.
		do
			code := tokens.prefix_freeop_code
		ensure then
			is_prefix_freeop: is_prefix_freeop
		end

feature -- Comparison

	same_alias_name (other: ET_ALIAS_NAME): BOOLEAN is
			-- Are `Current' and `other' the same alias name?
			-- Do not take "infix" and "prefix" properties into account.
		local
			op: ET_FREE_NAME
		do
			if other = Current then
				Result := True
			else
				op ?= ANY_.to_any (other)
				if op /= Void then
					if hash_code = op.hash_code then
						if op.free_operator_name = free_operator_name then
							Result := True
						else
							Result := STRING_.same_case_insensitive (free_operator_name, op.free_operator_name)
						end
					end
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_alias_free_name (Current)
		end

feature {NONE} -- Constants

	alias_double_quote: STRING is "alias %""

invariant

	alias_string_not_empty: alias_string.value.count > 0

end
