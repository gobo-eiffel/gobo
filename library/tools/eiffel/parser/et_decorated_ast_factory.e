indexing

	description:

		"Eiffel decorated Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_DECORATED_AST_FACTORY

inherit

	ET_AST_FACTORY
		redefine
			new_and_keyword,
			new_current_keyword,
			new_deferred_keyword,
			new_expanded_keyword,
			new_false_keyword,
			new_implies_keyword,
			new_keyword,
			new_not_keyword,
			new_or_keyword,
			new_reference_keyword,
			new_result_keyword,
			new_retry_keyword,
			new_separate_keyword,
			new_true_keyword,
			new_xor_keyword,
			new_div_symbol,
			new_divide_symbol,
			new_equal_symbol,
			new_ge_symbol,
			new_gt_symbol,
			new_le_symbol,
			new_lt_symbol,
			new_minus_symbol,
			new_mod_symbol,
			new_not_equal_symbol,
			new_plus_symbol,
			new_power_symbol,
			new_semicolon_symbol,
			new_symbol,
			new_times_symbol,
			new_bit_constant,
			new_c1_character_constant,
			new_c2_character_constant,
			new_c3_character_constant,
			new_free_operator,
			new_hexadecimal_integer_constant,
			new_identifier,
			new_regular_integer_constant,
			new_regular_manifest_string,
			new_regular_real_constant,
			new_special_manifest_string,
			new_underscored_integer_constant,
			new_underscored_real_constant,
			new_verbatim_string
		end

creation

	make

feature -- Status report

	keep_all_breaks: BOOLEAN
			-- Should the generated AST be decorated with
			-- breaks and comments?

	keep_all_comments: BOOLEAN
			-- Should the generated AST be decorated with comments?

	keep_header_comments: BOOLEAN
			-- Should the generated AST be decorated with Feature
			-- and Feature_clause header comments?

feature -- Statut setting

	set_keep_all_breaks (b: BOOLEAN) is
			-- Set `keep_all_breaks' to `b'.
		do
			keep_all_breaks := b
		ensure
			keep_all_breaks_set: keep_all_breaks = b
		end

feature -- Eiffel keywords

	new_and_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_AND_OPERATOR is
			-- New 'and' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_current_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_CURRENT is
			-- New 'current' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_deferred_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_DEFERRED_KEYWORD is
			-- New 'deferred' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_expanded_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_EXPANDED_KEYWORD is
			-- New 'expanded' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_false_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FALSE_CONSTANT is
			-- New 'false' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_implies_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_IMPLIES_OPERATOR is
			-- New 'implies' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New Eiffel keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_PREFIX_NOT_OPERATOR is
			-- New 'not' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_or_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_OR_OPERATOR is
			-- New 'or' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_reference_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REFERENCE_KEYWORD is
			-- New 'reference' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_result_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RESULT is
			-- New 'result' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_retry_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RETRY_INSTRUCTION is
			-- New 'retry' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_separate_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SEPARATE_KEYWORD is
			-- New 'separate' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_true_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_TRUE_CONSTANT is
			-- New 'true' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_xor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_XOR_OPERATOR is
			-- New 'xor' keyword
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- Eiffel symbols

	new_div_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_DIV_OPERATOR is
			-- New '//' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_divide_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_DIVIDE_OPERATOR is
			-- New '/' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_EQUAL_SYMBOL is
			-- New '=' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_ge_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_GE_OPERATOR is
			-- New '>=' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_gt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_GT_OPERATOR is
			-- New '>' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_le_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_LE_OPERATOR is
			-- New '<=' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_lt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_LT_OPERATOR is
			-- New '<' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_minus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_MINUS_SYMBOL is
			-- New '-' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_mod_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_MOD_OPERATOR is
			-- New '\\' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_not_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_NOT_EQUAL_SYMBOL is
			-- New '/=' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_plus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_PLUS_SYMBOL is
			-- New '+' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_power_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_POWER_OPERATOR is
			-- New '^' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_semicolon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SEMICOLON_SYMBOL is
			-- New ';' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New Eiffel symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_times_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_INFIX_TIMES_OPERATOR is
			-- New '*' symbol
		do
			!! Result.make_with_position (a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature -- AST leaves

	new_bit_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BIT_CONSTANT is
			-- New bit constant
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_c1_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C1_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		do
			!! Result.make_with_position (a_value, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_c2_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C2_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		do
			!! Result.make_with_position (a_value, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_c3_character_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C3_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/`'
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_free_operator (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FREE_OPERATOR is
			-- New free operator
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_hexadecimal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_HEXADECIMAL_INTEGER_CONSTANT is
			-- New integer constant in hexadecimal format
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_identifier (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_IDENTIFIER is
			-- New identifier
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_regular_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_regular_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_MANIFEST_STRING is
			-- New manifest string with no special character
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_regular_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_REAL_CONSTANT is
			-- New real constant with no underscore
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_special_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SPECIAL_MANIFEST_STRING is
			-- New manifest string with special characters
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_underscored_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_INTEGER_CONSTANT is
			-- New integer constant with underscores
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_underscored_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_REAL_CONSTANT is
			-- New real constant with underscores
		do
			!! Result.make_with_position (a_scanner.last_literal, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

	new_verbatim_string (a_marker, an_open, a_close: STRING; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_VERBATIM_STRING is
			-- New verbatim string
		do
			!! Result.make_with_position (a_scanner.last_literal, a_marker, an_open, a_close, a_scanner.line, a_scanner.column)
			Result.set_break (last_break (False, a_scanner))
		end

feature {NONE} -- Implementation

	last_break (is_header: BOOLEAN; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BREAK is
			-- Last break, comment (or header comment when `is_header' is true)
			-- from `a_scanner'
		require
			a_scanner_not_void: a_scanner /= Void
		do
			if keep_all_breaks then
				if a_scanner.has_break then
					Result := new_break (a_scanner.last_break, 0, 0)
				elseif a_scanner.has_comment then
					Result := new_comment (a_scanner.last_comment, 0, 0)
				end
			elseif keep_all_comments then
				if a_scanner.has_comment then
					Result := new_comment (a_scanner.last_comment, 0, 0)
				end
			elseif keep_header_comments and is_header then
				if a_scanner.has_comment then
					Result := new_comment (a_scanner.last_comment, 0, 0)
				end
			end
		end

end
