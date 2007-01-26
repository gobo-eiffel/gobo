indexing

	description:

		"Names of Eiffel prefix features"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2005, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_PREFIX_NAME

inherit

	ET_FEATURE_NAME
		undefine
			is_alias,
			is_prefix_minus,
			is_prefix_plus,
			is_prefix_not,
			is_prefix
		redefine
			alias_name
		end

	ET_ALIAS_NAME
		rename
			make_plus as make_infix_plus,
			make_minus as make_infix_minus,
			alias_keyword as prefix_keyword,
			set_alias_keyword as set_prefix_keyword,
			alias_string as operator_name
		undefine
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
			is_infix_dotdot
		redefine
			is_infixable, is_prefix,
			is_prefixable, set_prefix,
			name, default_keyword,
			same_call_name,
			process
		end

create

	make_minus,
	make_plus,
	make_not

feature {NONE} -- Initialization

	make_minus (an_operator: like operator_name) is
			-- Create a new 'prefix "-"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := default_keyword
			operator_name := an_operator
			code := tokens.prefix_minus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_prefix_minus: is_prefix_minus
		end

	make_plus (an_operator: like operator_name) is
			-- Create a new 'prefix "+"' feature name.
		require
			an_operator_not_void: an_operator /= Void
		do
			prefix_keyword := default_keyword
			operator_name := an_operator
			code := tokens.prefix_plus_code
		ensure
			operator_name_set: operator_name = an_operator
			is_prefix_plus: is_prefix_plus
		end

feature -- Status report

	is_prefix: BOOLEAN is True
			-- Is current feature name of the form 'prefix ...'?

	is_infixable: BOOLEAN is False
			-- Can current alias be used as the name of an infix feature?

	is_prefixable: BOOLEAN is True
			-- Can current alias be used as the name of a prefix feature?

feature -- Status setting

	set_prefix is
			-- Set current alias to prefix.
		do
			-- Do nothing.
		end

feature -- Access

	name: STRING is
			-- Name of feature call
		do
			inspect code
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

	alias_name: ET_ALIAS_NAME is
			-- Alias name, if any
		do
			Result := Current
		ensure then
			definition: Result = Current
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN is
			-- Are `Current' and `other' the same names of the same feature?
			-- (case insensitive)
		do
			if other = Current then
				Result := True
			else
				inspect code
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

	same_feature_name (other: ET_FEATURE_NAME): BOOLEAN is
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

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_prefix_name (Current)
		end

feature {NONE} -- Implementation

	default_keyword: ET_KEYWORD is
			-- Default keyword
		once
			Result := tokens.prefix_keyword
		end

invariant

	is_prefix: is_prefix

end
