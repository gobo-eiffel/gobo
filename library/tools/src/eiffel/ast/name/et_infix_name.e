note

	description:

		"Names of Eiffel infix features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2019, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_INFIX_NAME

inherit

	ET_FEATURE_NAME
		rename
			alias_name as feature_alias_name
		undefine
			is_alias,
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
			is_infix_dotdot
		redefine
			feature_alias_name
		end

	ET_ALIAS_NAME
		rename
			alias_keyword as infix_keyword,
			set_alias_keyword as set_infix_keyword,
			alias_string as operator_string
		undefine
			is_bracket,
			is_parenthesis,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not,
			is_prefix,
			is_feature_name,
			feature_name
		redefine
			is_prefixable, is_infix,
			is_infixable, set_infix, name,
			default_keyword, process,
			same_call_name
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
	make_or_else

feature -- Status report

	is_infix: BOOLEAN = True
			-- Is current feature name of the form 'infix ...'?

	is_prefixable: BOOLEAN = False
			-- Can current alias be used as the name of a prefix feature?

	is_infixable: BOOLEAN = True
			-- Can current alias be used as the name of an infix feature?

feature -- Status setting

	set_infix
			-- Set current alias to infix.
		do
			-- Do nothing.
		end

feature -- Access

	name: STRING
			-- Name of feature call
			-- (using UTF-8 encoding)
		do
			inspect code
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
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		end

	feature_alias_name: ET_ALIAS_NAME
			-- Alias name, if any
		do
			Result := Current
		ensure then
			definition: Result = Current
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
				else
					-- Result := False
				end
			end
		end

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN
			-- Are feature name and `other' the same feature name?
			-- (case insensitive)
		do
			if other = Current then
				Result := True
			elseif ANY_.same_types (Current, other) then
				Result := same_call_name (other)
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_infix_name (Current)
		end

feature {NONE} -- Implementation

	default_keyword: ET_KEYWORD
			-- Default keyword
		once
			Result := tokens.infix_keyword
		end

invariant

	is_infix: is_infix

end
