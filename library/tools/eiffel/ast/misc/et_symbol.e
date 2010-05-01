note

	description:

		"Eiffel lexical symbols"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002-2008, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_SYMBOL

inherit

	ET_CLASS_MARK
		rename
			make as make_leaf,
			make_with_position as make_leaf_with_position
		undefine
			is_bang,
			is_question_mark
		end

	ET_TOKEN_CODES
		export {NONE} all end

create

	make_arrow,
	make_assign,
	make_assign_attempt,
	make_bang,
	make_colon,
	make_comma,
	make_dollar,
	make_dot,
	make_dotdot,
	make_equal,
	make_left_array,
	make_left_brace,
	make_left_parenthesis,
	make_not_equal,
	make_not_tilde,
	make_right_array,
	make_right_brace,
	make_right_bracket,
	make_right_parenthesis,
	make_tilde

feature {NONE} -- Initialization

	make_arrow is
			-- Create a new '->' symbol.
		do
			code := tokens.arrow_symbol_code
			make_leaf
		ensure
			is_arrow: is_arrow
			line_set: line = no_line
			column_set: column = no_column
		end

	make_assign is
			-- Create a new ':=' symbol.
		do
			code := tokens.assign_symbol_code
			make_leaf
		ensure
			is_assign: is_assign
			line_set: line = no_line
			column_set: column = no_column
		end

	make_assign_attempt is
			-- Create a new '?=' symbol.
		do
			code := tokens.assign_attempt_symbol_code
			make_leaf
		ensure
			is_assign_attempt: is_assign_attempt
			line_set: line = no_line
			column_set: column = no_column
		end

	make_bang is
			-- Create a new '!' symbol.
		do
			code := tokens.bang_symbol_code
			make_leaf
		ensure
			is_bang: is_bang
			line_set: line = no_line
			column_set: column = no_column
		end

	make_colon is
			-- Create a new ':' symbol.
		do
			code := tokens.colon_symbol_code
			make_leaf
		ensure
			is_colon: is_colon
			line_set: line = no_line
			column_set: column = no_column
		end

	make_comma is
			-- Create a new ',' symbol.
		do
			code := tokens.comma_symbol_code
			make_leaf
		ensure
			is_comma: is_comma
			line_set: line = no_line
			column_set: column = no_column
		end

	make_div is
			-- Create a new '//' symbol.
		do
			code := tokens.infix_div_code
			make_leaf
		ensure
			is_div: is_div
			line_set: line = no_line
			column_set: column = no_column
		end

	make_divide is
			-- Create a new '/' symbol.
		do
			code := tokens.infix_divide_code
			make_leaf
		ensure
			is_divide: is_divide
			line_set: line = no_line
			column_set: column = no_column
		end

	make_dollar is
			-- Create a new '$' symbol.
		do
			code := tokens.dollar_symbol_code
			make_leaf
		ensure
			is_dollar: is_dollar
			line_set: line = no_line
			column_set: column = no_column
		end

	make_dot is
			-- Create a new '.' symbol.
		do
			code := tokens.dot_symbol_code
			make_leaf
		ensure
			is_dot: is_dot
			line_set: line = no_line
			column_set: column = no_column
		end

	make_dotdot is
			-- Create a new '..' symbol.
		do
			code := tokens.dotdot_symbol_code
			make_leaf
		ensure
			is_dotdot: is_dotdot
			line_set: line = no_line
			column_set: column = no_column
		end

	make_equal is
			-- Create a new '=' symbol.
		do
			code := tokens.equal_symbol_code
			make_leaf
		ensure
			is_equal_symbol: is_equal_symbol
			line_set: line = no_line
			column_set: column = no_column
		end

	make_ge is
			-- Create a new '>=' symbol.
		do
			code := tokens.infix_ge_code
			make_leaf
		ensure
			is_ge: is_ge
			line_set: line = no_line
			column_set: column = no_column
		end

	make_gt is
			-- Create a new '>' symbol.
		do
			code := tokens.infix_gt_code
			make_leaf
		ensure
			is_gt: is_gt
			line_set: line = no_line
			column_set: column = no_column
		end

	make_le is
			-- Create a new '<=' symbol.
		do
			code := tokens.infix_le_code
			make_leaf
		ensure
			is_le: is_le
			line_set: line = no_line
			column_set: column = no_column
		end

	make_left_array is
			-- Create a new '<<' symbol.
		do
			code := tokens.left_array_symbol_code
			make_leaf
		ensure
			is_left_array: is_left_array
			line_set: line = no_line
			column_set: column = no_column
		end

	make_left_brace is
			-- Create a new '{' symbol.
		do
			code := tokens.left_brace_symbol_code
			make_leaf
		ensure
			is_left_brace: is_left_brace
			line_set: line = no_line
			column_set: column = no_column
		end

	make_left_bracket is
			-- Create a new '[' symbol.
		do
			code := tokens.left_bracket_symbol_code
			make_leaf
		ensure
			is_left_bracket: is_left_bracket
			line_set: line = no_line
			column_set: column = no_column
		end

	make_left_parenthesis is
			-- Create a new '(' symbol.
		do
			code := tokens.left_parenthesis_symbol_code
			make_leaf
		ensure
			is_left_parenthesis: is_left_parenthesis
			line_set: line = no_line
			column_set: column = no_column
		end

	make_lt is
			-- Create a new '<' symbol.
		do
			code := tokens.infix_lt_code
			make_leaf
		ensure
			is_lt: is_lt
			line_set: line = no_line
			column_set: column = no_column
		end

	make_minus is
			-- Create a new '-' symbol.
		do
			code := tokens.prefix_minus_code
			make_leaf
		ensure
			is_minus: is_minus
			line_set: line = no_line
			column_set: column = no_column
		end

	make_mod is
			-- Create a new '\\' symbol.
		do
			code := tokens.infix_mod_code
			make_leaf
		ensure
			is_mod: is_mod
			line_set: line = no_line
			column_set: column = no_column
		end

	make_not_equal is
			-- Create a new '/=' symbol.
		do
			code := tokens.not_equal_symbol_code
			make_leaf
		ensure
			is_not_equal: is_not_equal
			line_set: line = no_line
			column_set: column = no_column
		end

	make_not_tilde is
			-- Create a new '/~' symbol.
		do
			code := tokens.not_tilde_symbol_code
			make_leaf
		ensure
			is_not_tilde: is_not_tilde
			line_set: line = no_line
			column_set: column = no_column
		end

	make_plus is
			-- Create a new '+' symbol.
		do
			code := tokens.prefix_plus_code
			make_leaf
		ensure
			is_plus: is_plus
			line_set: line = no_line
			column_set: column = no_column
		end

	make_power is
			-- Create a new '^' symbol.
		do
			code := tokens.infix_power_code
			make_leaf
		ensure
			is_power: is_power
			line_set: line = no_line
			column_set: column = no_column
		end

	make_question_mark is
			-- Create a new '?' symbol.
		do
			code := tokens.question_mark_symbol_code
			make_leaf
		ensure
			is_question_mark: is_question_mark
			line_set: line = no_line
			column_set: column = no_column
		end

	make_right_array is
			-- Create a new '>>' symbol.
		do
			code := tokens.right_array_symbol_code
			make_leaf
		ensure
			is_right_array: is_right_array
			line_set: line = no_line
			column_set: column = no_column
		end

	make_right_brace is
			-- Create a new '}' symbol.
		do
			code := tokens.right_brace_symbol_code
			make_leaf
		ensure
			is_right_brace: is_right_brace
			line_set: line = no_line
			column_set: column = no_column
		end

	make_right_bracket is
			-- Create a new ']' symbol.
		do
			code := tokens.right_bracket_symbol_code
			make_leaf
		ensure
			is_right_bracket: is_right_bracket
			line_set: line = no_line
			column_set: column = no_column
		end

	make_right_parenthesis is
			-- Create a new ')' symbol.
		do
			code := tokens.right_parenthesis_symbol_code
			make_leaf
		ensure
			is_right_parenthesis: is_right_parenthesis
			line_set: line = no_line
			column_set: column = no_column
		end

	make_semicolon is
			-- Create a new ';' symbol.
		do
			code := tokens.semicolon_symbol_code
			make_leaf
		ensure
			is_semicolon: is_semicolon
			line_set: line = no_line
			column_set: column = no_column
		end

	make_tilde is
			-- Create a new '~' symbol.
		do
			code := tokens.tilde_symbol_code
			make_leaf
		ensure
			is_tilde: is_tilde
			line_set: line = no_line
			column_set: column = no_column
		end

	make_times is
			-- Create a new '*' symbol.
		do
			code := tokens.infix_times_code
			make_leaf
		ensure
			is_times: is_times
			line_set: line = no_line
			column_set: column = no_column
		end

feature -- Access

	text: STRING is
			-- Textual representation of symbol
		do
			inspect code
			when arrow_symbol_code then
				Result := tokens.arrow_symbol_name
			when assign_symbol_code then
				Result := tokens.assign_symbol_name
			when assign_attempt_symbol_code then
				Result := tokens.assign_attempt_symbol_name
			when bang_symbol_code then
				Result := tokens.bang_symbol_name
			when colon_symbol_code then
				Result := tokens.colon_symbol_name
			when comma_symbol_code then
				Result := tokens.comma_symbol_name
			when infix_div_code then
				Result := tokens.div_symbol_name
			when infix_divide_code then
				Result := tokens.divide_symbol_name
			when dollar_symbol_code then
				Result := tokens.dollar_symbol_name
			when dot_symbol_code then
				Result := tokens.dot_symbol_name
			when dotdot_symbol_code then
				Result := tokens.dotdot_symbol_name
			when equal_symbol_code then
				Result := tokens.equal_symbol_name
			when infix_ge_code then
				Result := tokens.ge_symbol_name
			when infix_gt_code then
				Result := tokens.gt_symbol_name
			when infix_le_code then
				Result := tokens.le_symbol_name
			when left_array_symbol_code then
				Result := tokens.left_array_symbol_name
			when left_brace_symbol_code then
				Result := tokens.left_brace_symbol_name
			when left_bracket_symbol_code then
				Result := tokens.left_bracket_symbol_name
			when left_parenthesis_symbol_code then
				Result := tokens.left_parenthesis_symbol_name
			when infix_lt_code then
				Result := tokens.lt_symbol_name
			when infix_minus_code then
				Result := tokens.minus_symbol_name
			when prefix_minus_code then
				Result := tokens.minus_symbol_name
			when infix_mod_code then
				Result := tokens.mod_symbol_name
			when not_equal_symbol_code then
				Result := tokens.not_equal_symbol_name
			when not_tilde_symbol_code then
				Result := tokens.not_tilde_symbol_name
			when infix_plus_code then
				Result := tokens.plus_symbol_name
			when prefix_plus_code then
				Result := tokens.plus_symbol_name
			when infix_power_code then
				Result := tokens.power_symbol_name
			when question_mark_symbol_code then
				Result := tokens.question_mark_symbol_name
			when right_array_symbol_code then
				Result := tokens.right_array_symbol_name
			when right_brace_symbol_code then
				Result := tokens.right_brace_symbol_name
			when right_bracket_symbol_code then
				Result := tokens.right_bracket_symbol_name
			when right_parenthesis_symbol_code then
				Result := tokens.right_parenthesis_symbol_name
			when semicolon_symbol_code then
				Result := tokens.semicolon_symbol_name
			when tilde_symbol_code then
				Result := tokens.tilde_symbol_name
			when infix_times_code then
				Result := tokens.times_symbol_name
			else
					-- Should never happen.
				Result := tokens.unknown_name
			end
		end

	last_position: ET_POSITION is
			-- Position of last character of current node in source code
		do
			create {ET_COMPRESSED_POSITION} Result.make (line, column + text.count - 1)
		end

feature -- Status report

	is_arrow: BOOLEAN is
			-- Is current symbol '->'?
		do
			Result := (code = tokens.arrow_symbol_code)
		end

	is_assign: BOOLEAN is
			-- Is current symbol ':='?
		do
			Result := (code = tokens.assign_symbol_code)
		end

	is_assign_attempt: BOOLEAN is
			-- Is current symbol '?='?
		do
			Result := (code = tokens.assign_attempt_symbol_code)
		end

	is_bang: BOOLEAN is
			-- Is current symbol '!'?
		do
			Result := (code = tokens.bang_symbol_code)
		end

	is_colon: BOOLEAN is
			-- Is current symbol ':'?
		do
			Result := (code = tokens.colon_symbol_code)
		end

	is_comma: BOOLEAN is
			-- Is current symbol ','?
		do
			Result := (code = tokens.comma_symbol_code)
		end

	is_div: BOOLEAN is
			-- Is current symbol '//'?
		do
			Result := (code = tokens.infix_div_code)
		end

	is_divide: BOOLEAN is
			-- Is current symbol '/'?
		do
			Result := (code = tokens.infix_divide_code)
		end

	is_dollar: BOOLEAN is
			-- Is current symbol '$'?
		do
			Result := (code = tokens.dollar_symbol_code)
		end

	is_dot: BOOLEAN is
			-- Is current symbol '.'?
		do
			Result := (code = tokens.dot_symbol_code)
		end

	is_dotdot: BOOLEAN is
			-- Is current symbol '..'?
		do
			Result := (code = tokens.dotdot_symbol_code)
		end

	is_equal_symbol: BOOLEAN is
			-- Is current symbol '='?
		do
			Result := (code = tokens.equal_symbol_code)
		end

	is_ge: BOOLEAN is
			-- Is current symbol '>='?
		do
			Result := (code = tokens.infix_ge_code)
		end

	is_gt: BOOLEAN is
			-- Is current symbol '>'?
		do
			Result := (code = tokens.infix_gt_code)
		end

	is_le: BOOLEAN is
			-- Is current symbol '<='?
		do
			Result := (code = tokens.infix_le_code)
		end

	is_left_array: BOOLEAN is
			-- Is current symbol '<<'?
		do
			Result := (code = tokens.left_array_symbol_code)
		end

	is_left_brace: BOOLEAN is
			-- Is current symbol '{'?
		do
			Result := (code = tokens.left_brace_symbol_code)
		end

	is_left_bracket: BOOLEAN is
			-- Is current symbol '['?
		do
			Result := (code = tokens.left_bracket_symbol_code)
		end

	is_left_parenthesis: BOOLEAN is
			-- Is current symbol '('?
		do
			Result := (code = tokens.left_parenthesis_symbol_code)
		end

	is_lt: BOOLEAN is
			-- Is current symbol '<'?
		do
			Result := (code = tokens.infix_lt_code)
		end

	is_minus: BOOLEAN is
			-- Is current symbol '-'?
		do
			Result := (code = tokens.prefix_minus_code or code = tokens.infix_minus_code)
		end

	is_mod: BOOLEAN is
			-- Is current symbol '\\'?
		do
			Result := (code = tokens.infix_mod_code)
		end

	is_not_equal: BOOLEAN is
			-- Is current symbol '/='?
		do
			Result := (code = tokens.not_equal_symbol_code)
		end

	is_not_tilde: BOOLEAN is
			-- Is current symbol '/~'?
		do
			Result := (code = tokens.not_tilde_symbol_code)
		end

	is_plus: BOOLEAN is
			-- Is current symbol '+'?
		do
			Result := (code = tokens.prefix_plus_code or code = tokens.infix_plus_code)
		end

	is_power: BOOLEAN is
			-- Is current symbol '^'?
		do
			Result := (code = tokens.infix_power_code)
		end

	is_question_mark: BOOLEAN is
			-- Is current symbol '?'?
		do
			Result := (code = tokens.question_mark_symbol_code)
		end

	is_right_array: BOOLEAN is
			-- Is current symbol '>>'?
		do
			Result := (code = tokens.right_array_symbol_code)
		end

	is_right_brace: BOOLEAN is
			-- Is current symbol '}'?
		do
			Result := (code = tokens.right_brace_symbol_code)
		end

	is_right_bracket: BOOLEAN is
			-- Is current symbol ']'?
		do
			Result := (code = tokens.right_bracket_symbol_code)
		end

	is_right_parenthesis: BOOLEAN is
			-- Is current symbol ')'?
		do
			Result := (code = tokens.right_parenthesis_symbol_code)
		end

	is_semicolon: BOOLEAN is
			-- Is current symbol ';'?
		do
			Result := (code = tokens.semicolon_symbol_code)
		end

	is_tilde: BOOLEAN is
			-- Is current symbol '~'?
		do
			Result := (code = tokens.tilde_symbol_code)
		end

	is_times: BOOLEAN is
			-- Is current symbol '*'?
		do
			Result := (code = tokens.infix_times_code)
		end

feature -- Processing

	process (a_processor: ET_AST_PROCESSOR) is
			-- Process current node.
		do
			a_processor.process_symbol (Current)
		end

feature {NONE} -- Implementation

	code: CHARACTER
			-- Symbol code

end
