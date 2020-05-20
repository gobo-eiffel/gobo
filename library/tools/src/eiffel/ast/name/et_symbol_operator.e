note

	description:

		"Eiffel symbol operators"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYMBOL_OPERATOR

inherit

	ET_SYMBOL
		redefine
			process
		end

	ET_OPERATOR
		undefine
			first_position,
			last_position,
			break
		redefine
			is_infix,
			is_infix_and_symbol,
			is_infix_and_then_symbol,
			is_infix_div,
			is_infix_divide,
			is_infix_ge,
			is_infix_gt,
			is_infix_implies_symbol,
			is_infix_le,
			is_infix_lt,
			is_infix_minus,
			is_infix_mod,
			is_infix_or_symbol,
			is_infix_or_else_symbol,
			is_infix_plus,
			is_infix_power,
			is_infix_times,
			is_infix_xor_symbol,
			is_infix_dotdot,
			is_prefix,
			is_prefix_not_symbol,
			is_prefix_minus,
			is_prefix_plus
		end

create

	make_and_symbol,
	make_and_then_symbol,
	make_div,
	make_divide,
	make_ge,
	make_gt,
	make_implies_symbol,
	make_le,
	make_lt,
	make_minus,
	make_mod,
	make_not_symbol,
	make_or_symbol,
	make_or_else_symbol,
	make_plus,
	make_power,
	make_times,
	make_xor_symbol

feature -- Status report

	is_infix: BOOLEAN
			-- Is current feature name of the form binary 'alias "..."'?
		do
			Result := (code >= tokens.min_infix_code and code <= tokens.max_infix_code)
		end

	is_infix_and_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "∧"'?
		do
			Result := (code = tokens.infix_and_symbol_code)
		end

	is_infix_and_then_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "∧…"'?
		do
			Result := (code = tokens.infix_and_then_symbol_code)
		end

	is_infix_div: BOOLEAN
			-- Is current feature name of the form binary 'alias "//"'?
		do
			Result := (code = tokens.infix_div_code)
		end

	is_infix_divide: BOOLEAN
			-- Is current feature name of the form binary 'alias "/"'?
		do
			Result := (code = tokens.infix_divide_code)
		end

	is_infix_ge: BOOLEAN
			-- Is current feature name of the form binary 'alias ">="'?
		do
			Result := (code = tokens.infix_ge_code)
		end

	is_infix_gt: BOOLEAN
			-- Is current feature name of the form binary 'alias ">"'?
		do
			Result := (code = tokens.infix_gt_code)
		end

	is_infix_implies_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "⇒"'?
		do
			Result := (code = tokens.infix_implies_symbol_code)
		end

	is_infix_le: BOOLEAN
			-- Is current feature name of the form binary 'alias "<="'?
		do
			Result := (code = tokens.infix_le_code)
		end

	is_infix_lt: BOOLEAN
			-- Is current feature name of the form binary 'alias "<"'?
		do
			Result := (code = tokens.infix_lt_code)
		end

	is_infix_minus: BOOLEAN
			-- Is current feature name of the form binary 'alias "-"'?
		do
			Result := (code = tokens.infix_minus_code)
		end

	is_infix_mod: BOOLEAN
			-- Is current feature name of the form binary 'alias "\\"'?
		do
			Result := (code = tokens.infix_mod_code)
		end

	is_infix_or_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "∨"'?
		do
			Result := (code = tokens.infix_or_symbol_code)
		end

	is_infix_or_else_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "∨…"'?
		do
			Result := (code = tokens.infix_or_else_symbol_code)
		end

	is_infix_plus: BOOLEAN
			-- Is current feature name of the form binary 'alias "+"'?
		do
			Result := (code = tokens.infix_plus_code)
		end

	is_infix_power: BOOLEAN
			-- Is current feature name of the form binary 'alias "^"'?
		do
			Result := (code = tokens.infix_power_code)
		end

	is_infix_times: BOOLEAN
			-- Is current feature name of the form binary 'alias "*"'?
		do
			Result := (code = tokens.infix_times_code)
		end

	is_infix_xor_symbol: BOOLEAN
			-- Is current feature name of the form binary 'alias "⊻"'?
		do
			Result := (code = tokens.infix_xor_symbol_code)
		end

	is_infix_dotdot: BOOLEAN
			-- Is current feature name of the form binary 'alias ".."'?
		do
			Result := (code = tokens.infix_dotdot_code)
		end

	is_prefix: BOOLEAN
			-- Is current feature name of the form unary 'alias "..."'?
		do
			Result := (code >= tokens.min_prefix_code and code <= tokens.max_prefix_code)
		end

	is_prefix_not_symbol: BOOLEAN
			-- Is current feature name of the form unary 'alias "¬"'?
		do
			Result := (code = tokens.prefix_not_symbol_code)
		end

	is_prefix_minus: BOOLEAN
			-- Is current feature name of the form unary 'alias "-"'?
		do
			Result := (code = tokens.prefix_minus_code)
		end

	is_prefix_plus: BOOLEAN
			-- Is current feature name of the form unary 'alias "+"'?
		do
			Result := (code = tokens.prefix_plus_code)
		end

feature -- Access

	name: STRING
			-- Name of feature call
			-- (using UTF-8 encoding)
		do
			inspect code
			when infix_and_symbol_code then
				Result := tokens.alias_and_symbol_name
			when infix_and_then_symbol_code then
				Result := tokens.alias_and_then_symbol_name
			when infix_div_code then
				Result := tokens.alias_div_name
			when infix_divide_code then
				Result := tokens.alias_divide_name
			when infix_ge_code then
				Result := tokens.alias_ge_name
			when infix_gt_code then
				Result := tokens.alias_gt_name
			when infix_implies_symbol_code then
				Result := tokens.alias_implies_symbol_name
			when infix_le_code then
				Result := tokens.alias_le_name
			when infix_lt_code then
				Result := tokens.alias_lt_name
			when infix_minus_code then
				Result := tokens.alias_minus_name
			when infix_mod_code then
				Result := tokens.alias_mod_name
			when infix_or_symbol_code then
				Result := tokens.alias_or_symbol_name
			when infix_or_else_symbol_code then
				Result := tokens.alias_or_else_symbol_name
			when infix_plus_code then
				Result := tokens.alias_plus_name
			when infix_power_code then
				Result := tokens.alias_power_name
			when infix_times_code then
				Result := tokens.alias_times_name
			when infix_xor_symbol_code then
				Result := tokens.alias_xor_symbol_name
			when infix_dotdot_code then
				Result := tokens.alias_dotdot_name
			when prefix_not_symbol_code then
				Result := tokens.alias_not_symbol_name
			when prefix_minus_code then
				Result := tokens.alias_minus_name
			when prefix_plus_code then
				Result := tokens.alias_plus_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		end

	hash_code: INTEGER
			-- Hash code
		do
			Result := code.code
		end

feature -- Status setting

	set_infix_minus
			-- Set `is_infix_minus'.
		do
			code := tokens.infix_minus_code
		ensure
			is_infix_minus: is_infix_minus
		end

	set_prefix_minus
			-- Set `is_prefix_minus'.
		do
			code := tokens.prefix_minus_code
		ensure
			is_prefix_minus: is_prefix_minus
		end

	set_infix_plus
			-- Set `is_infix_plus'.
		do
			code := tokens.infix_plus_code
		ensure
			is_infix_plus: is_infix_plus
		end

	set_prefix_plus
			-- Set `is_prefix_plus'.
		do
			code := tokens.prefix_plus_code
		ensure
			is_prefix_plus: is_prefix_plus
		end

feature -- Comparison

	same_call_name (other: ET_CALL_NAME): BOOLEAN
			-- Are `Current' and `other' the same feature call name?
			-- (case insensitive)
		do
			if Current = other then
				Result := True
			else
				inspect code
				when infix_and_symbol_code then
					Result := other.is_infix_and_symbol
				when infix_and_then_symbol_code then
					Result := other.is_infix_and_then_symbol
				when infix_div_code then
					Result := other.is_infix_div
				when infix_divide_code then
					Result := other.is_infix_divide
				when infix_ge_code then
					Result := other.is_infix_ge
				when infix_gt_code then
					Result := other.is_infix_gt
				when infix_implies_symbol_code then
					Result := other.is_infix_implies_symbol
				when infix_le_code then
					Result := other.is_infix_le
				when infix_lt_code then
					Result := other.is_infix_lt
				when infix_minus_code then
					Result := other.is_infix_minus
				when infix_mod_code then
					Result := other.is_infix_mod
				when infix_or_symbol_code then
					Result := other.is_infix_or_symbol
				when infix_or_else_symbol_code then
					Result := other.is_infix_or_else_symbol
				when infix_plus_code then
					Result := other.is_infix_plus
				when infix_power_code then
					Result := other.is_infix_power
				when infix_times_code then
					Result := other.is_infix_times
				when infix_xor_symbol_code then
					Result := other.is_infix_xor_symbol
				when infix_dotdot_code then
					Result := other.is_infix_dotdot
				when prefix_not_symbol_code then
					Result := other.is_prefix_not_symbol
				when prefix_minus_code then
					Result := other.is_prefix_minus
				when prefix_plus_code then
					Result := other.is_prefix_plus
				else
					-- Result := False
				end
			end
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR)
			-- Process current node.
		do
			a_processor.process_symbol_operator (Current)
		end

end
