note

	description:

		"Eiffel alias feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005-2017, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_NAME

inherit

	ET_CALL_NAME
		redefine
			is_alias,
			is_bracket,
			is_infix,
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
			is_parenthesis,
			is_prefix,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not
		end

	ET_TOKEN_CODES
		export {NONE} all end

create

	make_and,
	make_implies,
	make_or,
	make_xor,
	make_div,
	make_divide,
	make_ge,
	make_gt,
	make_le,
	make_lt,
	make_minus,
	make_mod,
	make_plus,
	make_power,
	make_times,
	make_and_then,
	make_or_else,
	make_dotdot,
	make_not,
	make_bracket,
	make_parenthesis

feature {NONE} -- Initialization

	make_and (a_string: like alias_string)
			-- Create a new 'alias "and"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_and_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_and: is_infix_and
		end

	make_implies (a_string: like alias_string)
			-- Create a new 'alias "implies"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_implies_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_implies: is_infix_implies
		end

	make_or (a_string: like alias_string)
			-- Create a new 'alias "or"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_or_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_or: is_infix_or
		end

	make_xor (a_string: like alias_string)
			-- Create a new 'alias "xor"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_xor_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_xor: is_infix_xor
		end

	make_div (a_string: like alias_string)
			-- Create a new 'alias "//"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_div_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_div: is_infix_div
		end

	make_divide (a_string: like alias_string)
			-- Create a new 'alias "/"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_divide_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_divide: is_infix_divide
		end

	make_ge (a_string: like alias_string)
			-- Create a new 'alias ">="' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_ge_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_ge: is_infix_ge
		end

	make_gt (a_string: like alias_string)
			-- Create a new 'alias ">"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_gt_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_gt: is_infix_gt
		end

	make_le (a_string: like alias_string)
			-- Create a new 'alias "<="' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_le_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_le: is_infix_le
		end

	make_lt (a_string: like alias_string)
			-- Create a new 'alias "<"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_lt_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_lt: is_infix_lt
		end

	make_minus (a_string: like alias_string)
			-- Create a new 'alias "-"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_minus_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_minus: is_infix_minus
		end

	make_mod (a_string: like alias_string)
			-- Create a new 'alias "\\"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_mod_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_mod: is_infix_mod
		end

	make_plus (a_string: like alias_string)
			-- Create a new 'alias "+"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_plus_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_plus: is_infix_plus
		end

	make_power (a_string: like alias_string)
			-- Create a new 'alias "^"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_power_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_power: is_infix_power
		end

	make_times (a_string: like alias_string)
			-- Create a new 'alias "*"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_times_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_times: is_infix_times
		end

	make_and_then (a_string: like alias_string)
			-- Create a new 'alias "and then"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_and_then_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_and_then: is_infix_and_then
		end

	make_or_else (a_string: like alias_string)
			-- Create a new 'alias "or else"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_or_else_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_or_else: is_infix_or_else
		end

	make_dotdot (a_string: like alias_string)
			-- Create a new 'alias ".."' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.infix_dotdot_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_dotdot: is_infix_dotdot
		end

	make_not (a_string: like alias_string)
			-- Create a new 'alias "not"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.prefix_not_code
		ensure
			alias_string_set: alias_string = a_string
			is_prefix_not: is_prefix_not
		end

	make_bracket (a_string: like alias_string)
			-- Create a new 'alias "[]"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.alias_bracket_code
		ensure
			alias_string_set: alias_string = a_string
			is_bracket: is_bracket
		end

	make_parenthesis (a_string: like alias_string)
			-- Create a new 'alias "()"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := default_keyword
			alias_string := a_string
			code := tokens.alias_parenthesis_code
		ensure
			alias_string_set: alias_string = a_string
			is_parenthesis: is_parenthesis
		end

feature -- Status report

	is_alias: BOOLEAN
			-- Is current feature name of the form 'alias "..."'?
		do
			Result := True
		end

	is_keyword: BOOLEAN
			-- Is the operator a keyword (or two keywords)?
		do
			Result := (code >= tokens.min_keyword_code and code <= tokens.max_keyword_code)
		end

	is_bracket: BOOLEAN
			-- Is current feature name of the form 'alias "[]"'?
		do
			Result := (code = tokens.alias_bracket_code)
		end

	is_infix: BOOLEAN
			-- Is current feature name of the form 'infix ...'?
		do
			Result := (code >= tokens.min_infix_code and code <= tokens.max_infix_code)
		end

	is_infix_and: BOOLEAN
			-- Is current feature name of the form 'infix "and"'?
		do
			Result := (code = tokens.infix_and_code)
		end

	is_infix_and_then: BOOLEAN
			-- Is current feature name of the form 'infix "and then"'?
		do
			Result := (code = tokens.infix_and_then_code)
		end

	is_infix_div: BOOLEAN
			-- Is current feature name of the form 'infix "//"'?
		do
			Result := (code = tokens.infix_div_code)
		end

	is_infix_divide: BOOLEAN
			-- Is current feature name of the form 'infix "/"'?
		do
			Result := (code = tokens.infix_divide_code)
		end

	is_infix_dotdot: BOOLEAN
			-- Is current feature name of the form 'infix ".."'?
		do
			Result := (code = tokens.infix_dotdot_code)
		end

	is_infix_ge: BOOLEAN
			-- Is current feature name of the form 'infix ">="'?
		do
			Result := (code = tokens.infix_ge_code)
		end

	is_infix_gt: BOOLEAN
			-- Is current feature name of the form 'infix ">"'?
		do
			Result := (code = tokens.infix_gt_code)
		end

	is_infix_implies: BOOLEAN
			-- Is current feature name of the form 'infix "implies"'?
		do
			Result := (code = tokens.infix_implies_code)
		end

	is_infix_le: BOOLEAN
			-- Is current feature name of the form 'infix "<="'?
		do
			Result := (code = tokens.infix_le_code)
		end

	is_infix_lt: BOOLEAN
			-- Is current feature name of the form 'infix "<"'?
		do
			Result := (code = tokens.infix_lt_code)
		end

	is_infix_minus: BOOLEAN
			-- Is current feature name of the form 'infix "-"'?
		do
			Result := (code = tokens.infix_minus_code)
		end

	is_infix_mod: BOOLEAN
			-- Is current feature name of the form 'infix "\\"'?
		do
			Result := (code = tokens.infix_mod_code)
		end

	is_infix_or: BOOLEAN
			-- Is current feature name of the form 'infix "or"'?
		do
			Result := (code = tokens.infix_or_code)
		end

	is_infix_or_else: BOOLEAN
			-- Is current feature name of the form 'infix "or else"'?
		do
			Result := (code = tokens.infix_or_else_code)
		end

	is_infix_plus: BOOLEAN
			-- Is current feature name of the form 'infix "+"'?
		do
			Result := (code = tokens.infix_plus_code)
		end

	is_infix_power: BOOLEAN
			-- Is current feature name of the form 'infix "^"'?
		do
			Result := (code = tokens.infix_power_code)
		end

	is_infix_times: BOOLEAN
			-- Is current feature name of the form 'infix "*"'?
		do
			Result := (code = tokens.infix_times_code)
		end

	is_infix_xor: BOOLEAN
			-- Is current feature name of the form 'infix "xor"'?
		do
			Result := (code = tokens.infix_xor_code)
		end

	is_parenthesis: BOOLEAN
			-- Is current feature name of the form 'alias "()"'?
		do
			Result := (code = tokens.alias_parenthesis_code)
		end

	is_prefix: BOOLEAN
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := (code >= tokens.min_prefix_code and code <= tokens.max_prefix_code)
		end

	is_prefix_minus: BOOLEAN
			-- Is current feature name of the form 'prefix "-"'?
		do
			Result := (code = tokens.prefix_minus_code)
		end

	is_prefix_plus: BOOLEAN
			-- Is current feature name of the form 'prefix "+"'?
		do
			Result := (code = tokens.prefix_plus_code)
		end

	is_prefix_not: BOOLEAN
			-- Is current feature name of the form 'prefix "not"'?
		do
			Result := (code = tokens.prefix_not_code)
		end

	is_prefixable: BOOLEAN
			-- Can current alias be used as the name of a prefix feature?
		do
			Result := is_prefix or is_infix_plus or is_infix_minus
		ensure
			is_prefix: is_prefix implies Result
		end

	is_infixable: BOOLEAN
			-- Can current alias be used as the name of an infix feature?
		do
			Result := is_infix or is_prefix_plus or is_prefix_minus
		ensure
			is_infix: is_infix implies Result
		end

feature -- Access

	name: STRING
			-- Name of feature
		do
			Result := alias_name
		end

	lower_name: STRING
			-- Lower-name of feature call
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := name
		end

	alias_name: STRING
			-- Name of alias
		do
			inspect code
			when alias_bracket_code then
				Result := tokens.alias_bracket_name
			when alias_parenthesis_code then
				Result := tokens.alias_parenthesis_name
			when infix_and_code then
				Result := tokens.alias_and_name
			when infix_and_then_code then
				Result := tokens.alias_and_then_name
			when infix_div_code then
				Result := tokens.alias_div_name
			when infix_divide_code then
				Result := tokens.alias_divide_name
			when infix_ge_code then
				Result := tokens.alias_ge_name
			when infix_gt_code then
				Result := tokens.alias_gt_name
			when infix_implies_code then
				Result := tokens.alias_implies_name
			when infix_le_code then
				Result := tokens.alias_le_name
			when infix_lt_code then
				Result := tokens.alias_lt_name
			when infix_minus_code then
				Result := tokens.alias_minus_name
			when infix_mod_code then
				Result := tokens.alias_mod_name
			when infix_or_code then
				Result := tokens.alias_or_name
			when infix_or_else_code then
				Result := tokens.alias_or_else_name
			when infix_plus_code then
				Result := tokens.alias_plus_name
			when infix_power_code then
				Result := tokens.alias_power_name
			when infix_times_code then
				Result := tokens.alias_times_name
			when infix_xor_code then
				Result := tokens.alias_xor_name
			when infix_dotdot_code then
				Result := tokens.alias_dotdot_name
			when prefix_minus_code then
				Result := tokens.alias_minus_name
			when prefix_plus_code then
				Result := tokens.alias_plus_name
			when prefix_not_code then
				Result := tokens.alias_not_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		ensure
			alias_name_not_void: Result /= Void
			alias_name_not_empty: Result.count > 0
		end

	alias_lower_name: STRING
			-- Lower-name of alias
			-- (May return the same object as `alias_name' if already in lower case.)
		do
			Result := alias_name
		ensure
			alias_lower_name_not_void: Result /= Void
			alias_lower_name_not_empty: Result.count > 0
			definition: Result.is_equal (alias_name.as_lower)
		end

	operator_name: STRING
			-- Name of operator
		do
			inspect code
			when alias_bracket_code then
				Result := tokens.brackets_symbol_name
			when alias_parenthesis_code then
				Result := tokens.parentheses_symbol_name
			when infix_and_code then
				Result := tokens.and_keyword_name
			when infix_and_then_code then
				Result := tokens.and_then_keywords_name
			when infix_div_code then
				Result := tokens.div_symbol_name
			when infix_divide_code then
				Result := tokens.divide_symbol_name
			when infix_ge_code then
				Result := tokens.ge_symbol_name
			when infix_gt_code then
				Result := tokens.gt_symbol_name
			when infix_implies_code then
				Result := tokens.implies_keyword_name
			when infix_le_code then
				Result := tokens.le_symbol_name
			when infix_lt_code then
				Result := tokens.lt_symbol_name
			when infix_minus_code then
				Result := tokens.minus_symbol_name
			when infix_mod_code then
				Result := tokens.mod_symbol_name
			when infix_or_code then
				Result := tokens.or_keyword_name
			when infix_or_else_code then
				Result := tokens.or_else_keywords_name
			when infix_plus_code then
				Result := tokens.plus_symbol_name
			when infix_power_code then
				Result := tokens.power_symbol_name
			when infix_times_code then
				Result := tokens.times_symbol_name
			when infix_xor_code then
				Result := tokens.xor_keyword_name
			when infix_dotdot_code then
				Result := tokens.dotdot_symbol_name
			when prefix_minus_code then
				Result := tokens.minus_symbol_name
			when prefix_plus_code then
				Result := tokens.plus_symbol_name
			when prefix_not_code then
				Result := tokens.not_keyword_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		ensure
			operator_name_not_void: Result /= Void
			operator_name_not_empty: Result.count > 0
		end

	operator_lower_name: STRING
			-- Lower-name of operator
			-- (May return the same object as `operator_name' if already in lower case.)
		do
			Result := operator_name
		ensure
			operator_lower_name_not_void: Result /= Void
			operator_lower_name_not_empty: Result.count > 0
			definition: Result.is_equal (operator_name.as_lower)
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := code.code
		end

	alias_keyword: ET_KEYWORD
			-- 'alias' keyword

	alias_string: ET_MANIFEST_STRING
			-- Name of alias

	position: ET_POSITION
			-- Position of first character of
			-- current node in source code
		do
			Result := alias_keyword.position
			if Result.is_null then
				Result := alias_string.position
			end
		end

	first_leaf: ET_AST_LEAF
			-- First leaf node in current node
		do
			Result := alias_keyword
		end

	last_leaf: ET_AST_LEAF
			-- Last leaf node in current node
		do
			Result := alias_string
		end

feature -- Setting

	set_alias_keyword (an_alias: like alias_keyword)
			-- Set `alias_keyword' to `an_alias'.
		require
			an_alias_not_void: an_alias /= Void
		do
			alias_keyword := an_alias
		ensure
			alias_keyword_set: alias_keyword = an_alias
		end

feature -- Status setting

	set_prefix
			-- Set current alias to prefix.
		require
			is_prefixable: is_prefixable
		do
			inspect code
			when infix_plus_code then
				code := tokens.prefix_plus_code
			when infix_minus_code then
				code := tokens.prefix_minus_code
			else
				-- Do nothing.
			end
		ensure
			is_prefix: is_prefix
		end

	set_infix
			-- Set current alias to infix.
		require
			is_infixable: is_infixable
		do
			inspect code
			when prefix_plus_code then
				code := tokens.infix_plus_code
			when prefix_minus_code then
				code := tokens.infix_minus_code
			else
				-- Do nothing.
			end
		ensure
			is_infix: is_infix
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same names of the same feature?
			-- (case insensitive)
		do
			if other = Current then
				Result := True
			else
				inspect code
				when alias_bracket_code then
					Result := other.is_bracket
				when alias_parenthesis_code then
					Result := other.is_parenthesis
				when infix_and_code then
					Result := other.is_infix_and
				when infix_and_then_code then
					Result := other.is_infix_and_then
				when infix_div_code then
					Result := other.is_infix_div
				when infix_divide_code then
					Result := other.is_infix_divide
				when infix_ge_code then
					Result := other.is_infix_ge
				when infix_gt_code then
					Result := other.is_infix_gt
				when infix_implies_code then
					Result := other.is_infix_implies
				when infix_le_code then
					Result := other.is_infix_le
				when infix_lt_code then
					Result := other.is_infix_lt
				when infix_minus_code then
					Result := other.is_infix_minus
				when infix_mod_code then
					Result := other.is_infix_mod
				when infix_or_code then
					Result := other.is_infix_or
				when infix_or_else_code then
					Result := other.is_infix_or_else
				when infix_plus_code then
					Result := other.is_infix_plus
				when infix_power_code then
					Result := other.is_infix_power
				when infix_times_code then
					Result := other.is_infix_times
				when infix_xor_code then
					Result := other.is_infix_xor
				when infix_dotdot_code then
					Result := other.is_infix_dotdot
				when prefix_minus_code then
					Result := other.is_prefix_minus
				when prefix_plus_code then
					Result := other.is_prefix_plus
				when prefix_not_code then
					Result := other.is_prefix_not
				else
					-- Result := False
				end
			end
		end

	same_alias_name (other: ET_ALIAS_NAME): BOOLEAN
			-- Are `Current' and `other' the same alias name?
			-- Do not take "infix" and "prefix" properties into account.
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif same_call_name (other) then
				Result := True
			else
				inspect code
				when infix_plus_code then
					Result := other.is_prefix_plus
				when infix_minus_code then
					Result := other.is_prefix_minus
				when prefix_plus_code then
					Result := other.is_infix_plus
				when prefix_minus_code then
					Result := other.is_infix_minus
				else
					Result := False
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_alias_name (Current)
		end

feature {NONE} -- Implementation

	default_keyword: ET_KEYWORD
			-- Default keyword
		once
			Result := tokens.alias_keyword
		ensure
			default_keyword_not_void: Result /= Void
		end

	code: CHARACTER
			-- Operator code

invariant

	is_alias: is_alias
	alias_keyword_not_void: alias_keyword /= Void
	alias_string_not_void: alias_string /= Void
	alias_kinds: is_infix or is_prefix or is_bracket or is_parenthesis

end
