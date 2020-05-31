note

	description:

	"[
		Eiffel AST tokenizers.
		Use UTF-8 encoding. Note that the byte order mark (BOM) for UTF-8 is not
		printed unless it was found in the class file when parsing the class text
		and `bom_enabled' is True, or it is explicitly printed by calling `print_bom'.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2018-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_TOKENIZER

inherit

	ET_AST_PRINTER
		redefine
			make,
			process_actual_argument_list,
			process_actual_parameter_list,
			process_break,
			process_constant_attribute,
			process_explicit_convert_from_expression,
			process_explicit_convert_to_expression,
			process_export_list,
			process_feature_export,
			process_formal_argument_list,
			process_invariants,
			process_keyword,
			process_local_variable_list,
			process_loop_invariants,
			process_parent,
			process_postconditions,
			process_preconditions,
			process_semicolon_symbol,
			process_static_call_expression,
			process_static_call_instruction,
			process_token,
			process_unique_attribute
		end

	ET_SHARED_TOKEN_CONSTANTS
		export {NONE} all end

create

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file)
			-- <Precursor>
		do
			separator := default_separator
			precursor (a_file)
		end

feature -- Access

	separator: STRING
			-- Separator between each token

feature -- Setting

	set_separator (a_separator: like separator)
			-- Set `separator' to `a_separator'.
		require
			a_separator_not_void: a_separator /= Void
		do
			separator := a_separator
		ensure
			separator_set: separator = a_separator
		end

feature -- Status report

	empty_actual_arguments_ignored: BOOLEAN
			-- Should empty actual arguments be ignored?

	empty_actual_parameters_ignored: BOOLEAN
			-- Should empty actual parameters be ignored?

	empty_exports_ignored: BOOLEAN
			-- Should empty exports be ignored?

	empty_formal_arguments_ignored: BOOLEAN
			-- Should empty formal arguments be ignored?

	empty_invariants_ignored: BOOLEAN
			-- Should empty invariants be ignored?

	empty_locals_ignored: BOOLEAN
			-- Should empty locals be ignored?

	empty_postconditions_ignored: BOOLEAN
			-- Should empty postconditions be ignored?

	empty_preconditions_ignored: BOOLEAN
			-- Should empty preconditions be ignored?

	feature_keyword_in_static_ignored: BOOLEAN
			-- Should the 'feature' keyword in stattic calls be ignored?

	is_keyword_ignored: BOOLEAN
			-- Should the 'is' keyword be ignored?

	semicolon_ignored: BOOLEAN
			-- Should semicolon tokens be ignored?

	token_lower_case: BOOLEAN
			-- Should tokens be printed in lower-case?

feature -- Status setting

	set_empty_actual_arguments_ignored (b: BOOLEAN)
			-- Set `empty_actual_arguments_ignored' to `b'.
		do
			empty_actual_arguments_ignored := b
		ensure
			empty_actual_arguments_ignored_set: empty_actual_arguments_ignored = b
		end

	set_empty_actual_parameters_ignored (b: BOOLEAN)
			-- Set `empty_actual_parameters_ignored' to `b'.
		do
			empty_actual_parameters_ignored := b
		ensure
			empty_actual_parameters_ignored_set: empty_actual_parameters_ignored = b
		end

	set_empty_exports_ignored (b: BOOLEAN)
			-- Set `empty_exports_ignored' to `b'.
		do
			empty_exports_ignored := b
		ensure
			empty_exports_ignored_set: empty_exports_ignored = b
		end

	set_empty_formal_arguments_ignored (b: BOOLEAN)
			-- Set `empty_formal_arguments_ignored' to `b'.
		do
			empty_formal_arguments_ignored := b
		ensure
			empty_formal_arguments_ignored_set: empty_formal_arguments_ignored = b
		end

	set_empty_invariants_ignored (b: BOOLEAN)
			-- Set `empty_invariants_ignored' to `b'.
		do
			empty_invariants_ignored := b
		ensure
			empty_invariants_ignored_set: empty_invariants_ignored = b
		end

	set_empty_locals_ignored (b: BOOLEAN)
			-- Set `empty_locals_ignored' to `b'.
		do
			empty_locals_ignored := b
		ensure
			empty_locals_ignored_set: empty_locals_ignored = b
		end

	set_empty_postconditions_ignored (b: BOOLEAN)
			-- Set `empty_postconditions_ignored' to `b'.
		do
			empty_postconditions_ignored := b
		ensure
			empty_postconditions_ignored_set: empty_postconditions_ignored = b
		end

	set_empty_preconditions_ignored (b: BOOLEAN)
			-- Set `empty_preconditions_ignored' to `b'.
		do
			empty_preconditions_ignored := b
		ensure
			empty_preconditions_ignored_set: empty_preconditions_ignored = b
		end

	set_feature_keyword_in_static_ignored (b: BOOLEAN)
			-- Set `feature_keyword_in_static_ignored' to `b'.
		do
			feature_keyword_in_static_ignored := b
		ensure
			feature_keyword_in_static_ignored_set: feature_keyword_in_static_ignored = b
		end

	set_is_keyword_ignored_ignored (b: BOOLEAN)
			-- Set `is_keyword_ignored' to `b'.
		do
			is_keyword_ignored := b
		ensure
			is_keyword_ignored_set: is_keyword_ignored = b
		end

	set_semicolon_ignored (b: BOOLEAN)
			-- Set `semicolon_ignored' to `b'.
		do
			semicolon_ignored := b
		ensure
			semicolon_ignored_set: semicolon_ignored = b
		end

	set_token_lower_case (b: BOOLEAN)
			-- Set `token_lower_case' to `b'.
		do
			token_lower_case := b
		ensure
			token_lower_case_set: token_lower_case = b
		end

feature {ET_AST_NODE} -- Processing

	process_actual_argument_list (a_list: ET_ACTUAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			if not empty_actual_arguments_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_actual_parameter_list (a_list: ET_ACTUAL_PARAMETER_LIST)
			-- <Precursor>
		do
			if not empty_actual_parameters_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_break (a_break: detachable ET_BREAK)
			-- <Precursor>
		do
			file.put_string (separator)
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE)
			-- <Precursor>
		local
			a_synonym: detachable ET_FEATURE
			l_is_keyword: ET_AST_LEAF
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			l_is_keyword := a_feature.is_keyword
			if not is_keyword_ignored or else not (attached {ET_KEYWORD} l_is_keyword as l_keyword and then l_keyword.is_is) then
				a_feature.is_keyword.process (Current)
			else
				tokens.equal_symbol.process (Current)
			end
			a_feature.constant.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

	process_explicit_convert_from_expression (a_convert_expression: ET_EXPLICIT_CONVERT_FROM_EXPRESSION)
			-- <Precursor>
		do
			tokens.create_keyword.process (Current)
			tokens.left_brace_symbol.process (Current)
			a_convert_expression.type.process (Current)
			tokens.right_brace_symbol.process (Current)
			tokens.dot_symbol.process (Current)
			a_convert_expression.name.process (Current)
			tokens.left_parenthesis_symbol.process (Current)
			a_convert_expression.expression.process (Current)
			tokens.right_parenthesis_symbol.process (Current)
		end

	process_explicit_convert_to_expression (a_convert_expression: ET_EXPLICIT_CONVERT_TO_EXPRESSION)
			-- <Precursor>
		local
			l_need_parentheses: BOOLEAN
			l_expression: ET_EXPRESSION
		do
			l_expression := a_convert_expression.expression
			if
				not attached {ET_PARENTHESIZED_EXPRESSION} l_expression and
				not attached {ET_IDENTIFIER} l_expression and
				not attached {ET_UNQUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_QUALIFIED_CALL_EXPRESSION} l_expression and
				not attached {ET_BRACKET_EXPRESSION} l_expression
			then
				l_need_parentheses := True
			end
			if l_need_parentheses then
				tokens.left_parenthesis_symbol.process (Current)
			end
			l_expression.process (Current)
			if l_need_parentheses then
				tokens.right_parenthesis_symbol.process (Current)
			end
			tokens.dot_symbol.process (Current)
			a_convert_expression.name.process (Current)
		end

	process_export_list (a_list: ET_EXPORT_LIST)
			-- <Precursor>
		do
			if not empty_exports_ignored or else a_list.has_non_null_export then
				precursor (a_list)
			end
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT)
			-- <Precursor>
		do
			if not empty_exports_ignored or else not an_export.is_empty then
				precursor (an_export)
			end
		end

	process_formal_argument_list (a_list: ET_FORMAL_ARGUMENT_LIST)
			-- <Precursor>
		do
			if not empty_formal_arguments_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_keyword (a_keyword: ET_KEYWORD)
			-- <Precursor>
		do
			if not is_keyword_ignored or else not a_keyword.is_is then
				precursor (a_keyword)
			end
		end

	process_invariants (a_list: ET_INVARIANTS)
			-- <Precursor>
		do
			if not empty_invariants_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_local_variable_list (a_list: ET_LOCAL_VARIABLE_LIST)
			-- <Precursor>
		do
			if not empty_locals_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_loop_invariants (a_list: ET_LOOP_INVARIANTS)
			-- <Precursor>
		do
			if not empty_invariants_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_parent (a_parent: ET_PARENT)
			-- <Precursor>
		local
			l_end_needed: BOOLEAN
		do
			a_parent.type.process (Current)
			if attached a_parent.renames as l_renames then
				l_renames.process (Current)
				l_end_needed := True
			end
			if attached a_parent.exports as l_exports then
				l_exports.process (Current)
				if not empty_exports_ignored or else l_exports.has_non_null_export then
					l_end_needed := True
				end
			end
			if attached a_parent.undefines as l_undefines then
				l_undefines.process (Current)
				l_end_needed := True
			end
			if attached a_parent.redefines as l_redefines then
				l_redefines.process (Current)
				l_end_needed := True
			end
			if attached a_parent.selects as l_selects then
				l_selects.process (Current)
				l_end_needed := True
			end
			if attached a_parent.end_keyword as l_end_keyword then
				if not empty_exports_ignored or else l_end_needed then
					l_end_keyword.process (Current)
				end
			end
		end

	process_postconditions (a_list: ET_POSTCONDITIONS)
			-- <Precursor>
		do
			if not empty_postconditions_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS)
			-- <Precursor>
		do
			if not empty_preconditions_ignored or else not a_list.is_empty then
				precursor (a_list)
			end
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL)
			-- <Precursor>
		do
			if not semicolon_ignored then
				precursor (a_symbol)
			end
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION)
			-- <Precursor>
		do
			if not feature_keyword_in_static_ignored and then attached an_expression.feature_keyword as l_feature_keyword then
				l_feature_keyword.process (Current)
			end
			an_expression.static_type.process (Current)
			an_expression.qualified_name.process (Current)
			if attached an_expression.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION)
			-- <Precursor>
		do
			if not feature_keyword_in_static_ignored and then attached an_instruction.feature_keyword as l_feature_keyword then
				l_feature_keyword.process (Current)
			end
			an_instruction.static_type.process (Current)
			an_instruction.qualified_name.process (Current)
			if attached an_instruction.arguments as l_arguments then
				l_arguments.process (Current)
			end
		end

	process_token (a_token: ET_TOKEN)
			-- <Precursor>
		do
			if token_lower_case then
				file.put_string (a_token.text.as_lower)
				process_break (a_token.break)
			else
				precursor (a_token)
			end
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE)
			-- <Precursor>
		local
			a_synonym: detachable ET_FEATURE
			l_is_keyword: ET_AST_LEAF
		do
			from
				a_synonym := a_feature
			until
				a_synonym = Void
			loop
				if attached a_synonym.frozen_keyword as l_frozen_keyword then
					l_frozen_keyword.process (Current)
				end
				a_synonym.extended_name.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			if attached a_feature.assigner as l_assigner then
				l_assigner.process (Current)
			end
			l_is_keyword := a_feature.is_keyword
			if not is_keyword_ignored or else not (attached {ET_KEYWORD} l_is_keyword as l_keyword and then l_keyword.is_is) then
				a_feature.is_keyword.process (Current)
			else
				tokens.equal_symbol.process (Current)
			end
			a_feature.unique_keyword.process (Current)
			if attached a_feature.semicolon as l_semicolon then
				l_semicolon.process (Current)
			end
		end

feature {NONE} -- Implementation

	default_separator: STRING = " "
			-- Default value for `separator'

invariant

	separator_not_void: separator /= Void

end
