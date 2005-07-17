indexing

	description:

		"Eiffel Abstract Syntax Tree factories"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2002, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_FACTORY

inherit

	ET_SHARED_TOKEN_CONSTANTS

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new AST factory.
		do
		end

feature -- Eiffel keywords

	new_agent_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'agent' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.agent_keyword
		end

	new_alias_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'alias' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.alias_keyword
		end

	new_all_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'all' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_all
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_and_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'and' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_and
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_as_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'as' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.as_keyword
		end

	new_assign_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'assign' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.assign_keyword
		end

	new_attribute_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'attribute' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.attribute_keyword
		end

	new_check_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'check' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.check_keyword
		end

	new_class_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'class' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.class_keyword
		end

	new_convert_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'convert' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.convert_keyword
		end

	new_create_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'create' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.create_keyword
		end

	new_creation_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'creation' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.creation_keyword
		end

	new_current_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_CURRENT is
			-- New 'current' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_debug_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'debug' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.debug_keyword
		end

	new_deferred_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'deferred' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.deferred_keyword
		end

	new_do_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'do' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.do_keyword
		end

	new_else_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'else' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.else_keyword
		end

	new_elseif_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'elseif' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.elseif_keyword
		end

	new_end_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'end' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.end_keyword
		end

	new_ensure_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'ensure' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_ensure
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_expanded_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'expanded' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_expanded
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_export_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'export' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.export_keyword
		end

	new_external_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'external' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.external_keyword
		end

	new_false_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FALSE_CONSTANT is
			-- New 'false' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_feature_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'feature' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.feature_keyword
		end

	new_from_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'from' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.from_keyword
		end

	new_frozen_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'frozen' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_frozen
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_if_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'if' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.if_keyword
		end

	new_implies_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'implies' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_implies
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_indexing_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'indexing' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.indexing_keyword
		end

	new_infix_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'infix' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.infix_keyword
		end

	new_inherit_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'inherit' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.inherit_keyword
		end

	new_inspect_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'inspect' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.inspect_keyword
		end

	new_invariant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'invariant' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.invariant_keyword
		end

	new_is_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'is' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.is_keyword
		end

	new_like_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'like' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_like
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_local_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'local' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.local_keyword
		end

	new_loop_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'loop' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.loop_keyword
		end

	new_not_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'not' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_not
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_obsolete_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'obsolete' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.obsolete_keyword
		end

	new_old_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'old' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_old
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_once_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'once' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_once
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_or_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'or' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_or
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_precursor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_PRECURSOR_KEYWORD is
			-- New 'precursor' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_prefix_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'prefix' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.prefix_keyword
		end

	new_recast_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'recast' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.recast_keyword
		end

	new_redefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'redefine' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.redefine_keyword
		end

	new_reference_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'reference' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_reference
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_rename_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'rename' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.rename_keyword
		end

	new_require_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'require' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_require
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_rescue_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'rescue' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.rescue_keyword
		end

	new_result_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RESULT is
			-- New 'result' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_retry_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_RETRY_INSTRUCTION is
			-- New 'retry' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_select_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'select' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.select_keyword
		end

	new_separate_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'separate' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_separate
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_strip_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'strip' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_strip
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_then_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'then' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.then_keyword
		end

	new_true_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_TRUE_CONSTANT is
			-- New 'true' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_undefine_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'undefine' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.undefine_keyword
		end

	new_unique_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'unique' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_unique
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_until_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'until' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.until_keyword
		end

	new_variant_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'variant' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.variant_keyword
		end

	new_void_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_VOID is
			-- New 'void' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_when_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD is
			-- New 'when' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := tokens.when_keyword
		end

	new_xor_keyword (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_KEYWORD_OPERATOR is
			-- New 'xor' keyword
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_xor
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- Eiffel symbols

	new_arrow_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '->' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.arrow_symbol
		end

	new_assign_attempt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '?=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.assign_attempt_symbol
		end

	new_assign_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ':=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.assign_symbol
		end

	new_bang_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '!' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.bang_symbol
		end

	new_colon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ':' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.colon_symbol
		end

	new_comma_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ',' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.comma_symbol
		end

	new_div_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '//' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_div
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_divide_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '/' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_divide
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_dollar_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '$' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_dollar
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_dot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '.' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.dot_symbol
		end

	new_dotdot_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '..' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.dotdot_symbol
		end

	new_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_equal
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_ge_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '>=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_ge
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_gt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '>' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_gt
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_le_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '<=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_le
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '<<' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_left_array
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '{' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.left_brace_symbol
		end

	new_left_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '[' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_left_bracket
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_left_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '(' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.left_parenthesis_symbol
		end

	new_lt_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '<' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_lt
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_minus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '-' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_minus
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_mod_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '\\' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_mod
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_not_equal_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '/=' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_not_equal
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_plus_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '+' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_plus
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_power_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '^' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_power
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_question_mark_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_QUESTION_MARK_SYMBOL is
			-- New '?' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_right_array_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '>>' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_array_symbol
		end

	new_right_brace_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '}' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_brace_symbol
		end

	new_right_bracket_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ']' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_bracket_symbol
		end

	new_right_parenthesis_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New ')' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.right_parenthesis_symbol
		end

	new_semicolon_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SEMICOLON_SYMBOL is
			-- New ';' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.semicolon_symbol
		end

	new_tilde_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL is
			-- New '~' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			Result := tokens.tilde_symbol
		end

	new_times_symbol (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SYMBOL_OPERATOR is
			-- New '*' symbol
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make_times
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- AST leaves

	new_bit_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BIT_CONSTANT is
			-- New bit constant
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: ([0-1]+[bB]).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_break (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_BREAK is
			-- New break
		require
			a_scanner_not_void: a_scanner /= Void
			has_break: a_scanner.has_break
		do
			-- Result := Void
		end

	new_c1_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C1_CHARACTER_CONSTANT is
			-- New character constant of the form 'A'
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_c2_character_constant (a_value: CHARACTER; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C2_CHARACTER_CONSTANT is
			-- New character constant of the form '%A'
		require
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make (a_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_c3_character_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_C3_CHARACTER_CONSTANT is
			-- New character constant of the form '%/code/'
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: ([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5]).recognizes (a_scanner.last_literal)
		local
			l_literal: STRING
			l_value: CHARACTER
			i, nb: INTEGER
			c: CHARACTER
			l_code: INTEGER
		do
			l_literal := a_scanner.last_literal
			nb := l_literal.count
			from i := 1 until i > nb loop
				c := l_literal.item (i)
				l_code := l_code * 10 + c.code - Zero_code
				i := i + 1
			end
			l_value := INTEGER_.to_character (l_code)
			create Result.make (l_literal, l_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_comment (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_COMMENT is
			-- New comment
		require
			a_scanner_not_void: a_scanner /= Void
			has_comment: a_scanner.has_comment
		do
			-- Result := Void
		end

	new_free_operator (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_FREE_OPERATOR is
			-- New free operator
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			create Result.make_prefix (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_hexadecimal_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_HEXADECIMAL_INTEGER_CONSTANT is
			-- New integer constant in hexadecimal format
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: (0[xX][0-9a-fA-F]+).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_identifier (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_IDENTIFIER is
			-- New identifier
		require
			a_scanner_not_void: a_scanner /= Void
			last_literal_not_empty: a_scanner.last_literal_count > 0
		do
			Result := a_scanner.last_identifier
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_INTEGER_CONSTANT is
			-- New integer constant with no underscore
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: ([0-9]+).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_MANIFEST_STRING is
			-- New manifest string with no special character
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: ([^"%\n]*).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_regular_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_REGULAR_REAL_CONSTANT is
			-- New real constant with no underscore
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: (([0-9]+\.[0-9]*|[0-9]*\.[0-9]+)([eE][+-]?[0-9]+)?).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_special_manifest_string (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_SPECIAL_MANIFEST_STRING is
			-- New manifest string with special characters
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: (([^"%\n]|%([^\n]|\/([0-9]|[1-9][0-9]|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\/|[ \t\r]*\n[ \t\r\n]*%))*).recognizes (a_scanner.last_literal)
		local
			l_literal, l_value: STRING
			i, nb: INTEGER
			c: CHARACTER
			l_code: INTEGER
		do
			l_literal := a_scanner.last_literal
			nb := l_literal.count
			create l_value.make (nb)
			from i := 1 until i > nb loop
				c := l_literal.item (i)
				if c = '%%' then
					i := i + 1
					c := l_literal.item (i)
					inspect c
					when 'N' then
						l_value.append_character ('%N')
					when 'T' then
						l_value.append_character ('%T')
					when 'U' then
						l_value.append_character ('%U')
					when 'R' then
						l_value.append_character ('%R')
					when 'A' then
						l_value.append_character ('%A')
					when 'B' then
						l_value.append_character ('%B')
					when 'C' then
						l_value.append_character ('%C')
					when 'D' then
						l_value.append_character ('%D')
					when 'F' then
						l_value.append_character ('%F')
					when 'H' then
						l_value.append_character ('%H')
					when 'L' then
						l_value.append_character ('%L')
					when 'Q' then
						l_value.append_character ('%Q')
					when 'S' then
						l_value.append_character ('%S')
					when 'V' then
						l_value.append_character ('%V')
					when '%%' then
						l_value.append_character ('%%')
					when '%'' then
						l_value.append_character ('%'')
					when '%"' then
						l_value.append_character ('%"')
					when '(' then
						l_value.append_character ('%(')
					when ')' then
						l_value.append_character ('%)')
					when '<' then
						l_value.append_character ('%<')
					when '>' then
						l_value.append_character ('%>')
					when '/' then
						from
							i := i + 1
							c := l_literal.item (i)
							l_code := 0
						until 
							c = '/'
						loop
							l_code := l_code * 10 + c.code - Zero_code
							i := i + 1
							c := l_literal.item (i)
						end
						l_value.append_character (INTEGER_.to_character (l_code))
					when '%N', '%R', ' ', '%T'  then
						from
							i := i + 1
						until 
							l_literal.item (i) = '%%'
						loop
							i := i + 1
						end
					when 'n' then
						l_value.append_character ('%N')
					when 't' then
						l_value.append_character ('%T')
					when 'u' then
						l_value.append_character ('%U')
					when 'r' then
						l_value.append_character ('%R')
					when 'a' then
						l_value.append_character ('%A')
					when 'b' then
						l_value.append_character ('%B')
					when 'c' then
						l_value.append_character ('%C')
					when 'd' then
						l_value.append_character ('%D')
					when 'f' then
						l_value.append_character ('%F')
					when 'h' then
						l_value.append_character ('%H')
					when 'l' then
						l_value.append_character ('%L')
					when 'q' then
						l_value.append_character ('%Q')
					when 's' then
						l_value.append_character ('%S')
					when 'v' then
						l_value.append_character ('%V')
					else
						l_value.append_character (c)
					end
					i := i + 1
				else
					l_value.append_character (c)
					i := i + 1
				end
			end
			create Result.make (l_literal, l_value)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_underscored_integer_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_INTEGER_CONSTANT is
			-- New integer constant with underscores
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: ((_*[0-9]+_*)+).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_underscored_real_constant (a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_UNDERSCORED_REAL_CONSTANT is
			-- New real constant with underscores
		require
			a_scanner_not_void: a_scanner /= Void
			-- valid_literal: (((_*[0-9]+_*)+\.(_*[0-9]_*)*|(_*[0-9]_*)*\.(_*[0-9]_*)+)([eE][+-]?(_*[0-9]_*)+)?).recognizes (a_scanner.last_literal)
		do
			create Result.make (a_scanner.last_literal)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

	new_verbatim_string (a_marker, an_open, a_close: STRING; a_scanner: ET_EIFFEL_SCANNER_SKELETON): ET_VERBATIM_STRING is
			-- New verbatim string
		require
			a_marker_not_void: a_marker /= Void
			an_open_not_void: an_open /= Void
			a_close_not_void: a_close /= Void
			a_scanner_not_void: a_scanner /= Void
		do
			create Result.make (a_scanner.last_literal, a_marker, an_open, a_close)
			Result.set_position (a_scanner.line, a_scanner.column)
		end

feature -- AST nodes

	new_actual_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_ARGUMENT_LIST is
			-- New actual argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_actual_parameter (a_type: ET_TYPE): ET_ACTUAL_PARAMETER is
			-- New actual parameter
		do
			Result := a_type
		end

	new_actual_parameter_comma (a_parameter: ET_ACTUAL_PARAMETER; a_comma: ET_SYMBOL): ET_ACTUAL_PARAMETER_ITEM is
			-- New actual_parameter-comma
		do
			Result := a_parameter
		end

	new_actual_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_ACTUAL_PARAMETER_LIST is
			-- New actual generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
				if a_left /= Void and then not a_left.position.is_null then
					Result.set_left_bracket (a_left)
				end
			end
		end

	new_agent_argument_operand_comma (an_argument: ET_AGENT_ARGUMENT_OPERAND; a_comma: ET_SYMBOL): ET_AGENT_ARGUMENT_OPERAND_ITEM is
			-- New agent_argument_operand-comma
		do
			Result := an_argument
		end

	new_agent_argument_operands (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_AGENT_ARGUMENT_OPERAND_LIST is
			-- New agent argument operand list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_agent_typed_open_argument (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL; a_question_mark: ET_QUESTION_MARK_SYMBOL): ET_AGENT_TYPED_OPEN_ARGUMENT is
			-- New agent open argument of the form '{TYPE} ?'
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_agent_open_target (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL): ET_AGENT_OPEN_TARGET is
			-- New agent open target of the form '{TYPE}'
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_alias_and_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "and" feature name
		do
			if a_string /= Void then
				create Result.make_and (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_and_then_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "and then" feature name
		do
			if a_string /= Void then
				create Result.make_and_then (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_bracket_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "[]" feature name
		do
			if a_string /= Void then
				create Result.make_bracket (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_div_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_div (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_divide_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "//" feature name
		do
			if a_string /= Void then
				create Result.make_divide (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_dotdot_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ".." feature name
		do
			if a_string /= Void then
				create Result.make_dotdot (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_free_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_FREE_NAME is
			-- New alias free feature name
		require
			a_string_computed: a_string /= Void implies a_string.value.count > 0
		do
			if a_string /= Void then
				create Result.make_infix (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_ge_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ">=" feature name
		do
			if a_string /= Void then
				create Result.make_ge (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_gt_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias ">" feature name
		do
			if a_string /= Void then
				create Result.make_gt (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_implies_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "implies" feature name
		do
			if a_string /= Void then
				create Result.make_implies (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_le_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "<=" feature name
		do
			if a_string /= Void then
				create Result.make_le (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_lt_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "<" feature name
		do
			if a_string /= Void then
				create Result.make_lt (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_minus_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "-" feature name
		do
			if a_string /= Void then
				create Result.make_minus (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_mod_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "\\" feature name
		do
			if a_string /= Void then
				create Result.make_mod (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_not_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "not" feature name
		do
			if a_string /= Void then
				create Result.make_not (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_or_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "or" feature name
		do
			if a_string /= Void then
				create Result.make_or (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_or_else_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "or else" feature name
		do
			if a_string /= Void then
				create Result.make_or_else (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_plus_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "+" feature name
		do
			if a_string /= Void then
				create Result.make_plus (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_power_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "^" feature name
		do
			if a_string /= Void then
				create Result.make_power (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_times_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "*" feature name
		do
			if a_string /= Void then
				create Result.make_times (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_alias_xor_name (an_alias: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ALIAS_NAME is
			-- New alias "xor" feature name
		do
			if a_string /= Void then
				create Result.make_xor (a_string)
				if an_alias /= Void and then not an_alias.position.is_null then
					Result.set_alias_keyword (an_alias)
				end
			end
		end

	new_aliased_feature_name (a_name: ET_FEATURE_NAME; an_alias: ET_ALIAS_NAME): ET_ALIASED_FEATURE_NAME is
			-- New aliased feature name
		do
			if a_name /= Void and an_alias /= Void then
				create Result.make (a_name, an_alias)
			end
		end

	new_all_export (a_clients: ET_CLIENTS; an_all: ET_KEYWORD): ET_ALL_EXPORT is
			-- New 'all' export clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
			end
		end

	new_any_clients (a_keyword: ET_KEYWORD): ET_CLASS_NAME_LIST is
			-- Implicit client list (when preceded by `a_keyword')
			-- with only one client: ANY
		local
			a_name: ET_IDENTIFIER
			a_position: ET_POSITION
		do
			if a_keyword = Void or else a_keyword.position.is_null then
				Result := tokens.any_clients
			else
				create Result.make_with_capacity (1)
				create a_name.make (tokens.any_class_name.name)
				a_position := a_keyword.position
				a_name.set_position (a_position.line, a_position.column)
				Result.put_first (a_name)
			end
		end

	new_argument_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_ARGUMENT_NAME is
			-- New argument_name-comma
		do
			Result := a_name
		end

	new_assertion_semicolon (an_assertion: ET_ASSERTION; a_semicolon: ET_SYMBOL): ET_ASSERTION_ITEM is
			-- New assertion followed by a semicolon
		do
			Result := an_assertion
		end

	new_assigner (an_assign: ET_KEYWORD; a_feature_name: ET_FEATURE_NAME): ET_ASSIGNER is
			-- New assigner
		do
			if a_feature_name /= Void then
				create Result.make (a_feature_name)
			end
		end

	new_assignment (a_target: ET_WRITABLE; an_assign: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT is
			-- New assignment instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
			end
		end

	new_assignment_attempt (a_target: ET_WRITABLE; an_assign_attempt: ET_SYMBOL; a_source: ET_EXPRESSION): ET_ASSIGNMENT_ATTEMPT is
			-- New assignment-attempt instruction
		do
			if a_target /= Void and a_source /= Void then
				create Result.make (a_target, a_source)
			end
		end

	new_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_ATTRIBUTE is
			-- New attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_clients, a_class)
			end
		end

	new_bang_instruction (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL; a_target: ET_WRITABLE; a_call: ET_QUALIFIED_CALL): ET_BANG_INSTRUCTION is
			-- New bang creation instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if l /= Void and then not l.position.is_null then
					Result.set_left_bang (l)
				end
			end
		end

	new_bit_feature (a_bit: ET_IDENTIFIER; an_id: ET_IDENTIFIER): ET_BIT_FEATURE is
			-- New 'BIT Identifier' type
		do
			if an_id /= Void then
				create Result.make (an_id)
				if a_bit /= Void and then not a_bit.position.is_null then
					Result.set_bit_keyword (a_bit)
				end
			end
		end

	new_bit_n (a_bit: ET_IDENTIFIER; an_int: ET_INTEGER_CONSTANT): ET_BIT_N is
			-- New 'BIT N' type
		do
			if an_int /= Void then
				create Result.make (an_int)
				if a_bit /= Void and then not a_bit.position.is_null then
					Result.set_bit_keyword (a_bit)
				end
			end
		end

	new_call_agent (an_agent: ET_AST_LEAF; a_target: ET_AGENT_TARGET; a_name: ET_QUALIFIED_FEATURE_NAME;
		args: ET_AGENT_ARGUMENT_OPERAND_LIST): ET_CALL_AGENT is
			-- New call agent
		do
			if a_name /= Void then
				create Result.make (a_target, a_name, args)
				if an_agent /= Void then
					Result.set_agent_keyword (an_agent)
				end
			end
		end

	new_call_expression (a_target: ET_EXPRESSION; a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_CALL_EXPRESSION is
			-- New call expression
		do
			if a_name /= Void then
				create Result.make (a_target, a_name, args)
			end
		end

	new_call_instruction (a_target: ET_EXPRESSION; a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_CALL_INSTRUCTION is
			-- New call instruction
		do
			if a_name /= Void then
				create Result.make (a_target, a_name, args)
			end
		end

	new_check_instruction (a_check: ET_KEYWORD; an_end: ET_KEYWORD; nb: INTEGER): ET_CHECK_INSTRUCTION is
			-- New check instruction with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_check /= Void and then not a_check.position.is_null then
				Result.set_check_keyword (a_check)
			end
		end

	new_choice_comma (a_choice: ET_CHOICE; a_comma: ET_SYMBOL): ET_CHOICE_ITEM is
			-- New choice-comma
		do
			Result := a_choice
		end

	new_choice_list (a_when: ET_KEYWORD; nb: INTEGER): ET_CHOICE_LIST is
			-- New choice list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_when /= Void and nb = 0 then
				Result.set_when_keyword (a_when)
			end
		end

	new_choice_range (a_lower: ET_CHOICE_CONSTANT; a_dotdot: ET_SYMBOL; an_upper: ET_CHOICE_CONSTANT): ET_CHOICE_RANGE is
			-- New choice range
		do
			if a_lower /= Void and an_upper /= Void then
				create Result.make (a_lower, an_upper)
			end
		end

	new_class_name_comma (a_name: ET_CLASS_NAME; a_comma: ET_SYMBOL): ET_CLASS_NAME_ITEM is
			-- New class_name-comma
		do
			Result := a_name
		end

	new_class_type (a_type_mark: ET_KEYWORD; a_name: ET_CLASS_NAME; a_class: ET_CLASS): ET_CLASS_TYPE is
			-- New Eiffel class type
		do
			if a_name /= Void and a_class /= Void then
				create Result.make (a_type_mark, a_name, a_class)
			end
		end

	new_clients (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_CLIENTS is
			-- New client clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.is_null then
				Result.set_left_brace (a_left)
			end
		end

	new_colon_type (a_colon: ET_SYMBOL; a_type: ET_TYPE): ET_DECLARED_TYPE is
			-- New colon-type
		do
			Result := a_type
		end

	new_compound (nb: INTEGER): ET_COMPOUND is
			-- New instruction compound with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_conditional (a_keyword: ET_KEYWORD; an_expression: ET_EXPRESSION): ET_CONDITIONAL is
			-- New conditional
		do
			if an_expression /= Void then
				if a_keyword /= Void and then ((a_keyword.is_if or a_keyword.is_inspect) and not a_keyword.position.is_null) then
					create {ET_KEYWORD_EXPRESSION} Result.make (a_keyword, an_expression)
				else
					Result := an_expression
				end
			end
		end

	new_constant_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		an_is: ET_KEYWORD; a_constant: ET_CONSTANT; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_CONSTANT_ATTRIBUTE is
			-- New constant attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_constant /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_constant, a_clients, a_class)
			end
		end

	new_constrained_formal_parameter (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER; an_arrow: ET_SYMBOL; a_constraint: ET_TYPE;
		a_creation: ET_CONSTRAINT_CREATOR): ET_CONSTRAINED_FORMAL_PARAMETER is
			-- New constrained formal generic parameter
		do
			if a_name /= Void and a_constraint /= Void then
				create Result.make (a_name, a_constraint, a_creation)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
			end
		end

	new_constraint_actual_parameter (a_type: ET_CONSTRAINT_TYPE): ET_CONSTRAINT_ACTUAL_PARAMETER is
			-- New actual parameter appearing in a generic constraint
		do
			Result := a_type
		end

	new_constraint_actual_parameter_comma (a_parameter: ET_CONSTRAINT_ACTUAL_PARAMETER; a_comma: ET_SYMBOL): ET_CONSTRAINT_ACTUAL_PARAMETER_ITEM is
			-- New constraint_actual_parameter-comma
		do
			Result := a_parameter
		end

	new_constraint_actual_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_CONSTRAINT_ACTUAL_PARAMETER_LIST is
			-- New constraint actual generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
				if a_left /= Void and then not a_left.position.is_null then
					Result.set_left_bracket (a_left)
				end
			end
		end

	new_constraint_creator (a_create: ET_KEYWORD; an_end: ET_KEYWORD; nb: INTEGER): ET_CONSTRAINT_CREATOR is
			-- New constraint creation clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_constraint_generic_named_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER;
		a_generics: like new_constraint_actual_parameters): ET_CONSTRAINT_GENERIC_NAMED_TYPE is
			-- New Eiffel constraint generic named type
		do
			if a_name /= Void and a_generics /= Void then
				create Result.make (a_type_mark, a_name, a_generics)
			end
		end

	new_constraint_named_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER): ET_CONSTRAINT_NAMED_TYPE is
			-- New Eiffel constraint named type
		do
			if a_name /= Void then
				create Result.make (a_type_mark, a_name)
			end
		end

	new_convert_feature_comma (a_convert_feature: ET_CONVERT_FEATURE; a_comma: ET_SYMBOL): ET_CONVERT_FEATURE_ITEM is
			-- New convert_feature-comma
		do
			Result := a_convert_feature
		end

	new_convert_features (a_convert: ET_KEYWORD; nb: INTEGER): ET_CONVERT_FEATURE_LIST is
			-- New convert clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_convert_function (a_name: ET_FEATURE_NAME; a_colon: ET_SYMBOL; a_types: ET_TYPE_LIST): ET_CONVERT_FUNCTION is
			-- New convert function
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
			end
		end

	new_convert_procedure (a_name: ET_FEATURE_NAME; a_left_parenthesis: ET_SYMBOL; a_types: ET_TYPE_LIST; a_right_parenthesis: ET_SYMBOL): ET_CONVERT_PROCEDURE is
			-- New convert procedure
		do
			if a_name /= Void and a_types /= Void then
				create Result.make (a_name, a_types)
			end
		end

	new_convert_types (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_TYPE_LIST is
			-- New convert type list with given capacity
		require
			nb_positive: nb >= 0
		local
			a_braced_types: ET_BRACED_TYPE_LIST
		do
			if nb > 0 then
				create a_braced_types.make_with_capacity (nb)
				Result := a_braced_types
				if a_left /= Void and then not a_left.position.is_null then
					a_braced_types.set_left_brace (a_left)
				end
			end
		end

	new_create_expression (a_create: ET_KEYWORD; a_type: ET_TARGET_TYPE; a_call: ET_QUALIFIED_CALL): ET_CREATE_EXPRESSION is
			-- New create expression
		do
			if a_type /= Void then
				create Result.make (a_type, a_call)
				if a_create /= Void and then not a_create.position.is_null then
					Result.set_create_keyword (a_create)
				end
			end
		end

	new_create_instruction (a_create: ET_KEYWORD; a_type: ET_TARGET_TYPE; a_target: ET_WRITABLE; a_call: ET_QUALIFIED_CALL): ET_CREATE_INSTRUCTION is
			-- New create instruction
		do
			if a_target /= Void then
				create Result.make (a_type, a_target, a_call)
				if a_create /= Void and then not a_create.position.is_null then
					Result.set_create_keyword (a_create)
				end
			end
		end

	new_creator (a_creation: ET_KEYWORD; a_clients: ET_CLASS_NAME_LIST; nb: INTEGER): ET_CREATOR is
			-- New creation clause with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
			end
		end

	new_creators (nb: INTEGER): ET_CREATOR_LIST is
			-- New list of creation clauses with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_current_address (d: ET_SYMBOL; c: ET_CURRENT): ET_CURRENT_ADDRESS is
			-- New address of Current
		do
			create Result.make
			if d /= Void and then not d.position.is_null then
				Result.set_dollar (d)
			end
		end

	new_custom_attribute (a_creation: ET_CREATE_EXPRESSION;
		a_settings: ET_MANIFEST_TUPLE; an_end: ET_KEYWORD): ET_CUSTOM_ATTRIBUTE is
			-- New if instruction
		do
			if a_creation /= Void then
				create Result.make (a_creation, a_settings)
			end
		end

	new_debug_compound (a_debug: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'debug' keyword
		do
			if a_debug /= Void and then not a_debug.position.is_null then
				if a_compound /= Void then
					Result := a_compound
				else
					create Result.make
				end
				Result.set_keyword (a_debug)
			elseif a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.debug_keyword)
			end
		end

	new_debug_instruction (a_keys: ET_MANIFEST_STRING_LIST; a_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_DEBUG_INSTRUCTION is
			-- New debug instruction
		do
			create Result.make (a_keys, a_compound)
		end

	new_deferred_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS; a_deferred: ET_KEYWORD;
		a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_DEFERRED_FUNCTION is
			-- New deferred function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions,
					a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_deferred_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_deferred: ET_KEYWORD; a_postconditions: ET_POSTCONDITIONS;
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_DEFERRED_PROCEDURE is
			-- New deferred procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions,
					a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_do_compound (a_do: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'do' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.do_keyword)
			end
		end

	new_do_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST; a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_DO_FUNCTION is
			-- New do function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_do_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_locals: ET_LOCAL_VARIABLE_LIST;
		a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_DO_PROCEDURE is
			-- New do procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_dot_feature_name (a_dot: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_QUALIFIED_FEATURE_NAME is
			-- New dot-feature_name
		do
			Result := a_name
		end

	new_else_compound (an_else: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by an 'else' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.else_keyword)
			end
		end

	new_elseif_part (a_conditional: ET_CONDITIONAL; a_then_compound: ET_COMPOUND): ET_ELSEIF_PART is
			-- New elseif part
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_then_compound)
			end
		end

	new_elseif_part_list (nb: INTEGER): ET_ELSEIF_PART_LIST is
			-- New elseif part list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_equality_expression (l: ET_EXPRESSION; an_op: ET_SYMBOL; r: ET_EXPRESSION): ET_EQUALITY_EXPRESSION is
			-- New equality expression
		do
			if l /= Void and an_op /= Void and r /= Void then
				create Result.make (l, an_op, r)
			end
		end

	new_exports (an_export: ET_KEYWORD; nb: INTEGER): ET_EXPORT_LIST is
			-- New export clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_expression_address (d: ET_SYMBOL; e: ET_PARENTHESIZED_EXPRESSION): ET_EXPRESSION_ADDRESS is
			-- New expression address
		do
			if e /= Void then
				create Result.make (e)
				if d /= Void and then not d.position.is_null then
					Result.set_dollar (d)
				end
			end
		end

	new_expression_comma (an_expression: ET_EXPRESSION; a_comma: ET_SYMBOL): ET_EXPRESSION_ITEM is
			-- New expression-comma
		do
			Result := an_expression
		end

	new_extended_feature_name_comma (a_name: ET_EXTENDED_FEATURE_NAME; a_comma: ET_SYMBOL): ET_EXTENDED_FEATURE_NAME is
			-- New extended_feature_name-comma
		do
			Result := a_name
		end

	new_external_alias (a_keyword: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_EXTERNAL_ALIAS is
			-- New external alias
		do
			Result := a_string
		end

	new_external_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		a_type: ET_DECLARED_TYPE; an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST;
		an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE;
		an_alias: ET_EXTERNAL_ALIAS; a_postconditions: ET_POSTCONDITIONS;
		an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_FUNCTION is
			-- New external function
		do
			if a_name /= Void and a_type /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions,
					a_language, an_alias, a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_external_language (a_keyword: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_EXTERNAL_LANGUAGE is
			-- New external language
		do
			Result := a_string
		end

	new_external_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_language: ET_EXTERNAL_LANGUAGE; an_alias: ET_EXTERNAL_ALIAS;
		a_postconditions: ET_POSTCONDITIONS; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_EXTERNAL_PROCEDURE is
			-- New external procedure
		do
			if a_name /= Void and a_language /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions,
					a_language, an_alias, a_postconditions, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_feature_address (d: ET_SYMBOL; a_name: ET_FEATURE_NAME): ET_FEATURE_ADDRESS is
			-- New feature address
		do
			if a_name /= Void then
				create Result.make (a_name)
				if d /= Void and then not d.position.is_null then
					Result.set_dollar (d)
				end
			end
		end

	new_feature_clause (a_feature: ET_KEYWORD; a_clients: ET_CLASS_NAME_LIST): ET_FEATURE_CLAUSE is
			-- New fetaure clause
		do
			if a_clients /= Void then
				create Result.make (a_clients)
			end
		end

	new_feature_clauses (nb: INTEGER): ET_FEATURE_CLAUSE_LIST is
			-- New feature clauses with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_feature_export (a_clients: ET_CLIENTS; nb: INTEGER): ET_FEATURE_EXPORT is
			-- New feature export clause with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_clients /= Void then
				create Result.make_with_capacity (a_clients, nb)
			end
		end

	new_feature_name_comma (a_name: ET_FEATURE_NAME; a_comma: ET_SYMBOL): ET_FEATURE_NAME_ITEM is
			-- New feature_name-comma
		do
			Result := a_name
		end

	new_formal_argument (a_name: ET_ARGUMENT_NAME; a_type: ET_DECLARED_TYPE): ET_FORMAL_ARGUMENT is
			-- New formal argument
		do
			if a_name /= Void and a_type /= Void then
				create Result.make (a_name, a_type)
			end
		end

	new_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT; a_semicolon: ET_SYMBOL): ET_FORMAL_ARGUMENT_ITEM is
			-- New formal_argument-semicolon
		do
			Result := an_argument
		end

	new_formal_arguments (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_ARGUMENT_LIST is
			-- New formal argument list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_formal_comma_argument (a_name: ET_ARGUMENT_NAME; a_type: ET_DECLARED_TYPE): ET_FORMAL_ARGUMENT is
			-- New formal agument whose name is followed by a comma
		do
			if a_name /= Void and a_type /= Void then
				create {ET_FORMAL_COMMA_ARGUMENT} Result.make (a_name, a_type)
			end
		end

	new_formal_parameter (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER): ET_FORMAL_PARAMETER is
			-- New formal generic parameter
		do
			if a_name /= Void then
				create Result.make (a_name)
				if a_type_mark /= Void then
					Result.set_type_mark (a_type_mark)
				end
			end
		end

	new_formal_parameter_comma (a_formal: ET_FORMAL_PARAMETER; a_comma: ET_SYMBOL): ET_FORMAL_PARAMETER_ITEM is
			-- New formal_parameter-comma
		do
			Result := a_formal
		end

	new_formal_parameter_type (a_name: ET_IDENTIFIER; an_index: INTEGER): ET_FORMAL_PARAMETER_TYPE is
			-- New formal generic parameter type
		do
			if a_name /= Void and then an_index >= 1 then
				create Result.make (a_name, an_index)
			end
		end

	new_formal_parameters (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_FORMAL_PARAMETER_LIST is
			-- New formal generic parameter list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_bracket (a_left)
			end
		end

	new_from_compound (a_from: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'from' keyword
		do
			if a_from /= Void and then not a_from.position.is_null then
				if a_compound /= Void then
					Result := a_compound
				else
					create Result.make
				end
				Result.set_keyword (a_from)
			elseif a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.from_keyword)
			end
		end

	new_generic_class_type (a_type_mark: ET_KEYWORD; a_name: ET_IDENTIFIER;
		a_generics: like new_actual_parameters; a_class: ET_CLASS): ET_GENERIC_CLASS_TYPE is
			-- New Eiffel generic class type
		do
			if a_name /= Void and a_generics /= Void and a_class /= Void then
				create Result.make (a_type_mark, a_name, a_generics, a_class)
			end
		end

	new_if_instruction (a_conditional: ET_CONDITIONAL; a_then_compound: ET_COMPOUND;
		an_elseif_parts: ET_ELSEIF_PART_LIST; an_else_compound: ET_COMPOUND;
		an_end: ET_KEYWORD): ET_IF_INSTRUCTION is
			-- New if instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_then_compound)
				Result.set_elseif_parts (an_elseif_parts)
				Result.set_else_compound (an_else_compound)
			end
		end

	new_indexing (a_terms: ET_INDEXING_TERM_LIST): ET_INDEXING is
			-- New indexing clause
		do
			-- Do nothing.
		end

	new_indexing_semicolon (an_indexing: ET_INDEXING_ITEM; a_semicolon: ET_SYMBOL): ET_INDEXING_ITEM is
			-- New indexing-semicolon
		do
			Result := an_indexing
		end

	new_indexing_term_comma (a_term: ET_INDEXING_TERM; a_comma: ET_SYMBOL): ET_INDEXING_TERM_ITEM is
			-- New indexing_term-comma
		do
			Result := a_term
		end

	new_indexing_terms (nb: INTEGER): ET_INDEXING_TERM_LIST is
			-- New indexing terms with given capacity
		require
			nb_positive: nb >= 0
		do
			-- Do nothing.
		end

	new_indexings (an_indexing: ET_KEYWORD; nb: INTEGER): ET_INDEXING_LIST is
			-- New indexing clause with given capacity
		require
			nb_positive: nb >= 0
		do
			-- Do nothing.
		end

	new_infix_cast_expression (an_expression: ET_EXPRESSION; a_type: ET_TYPE): ET_INFIX_CAST_EXPRESSION is
			-- New infix cast expression
		do
			if an_expression /= Void and a_type /= Void then
				create Result.make (an_expression, a_type)
			end
		end

	new_infix_and_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "and" feature name
		do
			if an_operator /= Void then
				create Result.make_and (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_and_then_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "and then" feature name
		do
			if an_operator /= Void then
				create Result.make_and_then (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_and_then_operator (an_and: ET_KEYWORD; a_then: ET_KEYWORD): ET_INFIX_AND_THEN_OPERATOR is
			-- New binary "and then" operator
		do
			create Result.make
			if an_and /= Void and then not an_and.position.is_null then
				Result.set_and_keyword (an_and)
			end
		end

	new_infix_div_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "//" feature name
		do
			if an_operator /= Void then
				create Result.make_div (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_divide_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "//" feature name
		do
			if an_operator /= Void then
				create Result.make_divide (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_expression (l: ET_EXPRESSION; a_name: ET_OPERATOR; r: ET_EXPRESSION): ET_INFIX_EXPRESSION is
			-- New infix expression
		do
			if l /= Void and r /= Void and a_name /= Void then
				create Result.make (l, a_name, r)
			end
		end

	new_infix_free_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_FREE_NAME is
			-- New infix free feature name
		require
			an_operator_computed: an_operator /= Void implies an_operator.value.count > 0
		do
			if an_operator /= Void then
				create Result.make (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_free_operator (an_operator: ET_FREE_OPERATOR): ET_FREE_OPERATOR is
			-- New infix "<free-operator>" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix
			end
		end

	new_infix_ge_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix ">=" feature name
		do
			if an_operator /= Void then
				create Result.make_ge (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_gt_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix ">" feature name
		do
			if an_operator /= Void then
				create Result.make_gt (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_implies_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "implies" feature name
		do
			if an_operator /= Void then
				create Result.make_implies (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_le_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "<=" feature name
		do
			if an_operator /= Void then
				create Result.make_le (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_lt_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "<" feature name
		do
			if an_operator /= Void then
				create Result.make_lt (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_minus_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "-" feature name
		do
			if an_operator /= Void then
				create Result.make_minus (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_minus_operator (an_operator: ET_SYMBOL_OPERATOR): ET_SYMBOL_OPERATOR is
			-- New infix "-" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix_minus
			end
		end

	new_infix_mod_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "\\" feature name
		do
			if an_operator /= Void then
				create Result.make_mod (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "or" feature name
		do
			if an_operator /= Void then
				create Result.make_or (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_else_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "or else" feature name
		do
			if an_operator /= Void then
				create Result.make_or_else (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_or_else_operator (an_or: ET_KEYWORD; an_else: ET_KEYWORD): ET_INFIX_OR_ELSE_OPERATOR is
			-- New binary "or else" operator
		do
			create Result.make
			if an_or /= Void and then not an_or.position.is_null then
				Result.set_or_keyword (an_or)
			end
		end

	new_infix_plus_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "+" feature name
		do
			if an_operator /= Void then
				create Result.make_plus (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_plus_operator (an_operator: ET_SYMBOL_OPERATOR): ET_SYMBOL_OPERATOR is
			-- New infix "+" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_infix_plus
			end
		end

	new_infix_power_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "^" feature name
		do
			if an_operator /= Void then
				create Result.make_power (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_times_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "*" feature name
		do
			if an_operator /= Void then
				create Result.make_times (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_infix_xor_name (an_infix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_INFIX_NAME is
			-- New infix "xor" feature name
		do
			if an_operator /= Void then
				create Result.make_xor (an_operator)
				if an_infix /= Void and then not an_infix.position.is_null then
					Result.set_infix_keyword (an_infix)
				end
			end
		end

	new_inspect_instruction (a_conditional: ET_CONDITIONAL; a_when_parts: ET_WHEN_PART_LIST;
		an_else_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_INSPECT_INSTRUCTION is
			-- New inspect instruction
		do
			if a_conditional /= Void then
				create Result.make (a_conditional, a_when_parts)
				Result.set_else_compound (an_else_compound)
			end
		end

	new_invariants (an_invariant: ET_KEYWORD; a_class: ET_CLASS; nb: INTEGER): ET_INVARIANTS is
			-- New class invariants with given capacity
		require
			nb_positive: nb >= 0
		do
			if a_class /= Void then
				create Result.make_with_capacity (a_class, nb)
				if an_invariant /= Void and then not an_invariant.position.is_null then
					Result.set_invariant_keyword (an_invariant)
				end
			end
		end

	new_keyword_feature_name_list (a_keyword: ET_KEYWORD; nb: INTEGER): ET_KEYWORD_FEATURE_NAME_LIST is
			-- New feature name list, with a given capacity, preceded by a keyword
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_like_current (a_like: ET_KEYWORD; a_current: ET_CURRENT): ET_LIKE_CURRENT is
			-- New 'like Current' type
		do
			create Result.make
			if a_like /= Void and then not a_like.position.is_null then
				Result.set_like_keyword (a_like)
			end
		end

	new_like_feature (a_like: ET_KEYWORD; a_name: ET_FEATURE_NAME): ET_LIKE_FEATURE is
			-- New 'like name' type
		do
			if a_name /= Void then
				create Result.make (a_name)
				if a_like /= Void and then not a_like.position.is_null then
					Result.set_like_keyword (a_like)
				end
			end
		end

	new_local_comma_variable (a_name: ET_LOCAL_NAME; a_type: ET_DECLARED_TYPE): ET_LOCAL_VARIABLE is
			-- New local variable whose name is followed by a comma
		do
			if a_name /= Void and a_type /= Void then
				create {ET_LOCAL_COMMA_VARIABLE} Result.make (a_name, a_type)
			end
		end

	new_local_name_comma (a_name: ET_IDENTIFIER; a_comma: ET_SYMBOL): ET_LOCAL_NAME is
			-- New local_name-comma
		do
			Result := a_name
		end

	new_local_variable (a_name: ET_LOCAL_NAME; a_type: ET_DECLARED_TYPE): ET_LOCAL_VARIABLE is
			-- New local variable
		do
			if a_name /= Void and a_type /= Void then
				create Result.make (a_name, a_type)
			end
		end

	new_local_variable_semicolon (a_variable: ET_LOCAL_VARIABLE; a_semicolon: ET_SYMBOL): ET_LOCAL_VARIABLE_ITEM is
			-- New local_variable-semicolon
		do
			Result := a_variable
		end

	new_local_variables (a_local: ET_KEYWORD; nb: INTEGER): ET_LOCAL_VARIABLE_LIST is
			-- New local variable list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_local /= Void and nb = 0 then
				Result.set_local_keyword (a_local)
			end
		end

	new_loop_compound (a_loop: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'loop' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.loop_keyword)
			end
		end

	new_loop_instruction (a_from_compound: ET_COMPOUND; an_invariant: ET_LOOP_INVARIANTS;
		a_variant: ET_VARIANT; an_until_conditional: ET_CONDITIONAL;
		a_loop_compound: ET_COMPOUND; an_end: ET_KEYWORD): ET_LOOP_INSTRUCTION is
			-- New loop instruction
		do
			if an_until_conditional /= Void then
				create Result.make (a_from_compound, an_until_conditional, a_loop_compound)
				Result.set_invariant_part (an_invariant)
				Result.set_variant_part (a_variant)
			end
		end

	new_loop_invariants (an_invariant: ET_KEYWORD; nb: INTEGER): ET_LOOP_INVARIANTS is
			-- New loop invariants with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if an_invariant /= Void and then not an_invariant.position.is_null then
				Result.set_invariant_keyword (an_invariant)
			end
		end

	new_manifest_array (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_ARRAY is
			-- New manifest array with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_symbol (a_left)
			end
		end

	new_manifest_string_comma (a_string: ET_MANIFEST_STRING; a_comma: ET_SYMBOL): ET_MANIFEST_STRING_ITEM is
			-- New manifest_string-comma
		do
			Result := a_string
		end

	new_manifest_string_list (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_STRING_LIST is
			-- New list of manifest strings with capacity `nb'.
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

	new_manifest_tuple (a_left, a_right: ET_SYMBOL; nb: INTEGER): ET_MANIFEST_TUPLE is
			-- New manifest tuple with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_left /= Void and then not a_left.position.is_null then
				Result.set_left_symbol (a_left)
			end
		end

	new_manifest_type (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL): ET_MANIFEST_TYPE is
			-- New manifest type
		do
			if a_type /= Void then
				create Result.make (a_type)
			end
		end

	new_none_clients (a_left, a_right: ET_SYMBOL): ET_NONE_CLIENTS is
			-- Client list of the form {}
		do
			if a_left /= Void and a_right /= Void then
				create Result.make (a_left, a_right)
			end
		end

	new_null_export (a_semicolon: ET_SEMICOLON_SYMBOL): ET_NULL_EXPORT is
			-- New null export
		do
			-- Result := Void
		end

	new_null_instruction (a_semicolon: ET_SEMICOLON_SYMBOL): ET_NULL_INSTRUCTION is
			-- New null instruction
		do
			-- Result := Void
		end

	new_obsolete_message (an_obsolete: ET_KEYWORD; a_message: ET_MANIFEST_STRING): ET_OBSOLETE is
			-- New obsolete clause
		do
			Result := a_message
		end

	new_old_expression (an_old: ET_KEYWORD; e: ET_EXPRESSION): ET_OLD_EXPRESSION is
			-- New old expression
		do
			if e /= Void then
				create Result.make (e)
				if an_old /= Void and then not an_old.position.is_null then
					Result.set_old_keyword (an_old)
				end
			end
		end

	new_once_compound (a_once: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'once' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.once_keyword)
			end
		end

	new_once_function (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST; a_type: ET_DECLARED_TYPE;
		an_assigner: ET_ASSIGNER; an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE;
		a_preconditions: ET_PRECONDITIONS; a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND;
		a_postconditions: ET_POSTCONDITIONS; a_rescue: ET_COMPOUND; an_end: ET_KEYWORD;
		a_semicolon: ET_SEMICOLON_SYMBOL; a_clients: ET_CLASS_NAME_LIST;
		a_feature_clause: ET_FEATURE_CLAUSE; a_class: ET_CLASS): ET_ONCE_FUNCTION is
			-- New once function
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, a_type, an_assigner, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_once_manifest_string (a_once: ET_KEYWORD; a_string: ET_MANIFEST_STRING): ET_ONCE_MANIFEST_STRING is
			-- New once manifest string
		do
			if a_string /= Void then
				create Result.make (a_string)
				if a_once /= Void and then not a_once.position.is_null then
					Result.set_once_keyword (a_once)
				end
			end
		end

	new_once_procedure (a_name: ET_EXTENDED_FEATURE_NAME; args: ET_FORMAL_ARGUMENT_LIST;
		an_is: ET_KEYWORD; a_first_indexing: ET_INDEXING_LIST; an_obsolete: ET_OBSOLETE; a_preconditions: ET_PRECONDITIONS;
		a_locals: ET_LOCAL_VARIABLE_LIST; a_compound: ET_COMPOUND; a_postconditions: ET_POSTCONDITIONS;
		a_rescue: ET_COMPOUND; an_end: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_ONCE_PROCEDURE is
			-- New once procedure
		do
			if a_name /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, args, an_obsolete, a_preconditions, a_locals,
					a_compound, a_postconditions, a_rescue, a_clients, a_class)
				Result.set_first_indexing (a_first_indexing)
			end
		end

	new_parent (a_type: ET_CLASS_TYPE; a_renames: ET_RENAME_LIST; an_exports: ET_EXPORT_LIST;
		an_undefines, a_redefines, a_selects: ET_KEYWORD_FEATURE_NAME_LIST; an_end: ET_KEYWORD): ET_PARENT is
			-- New parent
		do
			if a_type /= Void then
				create Result.make (a_type, a_renames, an_exports, an_undefines, a_redefines, a_selects)
			end
		end

	new_parent_semicolon (a_parent: ET_PARENT; a_semicolon: ET_SYMBOL): ET_PARENT_ITEM is
			-- New parent-semicolon
		do
			Result := a_parent
		end

	new_parents (an_inherit: ET_KEYWORD; nb: INTEGER): ET_PARENT_LIST is
			-- New class parent list with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		ensure
			parents_not_void: nb > 0 implies Result /= Void
		end

	new_parenthesized_expression (l: ET_SYMBOL; e: ET_EXPRESSION; r: ET_SYMBOL): ET_PARENTHESIZED_EXPRESSION is
			-- New parenthesized expression
		do
			if e /= Void then
				create Result.make (e)
				if l /= Void and then not l.position.is_null then
					Result.set_left_parenthesis (l)
				end
			end
		end

	new_postconditions (an_ensure: ET_KEYWORD; a_then: ET_KEYWORD; nb: INTEGER): ET_POSTCONDITIONS is
			-- New postconditions with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if an_ensure /= Void and then not an_ensure.position.is_null then
				Result.set_ensure_keyword (an_ensure)
			end
			if a_then /= Void then
				Result.set_then_keyword (a_then)
			end
		end

	new_preconditions (a_require: ET_KEYWORD; an_else: ET_KEYWORD; nb: INTEGER): ET_PRECONDITIONS is
			-- New preconditions with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_require /= Void and then not a_require.position.is_null then
				Result.set_require_keyword (a_require)
			end
			if an_else /= Void then
				Result.set_else_keyword (an_else)
			end
		end

	new_precursor_class_name (l: ET_SYMBOL; a_name: ET_CLASS_NAME; r: ET_SYMBOL): ET_PRECURSOR_CLASS_NAME is
			-- New class name surrounded by braces
		do
			Result := a_name
		end

	new_precursor_expression (is_parent_prefixed: BOOLEAN; a_precursor: ET_PRECURSOR_KEYWORD; a_parent: ET_PRECURSOR_CLASS_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_PRECURSOR_EXPRESSION is
			-- New precursor expression
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_precursor_instruction (is_parent_prefixed: BOOLEAN; a_precursor: ET_PRECURSOR_KEYWORD; a_parent: ET_PRECURSOR_CLASS_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_PRECURSOR_INSTRUCTION is
			-- New precursor instruction
		do
			if a_precursor /= Void then
				create Result.make (a_parent, args)
				Result.set_parent_prefixed (is_parent_prefixed)
				Result.set_precursor_keyword (a_precursor)
			end
		end

	new_prefix_expression (a_name: ET_OPERATOR; e: ET_EXPRESSION): ET_PREFIX_EXPRESSION is
			-- New prefix expression
		do
			if a_name /= Void and e /= Void then
				create Result.make (a_name, e)
			end
		end

	new_prefix_free_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_FREE_NAME is
			-- New prefix free feature name
		require
			an_operator_computed: an_operator /= Void implies an_operator.value.count > 0
		do
			if an_operator /= Void then
				create Result.make (an_operator)
				if a_prefix /= Void and then not a_prefix.position.is_null then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_free_operator (an_operator: ET_FREE_OPERATOR): ET_FREE_OPERATOR is
			-- New prefix "<free-operator>" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix
			end
		end

	new_prefix_minus_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "-" feature name
		do
			if an_operator /= Void then
				create Result.make_minus (an_operator)
				if a_prefix /= Void and then not a_prefix.position.is_null then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_minus_operator (an_operator: ET_SYMBOL_OPERATOR): ET_SYMBOL_OPERATOR is
			-- New prefix "-" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix_minus
			end
		end

	new_prefix_not_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "not" feature name
		do
			if an_operator /= Void then
				create Result.make_not (an_operator)
				if a_prefix /= Void and then not a_prefix.position.is_null then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_plus_name (a_prefix: ET_KEYWORD; an_operator: ET_MANIFEST_STRING): ET_PREFIX_NAME is
			-- New prefix "+" feature name
		do
			if an_operator /= Void then
				create Result.make_plus (an_operator)
				if a_prefix /= Void and then not a_prefix.position.is_null then
					Result.set_prefix_keyword (a_prefix)
				end
			end
		end

	new_prefix_plus_operator (an_operator: ET_SYMBOL_OPERATOR): ET_SYMBOL_OPERATOR is
			-- New prefix "+" operator
		do
			if an_operator /= Void then
				Result := an_operator
				Result.set_prefix_plus
			end
		end

	new_qualified_call (a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_QUALIFIED_CALL is
			-- New qualified call
		do
			if a_name /= Void then
				create Result.make (a_name, args)
			end
		end

	new_rename (old_name: ET_FEATURE_NAME; an_as: ET_KEYWORD; new_name: ET_EXTENDED_FEATURE_NAME): ET_RENAME is
			-- New rename pair
		do
			if old_name /= Void and new_name /= Void then
				create Result.make (old_name, new_name)
			end
		end

	new_rename_comma (old_name: ET_FEATURE_NAME; an_as: ET_KEYWORD;
		new_name: ET_EXTENDED_FEATURE_NAME; a_comma: ET_SYMBOL): ET_RENAME_ITEM is
			-- New rename pair followed by a comma
		do
			if old_name /= Void and new_name /= Void then
				create {ET_RENAME} Result.make (old_name, new_name)
			end
		end

	new_renames (a_rename: ET_KEYWORD; nb: INTEGER): ET_RENAME_LIST is
			-- New rename clause with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
		end

	new_rescue_compound (a_rescue: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'rescue' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.rescue_keyword)
			end
		end

	new_result_address (d: ET_SYMBOL; r: ET_RESULT): ET_RESULT_ADDRESS is
			-- New address of Result
		do
			create Result.make
			if d /= Void and then not d.position.is_null then
				Result.set_dollar (d)
			end
		end

	new_static_call_expression (a_feature: ET_KEYWORD; a_type: ET_TARGET_TYPE;
		a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_STATIC_CALL_EXPRESSION is
			-- New static call expression
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void and then not a_feature.position.is_null then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_static_call_instruction (a_feature: ET_KEYWORD; a_type: ET_TARGET_TYPE;
		a_name: ET_QUALIFIED_FEATURE_NAME; args: ET_ACTUAL_ARGUMENT_LIST): ET_STATIC_CALL_INSTRUCTION is
			-- New static call instruction
		do
			if a_type /= Void and a_name /= Void then
				create Result.make (a_type, a_name, args)
				if a_feature /= Void and then not a_feature.position.is_null then
					Result.set_feature_keyword (a_feature)
				end
			end
		end

	new_strip_expression (a_strip: ET_KEYWORD; l, r: ET_SYMBOL; nb: INTEGER): ET_STRIP_EXPRESSION is
			-- New strip expression with given capacity
		require
			nb_positive: nb >= 0
		do
			create Result.make_with_capacity (nb)
			if a_strip /= Void and then not a_strip.position.is_null then
				Result.set_strip_keyword (a_strip)
			end
		end

	new_tag (a_name: ET_IDENTIFIER; a_colon: ET_SYMBOL): ET_TAG is
			-- New tag
		do
			Result := a_name
		end

	new_tagged_assertion (a_tag: ET_TAG): ET_TAGGED_ASSERTION is
			-- New tagged assertion
		do
			if a_tag /= Void then
				create Result.make (a_tag)
			end
		end

	new_tagged_indexing (a_tag: ET_TAG; a_terms: ET_INDEXING_TERM_LIST): ET_TAGGED_INDEXING is
			-- New tagged indexing clause
		do
			-- Do nothing.
		end

	new_target_type (l: ET_SYMBOL; a_type: ET_TYPE; r: ET_SYMBOL): ET_TARGET_TYPE is
			-- New type surrounded by braces
		do
			Result := a_type
		end

	new_then_compound (a_then: ET_KEYWORD; a_compound: ET_COMPOUND): ET_COMPOUND is
			-- New compound preceded by a 'then' keyword
		do
			if a_compound /= Void then
				Result := a_compound
				Result.set_keyword (tokens.then_keyword)
			end
		end

	new_tuple_type (a_tuple: ET_IDENTIFIER; a_generics: like new_actual_parameters): ET_TUPLE_TYPE is
			-- New 'TUPLE' type
		do
			create Result.make (a_generics)
			if a_tuple /= Void and then not a_tuple.position.is_null then
				Result.set_tuple_keyword (a_tuple)
			end
		end

	new_type_comma (a_type: ET_TYPE; a_comma: ET_SYMBOL): ET_TYPE_ITEM is
			-- New type-comma
		do
			Result := a_type
		end

	new_typed_expression (a_type: ET_TARGET_TYPE; an_expression: ET_EXPRESSION): ET_TYPED_EXPRESSION is
			-- New typed expression
		do
			if a_type /= Void and an_expression /= Void then
				create Result.make (a_type, an_expression)
			end
		end

	new_unique_attribute (a_name: ET_EXTENDED_FEATURE_NAME; a_type: ET_DECLARED_TYPE;
		an_assigner: ET_ASSIGNER; an_is, a_unique: ET_KEYWORD; a_semicolon: ET_SEMICOLON_SYMBOL;
		a_clients: ET_CLASS_NAME_LIST; a_feature_clause: ET_FEATURE_CLAUSE;
		a_class: ET_CLASS): ET_UNIQUE_ATTRIBUTE is
			-- New unique attribute declaration
		do
			if a_name /= Void and a_type /= Void and a_clients /= Void and a_class /= Void then
				create Result.make (a_name, a_type, an_assigner, a_clients, a_class)
			end
		end

	new_variant (a_variant: ET_KEYWORD; a_tag: ET_TAG; an_expression: ET_EXPRESSION): ET_VARIANT is
			-- New loop variant
		do
			create Result.make (a_tag, an_expression)
			if a_variant /= Void and then not a_variant.position.is_null then
				Result.set_variant_keyword (a_variant)
			end
		end

	new_when_part (a_choices: ET_CHOICE_LIST; a_then_compound: ET_COMPOUND): ET_WHEN_PART is
			-- New when part
		do
			if a_choices /= Void then
				create Result.make (a_choices, a_then_compound)
			end
		end

	new_when_part_list (nb: INTEGER): ET_WHEN_PART_LIST is
			-- New when part list with capacity `nb'
		require
			nb_positive: nb >= 0
		do
			if nb > 0 then
				create Result.make_with_capacity (nb)
			end
		end

feature -- AST factory

	new_class (a_name: ET_CLASS_NAME; an_id: INTEGER): ET_CLASS is
			-- New Eiffel class
		require
			a_name_not_void: a_name /= Void
			an_id_positive: an_id > 0
		do
			create Result.make (a_name, an_id)
		ensure
			class_not_void: Result /= Void
		end

end
