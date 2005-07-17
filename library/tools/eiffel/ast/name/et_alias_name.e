indexing

	description:

		"Eiffel alias feature names"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2005, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_ALIAS_NAME

inherit

	ET_OPERATOR
		redefine
			name, is_alias
		end

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
	make_bracket

feature {NONE} -- Initialization

	make_and (a_string: like alias_string) is
			-- Create a new 'alias "and"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_and_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_and: is_infix_and
		end

	make_implies (a_string: like alias_string) is
			-- Create a new 'alias "implies"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_implies_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_implies: is_infix_implies
		end

	make_or (a_string: like alias_string) is
			-- Create a new 'alias "or"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_or_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_or: is_infix_or
		end

	make_xor (a_string: like alias_string) is
			-- Create a new 'alias "xor"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_xor_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_xor: is_infix_xor
		end

	make_div (a_string: like alias_string) is
			-- Create a new 'alias "//"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_div_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_div: is_infix_div
		end

	make_divide (a_string: like alias_string) is
			-- Create a new 'alias "/"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_divide_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_divide: is_infix_divide
		end

	make_ge (a_string: like alias_string) is
			-- Create a new 'alias ">="' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_ge_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_ge: is_infix_ge
		end

	make_gt (a_string: like alias_string) is
			-- Create a new 'alias ">"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_gt_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_gt: is_infix_gt
		end

	make_le (a_string: like alias_string) is
			-- Create a new 'alias "<="' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_le_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_le: is_infix_le
		end

	make_lt (a_string: like alias_string) is
			-- Create a new 'alias "<"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_lt_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_lt: is_infix_lt
		end

	make_minus (a_string: like alias_string) is
			-- Create a new 'alias "-"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_minus_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_minus: is_infix_minus
		end

	make_mod (a_string: like alias_string) is
			-- Create a new 'alias "\\"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_mod_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_mod: is_infix_mod
		end

	make_plus (a_string: like alias_string) is
			-- Create a new 'alias "+"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_plus_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_plus: is_infix_plus
		end

	make_power (a_string: like alias_string) is
			-- Create a new 'alias "^"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_power_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_power: is_infix_power
		end

	make_times (a_string: like alias_string) is
			-- Create a new 'alias "*"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_times_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_times: is_infix_times
		end

	make_and_then (a_string: like alias_string) is
			-- Create a new 'alias "and then"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_and_then_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_and_then: is_infix_and_then
		end

	make_or_else (a_string: like alias_string) is
			-- Create a new 'alias "or else"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_or_else_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_or_else: is_infix_or_else
		end

	make_dotdot (a_string: like alias_string) is
			-- Create a new 'alias ".."' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.infix_dotdot_code
		ensure
			alias_string_set: alias_string = a_string
			is_infix_dotdot: is_infix_dotdot
		end

	make_not (a_string: like alias_string) is
			-- Create a new 'alias "not"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.prefix_not_code
		ensure
			alias_string_set: alias_string = a_string
			is_prefix_not: is_prefix_not
		end

	make_bracket (a_string: like alias_string) is
			-- Create a new 'alias "[]"' feature name.
		require
			a_string_not_void: a_string /= Void
		do
			alias_keyword := tokens.alias_keyword
			alias_string := a_string
			code := tokens.alias_bracket_code
		ensure
			alias_string_set: alias_string = a_string
			is_bracket: is_bracket
		end

feature -- Status report

	is_alias: BOOLEAN is
			-- Is current feature name of the form 'alias "..."'?
		do
			Result := True
		end

	is_prefixable: BOOLEAN is
			-- Can current alias be used as the name of a prefix feature?
		do
			Result := is_prefix or is_infix_plus or is_infix_minus
		end

	is_infixable: BOOLEAN is
			-- Can current alias be used as the name of an infix feature?
		do
			Result := is_infix or is_prefix_plus or is_prefix_minus
		end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			inspect code
			when alias_bracket_code then
				Result := tokens.alias_bracket_name
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
		end

	alias_keyword: ET_KEYWORD
			-- 'alias' keyword

	alias_string: ET_MANIFEST_STRING
			-- Name of alias

	position: ET_POSITION is
			-- Position of first character of
			-- current node in source code
		do
			Result := alias_keyword.position
			if Result.is_null then
				Result := alias_string.position
			end
		end

	first_leaf: ET_AST_LEAF is
			-- First leaf node in current node
		do
			Result := alias_keyword
		end

	last_leaf: ET_AST_LEAF is
			-- Last leaf node in current node
		do
			Result := alias_string
		end

	break: ET_BREAK is
			-- Break which appears just after current node
		do
			Result := alias_string.break
		end

feature -- Setting

	set_alias_keyword (an_alias: like alias_keyword) is
			-- Set `alias_keyword' to `an_alias'.
		require
			an_alias_not_void: an_alias /= Void
		do
			alias_keyword := an_alias
		ensure
			alias_keyword_set: alias_keyword = an_alias
		end

feature -- Status setting

	set_prefix is
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

	set_infix is
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

	same_alias_name (other: ET_ALIAS_NAME): BOOLEAN is
			-- Are `Current' and `other' the same alias name?
			-- Do not take "infix" and "prefix" properties into account.
		require
			other_not_void: other /= Void
		do
			if other = Current then
				Result := True
			elseif ANY_.same_types (Current, other) then
				if same_feature_name (other) then
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
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_alias_name (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Operator code

invariant

	alias_keyword_not_void: alias_keyword /= Void
	alias_string_not_void: alias_string /= Void

end
