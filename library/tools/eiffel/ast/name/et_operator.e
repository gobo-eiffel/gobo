indexing

	description:

		"Eiffel operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_OPERATOR

inherit

	ET_FEATURE_NAME
		redefine
			is_infix,
			is_infix_and,
			is_infix_and_then,
			is_infix_div,
			is_infix_divide,
			is_infix_freeop,
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
			is_prefix,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_freeop,
			is_prefix_not,
			is_bracket
		end

	ET_TOKEN_CODES
		export {NONE} all end

feature -- Access

	name: STRING is
			-- Name of feature
		do
			inspect code
			when alias_bracket_code then
				Result := tokens.alias_bracket_name
			when infix_and_code then
				Result := tokens.infix_and_name
			when infix_and_then_code then
				Result := tokens.infix_and_then_name
			when infix_div_code then
				Result := tokens.infix_div_name
			when infix_divide_code then
				Result := tokens.infix_divide_name
			when infix_ge_code then
				Result := tokens.infix_ge_name
			when infix_gt_code then
				Result := tokens.infix_gt_name
			when infix_implies_code then
				Result := tokens.infix_implies_name
			when infix_le_code then
				Result := tokens.infix_le_name
			when infix_lt_code then
				Result := tokens.infix_lt_name
			when infix_minus_code then
				Result := tokens.infix_minus_name
			when infix_mod_code then
				Result := tokens.infix_mod_name
			when infix_or_code then
				Result := tokens.infix_or_name
			when infix_or_else_code then
				Result := tokens.infix_or_else_name
			when infix_plus_code then
				Result := tokens.infix_plus_name
			when infix_power_code then
				Result := tokens.infix_power_name
			when infix_times_code then
				Result := tokens.infix_times_name
			when infix_xor_code then
				Result := tokens.infix_xor_name
			when infix_dotdot_code then
				Result := tokens.infix_dotdot_name
			when prefix_minus_code then
				Result := tokens.prefix_minus_name
			when prefix_plus_code then
				Result := tokens.prefix_plus_name
			when prefix_not_code then
				Result := tokens.prefix_not_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		end

	lower_name: STRING is
			-- Lower-name of feature
			-- (May return the same object as `name' if already in lower case.)
		do
			Result := name
		end

	hash_code: INTEGER is
			-- Hash code
		do
			Result := code.code
		end

feature -- Status report

	is_infix: BOOLEAN is
			-- Is current feature name of the form 'infix ...'?
		do
			Result := (code >= tokens.min_infix_code and code <= tokens.max_infix_code)
		end

	is_infix_and: BOOLEAN is
			-- Is current feature name of the form 'infix "and"'?
		do
			Result := (code = tokens.infix_and_code)
		end

	is_infix_and_then: BOOLEAN is
			-- Is current feature name of the form 'infix "and then"'?
		do
			Result := (code = tokens.infix_and_then_code)
		end

	is_infix_div: BOOLEAN is
			-- Is current feature name of the form 'infix "//"'?
		do
			Result := (code = tokens.infix_div_code)
		end

	is_infix_divide: BOOLEAN is
			-- Is current feature name of the form 'infix "/"'?
		do
			Result := (code = tokens.infix_divide_code)
		end

	is_infix_freeop: BOOLEAN is
			-- Is current feature name of the form 'infix "free-operator"'?
		do
			Result := (code = tokens.infix_freeop_code)
		end

	is_infix_ge: BOOLEAN is
			-- Is current feature name of the form 'infix ">="'?
		do
			Result := (code = tokens.infix_ge_code)
		end

	is_infix_gt: BOOLEAN is
			-- Is current feature name of the form 'infix ">"'?
		do
			Result := (code = tokens.infix_gt_code)
		end

	is_infix_implies: BOOLEAN is
			-- Is current feature name of the form 'infix "implies"'?
		do
			Result := (code = tokens.infix_implies_code)
		end

	is_infix_le: BOOLEAN is
			-- Is current feature name of the form 'infix "<="'?
		do
			Result := (code = tokens.infix_le_code)
		end

	is_infix_lt: BOOLEAN is
			-- Is current feature name of the form 'infix "<"'?
		do
			Result := (code = tokens.infix_lt_code)
		end

	is_infix_minus: BOOLEAN is
			-- Is current feature name of the form 'infix "-"'?
		do
			Result := (code = tokens.infix_minus_code)
		end

	is_infix_mod: BOOLEAN is
			-- Is current feature name of the form 'infix "\\"'?
		do
			Result := (code = tokens.infix_mod_code)
		end

	is_infix_or: BOOLEAN is
			-- Is current feature name of the form 'infix "or"'?
		do
			Result := (code = tokens.infix_or_code)
		end

	is_infix_or_else: BOOLEAN is
			-- Is current feature name of the form 'infix "or else"'?
		do
			Result := (code = tokens.infix_or_else_code)
		end

	is_infix_plus: BOOLEAN is
			-- Is current feature name of the form 'infix "+"'?
		do
			Result := (code = tokens.infix_plus_code)
		end

	is_infix_power: BOOLEAN is
			-- Is current feature name of the form 'infix "^"'?
		do
			Result := (code = tokens.infix_power_code)
		end

	is_infix_times: BOOLEAN is
			-- Is current feature name of the form 'infix "*"'?
		do
			Result := (code = tokens.infix_times_code)
		end

	is_infix_xor: BOOLEAN is
			-- Is current feature name of the form 'infix "xor"'?
		do
			Result := (code = tokens.infix_xor_code)
		end

	is_infix_dotdot: BOOLEAN is
			-- Is current feature name of the form 'infix ".."'?
		do
			Result := (code = tokens.infix_dotdot_code)
		end

	is_prefix: BOOLEAN is
			-- Is current feature name of the form 'prefix ...'?
		do
			Result := (code >= tokens.min_prefix_code and code <= tokens.max_prefix_code)
		end

	is_prefix_minus: BOOLEAN is
			-- Is current feature name of the form 'prefix "-"'?
		do
			Result := (code = tokens.prefix_minus_code)
		end

	is_prefix_plus: BOOLEAN is
			-- Is current feature name of the form 'prefix "+"'?
		do
			Result := (code = tokens.prefix_plus_code)
		end

	is_prefix_freeop: BOOLEAN is
			-- Is current feature name of the form 'prefix "free-operator"'?
		do
			Result := (code = tokens.prefix_freeop_code)
		end

	is_prefix_not: BOOLEAN is
			-- Is current feature name of the form 'prefix "not"'?
		do
			Result := (code = tokens.prefix_not_code)
		end

	is_bracket: BOOLEAN is
			-- Is current feature name of the form 'alias "[]"'?
		do
			Result := (code = tokens.alias_bracket_code)
		end

feature -- Comparison

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			inspect code
			when alias_bracket_code then
				Result := other.is_bracket
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

feature {NONE} -- Implementation

	code: CHARACTER is
			-- Operator code
		deferred
		end

end
