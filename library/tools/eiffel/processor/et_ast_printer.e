indexing

	description:

		"Eiffel AST printers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2002, Eric Bezault and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_AST_PRINTER

inherit

	ET_AST_PROCESSOR
	KL_SHARED_STREAMS

creation

	make, make_null

feature {NONE} -- Initialization

	make (a_file: like file) is
			-- Create a new AST printer, using `a_file' as output file.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	make_null is
			-- Create a new AST printer, initialized with a null output stream.
		do
			file := null_output_stream
		ensure
			file_set: file = null_output_stream
		end

feature -- Access

	file: KI_CHARACTER_OUTPUT_STREAM
			-- Output file

feature -- Setting

	set_file (a_file: like file) is
			-- Set `file' to `a_file'.
		require
			a_file_not_void: a_file /= Void
			a_file_is_open_write: a_file.is_open_write
		do
			file := a_file
		ensure
			file_set: file = a_file
		end

	set_null_file is
			-- Set `file' to `null_output_stream'.
		do
			file := null_output_stream
		ensure
			file_set: file = null_output_stream
		end

feature -- Processing

	process_actual_arguments (a_list: ET_ACTUAL_ARGUMENTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('(')
			process_break (a_list.left_symbol.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (')')
			process_break (a_list.right_symbol.break)
		end

	process_actual_generic_parameters (a_list: ET_ACTUAL_GENERIC_PARAMETERS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('[')
			process_break (a_list.left_bracket.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (']')
			process_break (a_list.right_bracket.break)
		end

	process_all_export (an_export: ET_ALL_EXPORT) is
			-- Process `an_export'.
		do
			an_export.clients_clause.process (Current)
			an_export.all_keyword.process (Current)
		end

	process_assertion_semicolon (an_assertion: ET_ASSERTION_SEMICOLON) is
			-- Process `an_assertion'.
		do
			an_assertion.assertion.process (Current)
			file.put_character (';')
			process_break (an_assertion.semicolon.break)
		end

	process_assignment (an_instruction: ET_ASSIGNMENT) is
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			file.put_string (":=")
			process_break (an_instruction.assign_symbol.break)
			an_instruction.source.process (Current)
		end

	process_assignment_attempt (an_instruction: ET_ASSIGNMENT_ATTEMPT) is
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			file.put_string ("?=")
			process_break (an_instruction.reverse_symbol.break)
			an_instruction.source.process (Current)
		end

	process_attribute (a_feature: ET_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
		end

	process_bang_instruction (an_instruction: ET_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			file.put_string ("!!")
			process_break (an_instruction.bangbang.break)
			an_instruction.target.process (Current)
		end

	process_bit_constant (a_constant: ET_BIT_CONSTANT) is
			-- Process `a_constant'.
		do
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_bit_feature (a_type: ET_BIT_FEATURE) is
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_bit_identifier (a_type: ET_BIT_IDENTIFIER) is
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_bit_type (a_type: ET_BIT_TYPE) is
			-- Process `a_type'.
		do
			a_type.bit_keyword.process (Current)
			a_type.constant.process (Current)
		end

	process_break (a_break: ET_BREAK) is
			-- Process `a_break'.
		do
			if a_break /= Void then
				file.put_string (a_break.text)
			end
		end

	process_c1_character_constant (a_constant: ET_C1_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			file.put_character ('%'')
			file.put_character (a_constant.value)
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_c2_character_constant (a_constant: ET_C2_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			file.put_character ('%'')
			file.put_character ('%%')
			inspect a_constant.value
			when '%A' then
				file.put_character ('A')
			when '%B' then
				file.put_character ('B')
			when '%C' then
				file.put_character ('C')
			when '%D' then
				file.put_character ('D')
			when '%F' then
				file.put_character ('F')
			when '%H' then
				file.put_character ('H')
			when '%L' then
				file.put_character ('L')
			when '%N' then
				file.put_character ('N')
			when '%Q' then
				file.put_character ('Q')
			when '%R' then
				file.put_character ('R')
			when '%S' then
				file.put_character ('S')
			when '%T' then
				file.put_character ('T')
			when '%U' then
				file.put_character ('U')
			when '%V' then
				file.put_character ('V')
			when '%%' then
				file.put_character ('%%')
			when '%'' then
				file.put_character ('%'')
			when '%"' then
				file.put_character ('%"')
			when '%(' then
				file.put_character ('(')
			when '%)' then
				file.put_character (')')
			when '%<' then
				file.put_character ('<')
			when '%>' then
				file.put_character ('>')
			end
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_c3_character_constant (a_constant: ET_C3_CHARACTER_CONSTANT) is
			-- Process `a_constant'.
		do
			file.put_character ('%'')
			file.put_character ('%%')
			file.put_character ('/')
			file.put_string (a_constant.literal)
			file.put_character ('/')
			file.put_character ('%'')
			process_break (a_constant.break)
		end

	process_call_agent (an_expression: ET_CALL_AGENT) is
			-- Process `an_expression'.
		do
			an_expression.agent_keyword.process (Current)
		end

	process_call_expression (an_expression: ET_CALL_EXPRESSION) is
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_expression.name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_call_instruction (an_instruction: ET_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_instruction.name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_check_instruction (an_instruction: ET_CHECK_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			i, nb: INTEGER
		do
			an_instruction.check_keyword.process (Current)
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.item (i).process (Current)
				i := i + 1
			end
			an_instruction.end_keyword.process (Current)
		end

	process_choice_comma (a_choice: ET_CHOICE_COMMA) is
			-- Process `a_choice'.
		do
			a_choice.choice.process (Current)
			file.put_character (',')
			process_break (a_choice.comma.break)
		end

	process_choice_list (a_list: ET_CHOICE_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_choice_range (a_choice: ET_CHOICE_RANGE) is
			-- Process `a_choice'.
		do
			a_choice.lower.process (Current)
			file.put_string ("..")
			process_break (a_choice.dotdot.break)
			a_choice.upper.process (Current)
		end

	process_class (a_class: ET_CLASS) is
			-- Process `a_class'.
		local
			an_indexing: ET_INDEXINGS
			a_class_mark: ET_CLASS_MARK
			a_generic_parameters: ET_FORMAL_GENERIC_PARAMETERS
			an_obsolete_message: ET_OBSOLETE
			a_parents: ET_PARENTS
			a_creators: ET_CREATORS
			a_feature_clauses: ET_FEATURE_CLAUSES
			an_invariants: ET_INVARIANTS
		do
			process_break (a_class.leading_break)
			an_indexing := a_class.first_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			a_class_mark := a_class.class_mark
			if a_class_mark /= Void then
				a_class_mark.process (Current)
			end
			a_class.class_keyword.process (Current)
			a_class.name.process (Current)
			a_generic_parameters := a_class.generic_parameters
			if a_generic_parameters /= Void then
				a_generic_parameters.process (Current)
			end
			an_obsolete_message := a_class.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_parents := a_class.parents
			if a_parents /= Void then
				a_parents.process (Current)
			end
			a_creators := a_class.creators
			if a_creators /= Void then
				a_creators.process (Current)
			end
			a_feature_clauses := a_class.feature_clauses
			if a_feature_clauses /= Void then
				a_feature_clauses.process (Current)
			end
			an_invariants := a_class.invariants
			if an_invariants /= Void then
				an_invariants.process (Current)
			end
			an_indexing := a_class.second_indexing
			if an_indexing /= Void then
				an_indexing.process (Current)
			end
			a_class.end_keyword.process (Current)
		end

	process_class_name_comma (a_name: ET_CLASS_NAME_COMMA) is
			-- Process `a_name'.
		do
			a_name.class_name.process (Current)
			file.put_character (',')
			process_break (a_name.comma.break)
		end

	process_class_type (a_type: ET_CLASS_TYPE) is
			-- Process `a_type'.
		local
			a_type_mark: ET_TYPE_MARK
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_type.class_name.process (Current)
		end

	process_clients (a_list: ET_CLIENTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('{')
			process_break (a_list.left_brace.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character ('}')
			process_break (a_list.right_brace.break)
		end

	process_colon_formal_argument (an_argument: ET_COLON_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
			an_argument.declared_type.process (Current)
		end

	process_colon_local_variable (a_local: ET_COLON_LOCAL_VARIABLE) is
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
			a_local.declared_type.process (Current)
		end

	process_colon_type (a_type: ET_COLON_TYPE) is
			-- Process `a_type'.
		do
			file.put_character (':')
			process_break (a_type.colon.break)
			a_type.declared_type.process (Current)
		end

	process_comma_formal_argument (an_argument: ET_COMMA_FORMAL_ARGUMENT) is
			-- Process `an_argument'.
		do
			an_argument.name_item.process (Current)
		end

	process_comma_local_variable (a_local: ET_COMMA_LOCAL_VARIABLE) is
			-- Process `a_local'.
		do
			a_local.name_item.process (Current)
		end

	process_compound (a_list: ET_COMPOUND) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_constant_attribute (a_feature: ET_CONSTANT_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			a_feature.constant.process (Current)
		end

	process_constrained_formal_generic_parameter (a_parameter: ET_CONSTRAINED_FORMAL_GENERIC_PARAMETER) is
			-- Process `a_parameter'.
		local
			a_creation_procedures: ET_CONSTRAINT_CREATOR
		do
			a_parameter.name.process (Current)
			file.put_string ("->")
			process_break (a_parameter.arrow_symbol.break)
			a_parameter.constraint.process (Current)
			a_creation_procedures := a_parameter.creation_procedures
			if a_creation_procedures /= Void then
				a_creation_procedures.process (Current)
			end
		end

	process_constraint_creator (a_list: ET_CONSTRAINT_CREATOR) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.create_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			a_list.end_keyword.process (Current)
		end

	process_create_expression (an_expression: ET_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.create_keyword.process (Current)
			file.put_character ('{')
			process_break (an_expression.left_brace.break)
			an_expression.type.process (Current)
			file.put_character ('}')
			process_break (an_expression.right_brace.break)
		end

	process_create_instruction (an_instruction: ET_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			an_instruction.create_keyword.process (Current)
			an_instruction.target.process (Current)
		end

	process_creator (a_list: ET_CREATOR) is
			-- Process `a_list'.
		local
			a_clients: ET_CLIENTS
			i, nb: INTEGER
		do
			a_list.creation_keyword.process (Current)
			a_clients := a_list.clients_clause
			if a_clients /= Void then
				a_clients.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_creators (a_list: ET_CREATORS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_current (an_expression: ET_CURRENT) is
			-- Process `an_expression'.
		do
			process_token (an_expression)
		end

	process_current_address (an_expression: ET_CURRENT_ADDRESS) is
			-- Process `an_expression'.
		do
			file.put_character ('$')
			process_break (an_expression.dollar.break)
			an_expression.current_entity.process (Current)
		end

	process_debug_instruction (an_instruction: ET_DEBUG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			a_keys: ET_DEBUG_KEYS
			i, nb: INTEGER
		do
			an_instruction.debug_keyword.process (Current)
			a_keys := an_instruction.keys
			if a_keys /= Void then
				a_keys.process (Current)
			end
			nb := an_instruction.count
			from i := 1 until i > nb loop
				an_instruction.item (i).process (Current)
				i := i + 1
			end
			an_instruction.end_keyword.process (Current)
		end

	process_debug_keys (a_list: ET_DEBUG_KEYS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('(')
			process_break (a_list.left_parenthesis.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (')')
			process_break (a_list.right_parenthesis.break)
		end

	process_deferred_function (a_feature: ET_DEFERRED_FUNCTION) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_deferred_keyword (a_keyword: ET_DEFERRED_KEYWORD) is
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_deferred_procedure (a_feature: ET_DEFERRED_PROCEDURE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.deferred_keyword.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_do_function (a_feature: ET_DO_FUNCTION) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLES
			a_postconditions: ET_POSTCONDITIONS
			a_rescue_clause: ET_COMPOUND
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_feature.compound.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_rescue_clause := a_feature.rescue_clause
			if a_rescue_clause /= Void then
				a_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_do_procedure (a_feature: ET_DO_PROCEDURE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLES
			a_postconditions: ET_POSTCONDITIONS
			a_rescue_clause: ET_COMPOUND
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_feature.compound.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_rescue_clause := a_feature.rescue_clause
			if a_rescue_clause /= Void then
				a_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_elseif_part (an_elseif_part: ET_ELSEIF_PART) is
			-- Process `an_elseif_part'.
		do
			an_elseif_part.elseif_keyword.process (Current)
			an_elseif_part.expression.process (Current)
			an_elseif_part.then_compound.process (Current)
		end

	process_elseif_part_list (a_list: ET_ELSEIF_PART_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_equal_symbol (a_symbol: ET_EQUAL_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_character ('=')
			process_break (a_symbol.break)
		end

	process_equality_expression (an_expression: ET_EQUALITY_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.operator.process (Current)
			an_expression.right.process (Current)
		end

	process_expanded_keyword (a_keyword: ET_EXPANDED_KEYWORD) is
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_exports (a_list: ET_EXPORTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.export_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_expression_address (an_expression: ET_EXPRESSION_ADDRESS) is
			-- Process `an_expression'.
		do
			file.put_character ('$')
			process_break (an_expression.dollar.break)
			an_expression.expression.process (Current)
		end

	process_expression_comma (an_expression: ET_EXPRESSION_COMMA) is
			-- Process `an_expression'.
		do
			an_expression.expression.process (Current)
			file.put_character (',')
			process_break (an_expression.comma.break)
		end

	process_expression_list (a_list: ET_EXPRESSION_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('(')
			process_break (a_list.left_symbol.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (')')
			process_break (a_list.right_symbol.break)
		end

	process_expression_variant (a_variant: ET_EXPRESSION_VARIANT) is
			-- Process `a_variant'.
		do
			a_variant.variant_keyword.process (Current)
			a_variant.expression.process (Current)
		end

	process_external_function (a_feature: ET_EXTERNAL_FUNCTION) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_external_procedure (a_feature: ET_EXTERNAL_PROCEDURE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			an_alias_clause: ET_EXTERNAL_ALIAS
			a_postconditions: ET_POSTCONDITIONS
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_feature.language.process (Current)
			an_alias_clause := a_feature.alias_clause
			if an_alias_clause /= Void then
				an_alias_clause.process (Current)
			end
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_false_constant (a_constant: ET_FALSE_CONSTANT) is
			-- Process `a_constant'.
		do
			process_token (a_constant)
		end

	process_feature_address (an_expression: ET_FEATURE_ADDRESS) is
			-- Process `an_expression'.
		do
			file.put_character ('$')
			process_break (an_expression.dollar.break)
			an_expression.name.process (Current)
		end

	process_feature_clause (a_list: ET_FEATURE_CLAUSE) is
			-- Process `a_list'.
		local
			a_clients: ET_CLIENTS
			i, nb: INTEGER
		do
			a_list.feature_keyword.process (Current)
			a_clients := a_list.clients_clause
			if a_clients /= Void then
				a_clients.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_feature_clauses (a_list: ET_FEATURE_CLAUSES) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_feature_export (an_export: ET_FEATURE_EXPORT) is
			-- Process `an_export'.
		local
			i, nb: INTEGER
		do
			an_export.clients_clause.process (Current)
			nb := an_export.count
			from i := 1 until i > nb loop
				an_export.item (i).process (Current)
				i := i + 1
			end
		end

	process_feature_name_comma (a_name: ET_FEATURE_NAME_COMMA) is
			-- Process `a_name'.
		do
			a_name.feature_name.process (Current)
			file.put_character (',')
			process_break (a_name.comma.break)
		end

	process_feature_semicolon (a_feature: ET_FEATURE_SEMICOLON) is
			-- Process `a_feature'.
		do
			a_feature.feature_item.process (Current)
			file.put_character (';')
			process_break (a_feature.semicolon.break)
		end

	process_formal_argument_semicolon (an_argument: ET_FORMAL_ARGUMENT_SEMICOLON) is
			-- Process `an_argument'.
		do
			an_argument.formal_argument.process (Current)
			file.put_character (';')
			process_break (an_argument.semicolon.break)
		end

	process_formal_arguments (a_list: ET_FORMAL_ARGUMENTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('(')
			process_break (a_list.left_parenthesis.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (')')
			process_break (a_list.right_parenthesis.break)
		end

	process_formal_generic_parameter (a_parameter: ET_FORMAL_GENERIC_PARAMETER) is
			-- Process `a_parameter'.
		do
			a_parameter.name.process (Current)
		end

	process_formal_generic_parameter_comma (a_parameter: ET_FORMAL_GENERIC_PARAMETER_COMMA) is
			-- Process `a_parameter'.
		do
			a_parameter.formal_generic_parameter.process (Current)
			file.put_character (',')
			process_break (a_parameter.comma.break)
		end

	process_formal_generic_parameters (a_list: ET_FORMAL_GENERIC_PARAMETERS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			file.put_character ('[')
			process_break (a_list.left_bracket.break)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
			file.put_character (']')
			process_break (a_list.right_bracket.break)
		end

	process_formal_generic_type (a_type: ET_FORMAL_GENERIC_TYPE) is
			-- Process `a_type'.
		local
			a_type_mark: ET_TYPE_MARK
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_type.name.process (Current)
		end

	process_free_operator (an_operator: ET_FREE_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_generic_class_type (a_type: ET_GENERIC_CLASS_TYPE) is
			-- Process `a_type'.
		do
			process_class_type (a_type)
			a_type.generic_parameters.process (Current)
		end

	process_generic_named_type (a_type: ET_GENERIC_NAMED_TYPE) is
			-- Process `a_type'.
		do
			process_named_type (a_type)
			a_type.generic_parameters.process (Current)
		end

	process_hexadecimal_integer_constant (a_constant: ET_HEXADECIMAL_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SIGN_SYMBOL
		do
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_identifier (an_identifier: ET_IDENTIFIER) is
			-- Process `an_identifier'.
		do
			process_token (an_identifier)
		end

	process_identifier_colon (an_identifier: ET_IDENTIFIER_COLON) is
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			file.put_character (':')
			process_break (an_identifier.colon.break)
		end

	process_identifier_comma (an_identifier: ET_IDENTIFIER_COMMA) is
			-- Process `an_identifier'.
		do
			an_identifier.identifier.process (Current)
			file.put_character (',')
			process_break (an_identifier.comma.break)
		end

	process_if_instruction (an_instruction: ET_IF_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_elseif_parts: ET_ELSEIF_PART_LIST
			an_else_compound: ET_COMPOUND
		do
			an_instruction.if_keyword.process (Current)
			an_instruction.expression.process (Current)
			an_instruction.then_compound.process (Current)
			an_elseif_parts := an_instruction.elseif_parts
			if an_elseif_parts /= Void then
				an_elseif_parts.process (Current)
			end
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				an_else_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_indexing (an_indexing: ET_INDEXING) is
			-- Process `an_indexing'.
		do
			an_indexing.terms.process (Current)
		end

	process_indexing_semicolon (an_indexing: ET_INDEXING_SEMICOLON) is
			-- Process `an_indexing'.
		do
			an_indexing.indexing_item.process (Current)
			file.put_character (';')
			process_break (an_indexing.semicolon.break)
		end

	process_indexing_term_comma (an_indexing_term: ET_INDEXING_TERM_COMMA) is
			-- Process `an_indexing_term'.
		do
			an_indexing_term.indexing_term.process (Current)
			file.put_character (',')
			process_break (an_indexing_term.comma.break)
		end

	process_indexing_terms (a_list: ET_INDEXING_TERMS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_indexings (a_list: ET_INDEXINGS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.indexing_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_infix_and_name (a_name: ET_INFIX_AND_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_and_operator (an_operator: ET_INFIX_AND_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_infix_and_then_name (a_name: ET_INFIX_AND_THEN_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_and_then_operator (an_operator: ET_INFIX_AND_THEN_OPERATOR) is
			-- Process `an_operator'.
		do
			an_operator.and_keyword.process (Current)
			an_operator.then_keyword.process (Current)
		end

	process_infix_div_name (a_name: ET_INFIX_DIV_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_div_operator (an_operator: ET_INFIX_DIV_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_string ("//")
			process_break (an_operator.break)
		end

	process_infix_divide_name (a_name: ET_INFIX_DIVIDE_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_divide_operator (an_operator: ET_INFIX_DIVIDE_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('/')
			process_break (an_operator.break)
		end

	process_infix_expression (an_expression: ET_INFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.left.process (Current)
			an_expression.name.process (Current)
			an_expression.right.process (Current)
		end

	process_infix_free_name (a_name: ET_INFIX_FREE_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_free_operator (an_operator: ET_INFIX_FREE_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_infix_ge_name (a_name: ET_INFIX_GE_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_ge_operator (an_operator: ET_INFIX_GE_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_string (">=")
			process_break (an_operator.break)
		end

	process_infix_gt_name (a_name: ET_INFIX_GT_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_gt_operator (an_operator: ET_INFIX_GT_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('>')
			process_break (an_operator.break)
		end

	process_infix_implies_name (a_name: ET_INFIX_IMPLIES_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_implies_operator (an_operator: ET_INFIX_IMPLIES_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_infix_le_name (a_name: ET_INFIX_LE_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_le_operator (an_operator: ET_INFIX_LE_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_string ("<=")
			process_break (an_operator.break)
		end

	process_infix_lt_name (a_name: ET_INFIX_LT_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_lt_operator (an_operator: ET_INFIX_LT_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('<')
			process_break (an_operator.break)
		end

	process_infix_minus_name (a_name: ET_INFIX_MINUS_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_minus_operator (an_operator: ET_INFIX_MINUS_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('-')
			process_break (an_operator.break)
		end

	process_infix_mod_name (a_name: ET_INFIX_MOD_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_mod_operator (an_operator: ET_INFIX_MOD_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_string ("\\")
			process_break (an_operator.break)
		end

	process_infix_name (a_name: ET_INFIX_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			a_name.infix_keyword.process (Current)
			a_name.operator_name.process (Current)
		end

	process_infix_or_else_name (a_name: ET_INFIX_OR_ELSE_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_or_else_operator (an_operator: ET_INFIX_OR_ELSE_OPERATOR) is
			-- Process `an_operator'.
		do
			an_operator.or_keyword.process (Current)
			an_operator.else_keyword.process (Current)
		end

	process_infix_or_name (a_name: ET_INFIX_OR_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_or_operator (an_operator: ET_INFIX_OR_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_infix_plus_name (a_name: ET_INFIX_PLUS_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_plus_operator (an_operator: ET_INFIX_PLUS_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('+')
			process_break (an_operator.break)
		end

	process_infix_power_name (a_name: ET_INFIX_POWER_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_power_operator (an_operator: ET_INFIX_POWER_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('^')
			process_break (an_operator.break)
		end

	process_infix_times_name (a_name: ET_INFIX_TIMES_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_times_operator (an_operator: ET_INFIX_TIMES_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('*')
			process_break (an_operator.break)
		end

	process_infix_xor_name (a_name: ET_INFIX_XOR_NAME) is
			-- Process `a_name'.
		do
			process_infix_name (a_name)
		end

	process_infix_xor_operator (an_operator: ET_INFIX_XOR_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_inspect_instruction (an_instruction: ET_INSPECT_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			a_when_parts: ET_WHEN_PART_LIST
			an_else_compound: ET_COMPOUND
		do
			an_instruction.inspect_keyword.process (Current)
			an_instruction.expression.process (Current)
			a_when_parts := an_instruction.when_parts
			if a_when_parts /= Void then
				a_when_parts.process (Current)
			end
			an_else_compound := an_instruction.else_compound
			if an_else_compound /= Void then
				an_else_compound.process (Current)
			end
			an_instruction.end_keyword.process (Current)
		end

	process_invariants (a_list: ET_INVARIANTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.invariant_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_keyword (a_keyword: ET_KEYWORD) is
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_keyword_feature_name_list (a_list: ET_KEYWORD_FEATURE_NAME_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_keyword_manifest_string (a_string: ET_KEYWORD_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			a_string.keyword.process (Current)
			a_string.manifest_string.process (Current)
		end

	process_like_argument (a_type: ET_LIKE_ARGUMENT) is
			-- Process `a_type'.
		do
			a_type.like_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_like_current (a_type: ET_LIKE_CURRENT) is
			-- Process `a_type'.
		do
			a_type.like_keyword.process (Current)
			a_type.current_keyword.process (Current)
		end

	process_like_feature (a_type: ET_LIKE_FEATURE) is
			-- Process `a_type'.
		do
			a_type.like_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_like_identifier (a_type: ET_LIKE_IDENTIFIER) is
			-- Process `a_type'.
		do
			a_type.like_keyword.process (Current)
			a_type.name.process (Current)
		end

	process_local_variable_semicolon (a_local: ET_LOCAL_VARIABLE_SEMICOLON) is
			-- Process `an_argument'.
		do
			a_local.local_variable.process (Current)
			file.put_character (';')
			process_break (a_local.semicolon.break)
		end

	process_local_variables (a_list: ET_LOCAL_VARIABLES) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.local_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_loop_instruction (an_instruction: ET_LOOP_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_invariant_part: ET_INVARIANTS
			a_variant_part: ET_VARIANT
		do
			an_instruction.from_compound.process (Current)
			an_invariant_part := an_instruction.invariant_part
			if an_invariant_part /= Void then
				an_invariant_part.process (Current)
			end
			a_variant_part := an_instruction.variant_part
			if a_variant_part /= Void then
				a_variant_part.process (Current)
			end
			an_instruction.until_keyword.process (Current)
			an_instruction.until_expression.process (Current)
			an_instruction.loop_compound.process (Current)
			an_instruction.end_keyword.process (Current)
		end

	process_manifest_array (an_expression: ET_MANIFEST_ARRAY) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			file.put_string ("<<")
			process_break (an_expression.left_symbol.break)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			file.put_string (">>")
			process_break (an_expression.right_symbol.break)
		end

	process_manifest_string_comma (a_string: ET_MANIFEST_STRING_COMMA) is
			-- Process `a_string'.
		do
			a_string.manifest_string.process (Current)
			file.put_character (',')
			process_break (a_string.comma.break)
		end

	process_manifest_tuple (an_expression: ET_MANIFEST_TUPLE) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			file.put_character ('[')
			process_break (an_expression.left_symbol.break)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			file.put_character (']')
			process_break (an_expression.right_symbol.break)
		end

	process_minus_symbol (a_symbol: ET_MINUS_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_character ('-')
			process_break (a_symbol.break)
		end

	process_named_type (a_type: ET_NAMED_TYPE) is
			-- Process `a_type'.
		local
			a_type_mark: ET_TYPE_MARK
		do
			a_type_mark := a_type.type_mark
			if a_type_mark /= Void then
				a_type_mark.process (Current)
			end
			a_type.name.process (Current)
		end

	process_none_clients (a_list: ET_NONE_CLIENTS) is
			-- Process `a_list'.
		do
			process_clients (a_list)
		end

	process_not_equal_symbol (a_symbol: ET_NOT_EQUAL_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_string ("/=")
			process_break (a_symbol.break)
		end

	process_obsolete (an_obsolete: ET_OBSOLETE) is
			-- Process `an_obsolete'.
		do
			an_obsolete.obsolete_keyword.process (Current)
			an_obsolete.message.process (Current)
		end

	process_old_expression (an_expression: ET_OLD_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.old_keyword.process (Current)
			an_expression.expression.process (Current)
		end

	process_once_function (a_feature: ET_ONCE_FUNCTION) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLES
			a_postconditions: ET_POSTCONDITIONS
			a_rescue_clause: ET_COMPOUND
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_feature.compound.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_rescue_clause := a_feature.rescue_clause
			if a_rescue_clause /= Void then
				a_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_once_manifest_string (an_expression: ET_ONCE_MANIFEST_STRING) is
			-- Process `an_expression'.
		do
			an_expression.once_keyword.process (Current)
			an_expression.manifest_string.process (Current)
		end

	process_once_procedure (a_feature: ET_ONCE_PROCEDURE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
			an_arguments: ET_FORMAL_ARGUMENTS
			an_obsolete_message: ET_OBSOLETE
			a_preconditions: ET_PRECONDITIONS
			a_locals: ET_LOCAL_VARIABLES
			a_postconditions: ET_POSTCONDITIONS
			a_rescue_clause: ET_COMPOUND
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			an_arguments := a_feature.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
			a_feature.is_keyword.process (Current)
			an_obsolete_message := a_feature.obsolete_message
			if an_obsolete_message /= Void then
				an_obsolete_message.process (Current)
			end
			a_preconditions := a_feature.preconditions
			if a_preconditions /= Void then
				a_preconditions.process (Current)
			end
			a_locals := a_feature.locals
			if a_locals /= Void then
				a_locals.process (Current)
			end
			a_feature.compound.process (Current)
			a_postconditions := a_feature.postconditions
			if a_postconditions /= Void then
				a_postconditions.process (Current)
			end
			a_rescue_clause := a_feature.rescue_clause
			if a_rescue_clause /= Void then
				a_rescue_clause.process (Current)
			end
			a_feature.end_keyword.process (Current)
		end

	process_parent (a_parent: ET_PARENT) is
			-- Process `a_parent'.
		local
			a_renames: ET_RENAMES
			an_exports: ET_EXPORTS
			an_undefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_redefines: ET_KEYWORD_FEATURE_NAME_LIST
			a_selects: ET_KEYWORD_FEATURE_NAME_LIST
			an_end_keyword: ET_TOKEN
		do
			a_parent.type.process (Current)
			a_renames := a_parent.renames
			if a_renames /= Void then
				a_renames.process (Current)
			end
			an_exports := a_parent.exports
			if an_exports /= Void then
				an_exports.process (Current)
			end
			an_undefines := a_parent.undefines
			if an_undefines /= Void then
				an_undefines.process (Current)
			end
			a_redefines := a_parent.redefines
			if a_redefines /= Void then
				a_redefines.process (Current)
			end
			a_selects := a_parent.selects
			if a_selects /= Void then
				a_selects.process (Current)
			end
			an_end_keyword := a_parent.end_keyword
			if an_end_keyword /= Void then
				an_end_keyword.process (Current)
			end
		end

	process_parent_semicolon (a_parent: ET_PARENT_SEMICOLON) is
			-- Process `a_parent'.
		do
			a_parent.parent.process (Current)
			file.put_character (';')
			process_break (a_parent.semicolon.break)
		end

	process_parenthesized_expression (an_expression: ET_PARENTHESIZED_EXPRESSION) is
			-- Process `an_expression'.
		do
			file.put_character ('(')
			process_break (an_expression.left_parenthesis.break)
			an_expression.expression.process (Current)
			file.put_character (')')
			process_break (an_expression.right_parenthesis.break)
		end

	process_parents (a_list: ET_PARENTS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.inherit_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_plus_symbol (a_symbol: ET_PLUS_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_character ('+')
			process_break (a_symbol.break)
		end

	process_postconditions (a_list: ET_POSTCONDITIONS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			a_then_keyword: ET_TOKEN
		do
			a_list.ensure_keyword.process (Current)
			a_then_keyword := a_list.then_keyword
			if a_then_keyword /= Void then
				a_then_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_preconditions (a_list: ET_PRECONDITIONS) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
			an_else_keyword: ET_TOKEN
		do
			a_list.require_keyword.process (Current)
			an_else_keyword := a_list.else_keyword
			if an_else_keyword /= Void then
				an_else_keyword.process (Current)
			end
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_precursor_expression (an_expression: ET_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_expression.precursor_keyword.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_precursor_instruction (an_instruction: ET_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_instruction.precursor_keyword.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_prefix_expression (an_expression: ET_PREFIX_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.name.process (Current)
			an_expression.expression.process (Current)
		end

	process_prefix_free_name (a_name: ET_PREFIX_FREE_NAME) is
			-- Process `a_name'.
		do
			process_prefix_name (a_name)
		end

	process_prefix_free_operator (an_operator: ET_PREFIX_FREE_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_prefix_minus_name (a_name: ET_PREFIX_MINUS_NAME) is
			-- Process `a_name'.
		do
			process_prefix_name (a_name)
		end

	process_prefix_minus_operator (an_operator: ET_PREFIX_MINUS_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('-')
			process_break (an_operator.break)
		end

	process_prefix_name (a_name: ET_PREFIX_NAME) is
			-- Process `a_name'.
		require
			a_name_not_void: a_name /= Void
		do
			a_name.prefix_keyword.process (Current)
			a_name.operator_name.process (Current)
		end

	process_prefix_not_name (a_name: ET_PREFIX_NOT_NAME) is
			-- Process `a_name'.
		do
			process_prefix_name (a_name)
		end

	process_prefix_not_operator (an_operator: ET_PREFIX_NOT_OPERATOR) is
			-- Process `an_operator'.
		do
			process_token (an_operator)
		end

	process_prefix_plus_name (a_name: ET_PREFIX_PLUS_NAME) is
			-- Process `a_name'.
		do
			process_prefix_name (a_name)
		end

	process_prefix_plus_operator (an_operator: ET_PREFIX_PLUS_OPERATOR) is
			-- Process `an_operator'.
		do
			file.put_character ('+')
			process_break (an_operator.break)
		end

	process_qualified_bang_instruction (an_instruction: ET_QUALIFIED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			file.put_string ("!!")
			process_break (an_instruction.bangbang.break)
			an_instruction.target.process (Current)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			an_instruction.procedure_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_call_expression (an_expression: ET_QUALIFIED_CALL_EXPRESSION) is
			-- Process `an_expression'.
		do
			an_expression.target.process (Current)
			file.put_character ('.')
			process_break (an_expression.dot.break)
			process_call_expression (an_expression)
		end

	process_qualified_call_instruction (an_instruction: ET_QUALIFIED_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			an_instruction.target.process (Current)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			process_call_instruction (an_instruction)
		end

	process_qualified_create_expression (an_expression: ET_QUALIFIED_CREATE_EXPRESSION) is
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_expression.create_keyword.process (Current)
			file.put_character ('{')
			process_break (an_expression.left_brace.break)
			an_expression.type.process (Current)
			file.put_character ('}')
			process_break (an_expression.right_brace.break)
			file.put_character ('.')
			process_break (an_expression.dot.break)
			an_expression.procedure_name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_create_instruction (an_instruction: ET_QUALIFIED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_instruction.create_keyword.process (Current)
			an_instruction.target.process (Current)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			an_instruction.procedure_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_precursor_expression (an_expression: ET_QUALIFIED_PRECURSOR_EXPRESSION) is
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			if not an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			file.put_character ('{')
			process_break (an_expression.left_brace.break)
			an_expression.parent.process (Current)
			file.put_character ('}')
			process_break (an_expression.right_brace.break)
			if an_expression.is_parent_prefixed then
				an_expression.precursor_keyword.process (Current)
			end
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_precursor_instruction (an_instruction: ET_QUALIFIED_PRECURSOR_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			if not an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			file.put_character ('{')
			process_break (an_instruction.left_brace.break)
			an_instruction.parent.process (Current)
			file.put_character ('}')
			process_break (an_instruction.right_brace.break)
			if an_instruction.is_parent_prefixed then
				an_instruction.precursor_keyword.process (Current)
			end
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_typed_bang_instruction (an_instruction: ET_QUALIFIED_TYPED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			file.put_character ('!')
			process_break (an_instruction.left_bang.break)
			an_instruction.type.process (Current)
			file.put_character ('!')
			process_break (an_instruction.right_bang.break)
			an_instruction.target.process (Current)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			an_instruction.procedure_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_qualified_typed_create_instruction (an_instruction: ET_QUALIFIED_TYPED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_instruction.create_keyword.process (Current)
			file.put_character ('{')
			process_break (an_instruction.left_brace.break)
			an_instruction.type.process (Current)
			file.put_character ('}')
			process_break (an_instruction.right_brace.break)
			an_instruction.target.process (Current)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			an_instruction.procedure_name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_reference_keyword (a_keyword: ET_REFERENCE_KEYWORD) is
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_regular_integer_constant (a_constant: ET_REGULAR_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SIGN_SYMBOL
		do
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_regular_manifest_string (a_string: ET_REGULAR_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_regular_real_constant (a_constant: ET_REGULAR_REAL_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SIGN_SYMBOL
		do
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_rename (a_rename: ET_RENAME) is
			-- Process `a_rename'.
		do
			a_rename.old_name.process (Current)
			a_rename.as_keyword.process (Current)
			a_rename.new_name.process (Current)
		end

	process_rename_comma (a_rename: ET_RENAME_COMMA) is
			-- Process `a_rename'.
		do
			process_rename (a_rename)
			file.put_character (',')
			process_break (a_rename.comma.break)
		end

	process_renames (a_list: ET_RENAMES) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			a_list.rename_keyword.process (Current)
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

	process_result (an_expression: ET_RESULT) is
			-- Process `an_expression'.
		do
			process_token (an_expression)
		end

	process_result_address (an_expression: ET_RESULT_ADDRESS) is
			-- Process `an_expression'.
		do
			file.put_character ('$')
			process_break (an_expression.dollar.break)
			an_expression.result_entity.process (Current)
		end

	process_retry_instruction (an_instruction: ET_RETRY_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			process_token (an_instruction)
		end

	process_semicolon_symbol (a_symbol: ET_SEMICOLON_SYMBOL) is
			-- Process `a_symbol'.
		do
			file.put_character (';')
			process_break (a_symbol.break)
		end

	process_separate_keyword (a_keyword: ET_SEPARATE_KEYWORD) is
			-- Process `a_keyword'.
		do
			process_token (a_keyword)
		end

	process_special_manifest_string (a_string: ET_SPECIAL_MANIFEST_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.literal)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_static_call_expression (an_expression: ET_STATIC_CALL_EXPRESSION) is
			-- Process `an_expression'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_expression.feature_keyword.process (Current)
			file.put_character ('{')
			process_break (an_expression.left_brace.break)
			an_expression.type.process (Current)
			file.put_character ('}')
			process_break (an_expression.right_brace.break)
			file.put_character ('.')
			process_break (an_expression.dot.break)
			an_expression.name.process (Current)
			an_arguments := an_expression.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_static_call_instruction (an_instruction: ET_STATIC_CALL_INSTRUCTION) is
			-- Process `an_instruction'.
		local
			an_arguments: ET_ACTUAL_ARGUMENTS
		do
			an_instruction.feature_keyword.process (Current)
			file.put_character ('{')
			process_break (an_instruction.left_brace.break)
			an_instruction.type.process (Current)
			file.put_character ('}')
			process_break (an_instruction.right_brace.break)
			file.put_character ('.')
			process_break (an_instruction.dot.break)
			an_instruction.name.process (Current)
			an_arguments := an_instruction.arguments
			if an_arguments /= Void then
				an_arguments.process (Current)
			end
		end

	process_strip_expression (an_expression: ET_STRIP_EXPRESSION) is
			-- Process `an_expression'.
		local
			i, nb: INTEGER
		do
			an_expression.strip_keyword.process (Current)
			file.put_character ('(')
			process_break (an_expression.left_parenthesis.break)
			nb := an_expression.count
			from i := 1 until i > nb loop
				an_expression.item (i).process (Current)
				i := i + 1
			end
			file.put_character (')')
			process_break (an_expression.right_parenthesis.break)
		end

	process_symbol (a_symbol: ET_SYMBOL) is
			-- Process `a_symbol'.
		do
			process_break (a_symbol.break)
		end

	process_tagged_assertion (an_assertion: ET_TAGGED_ASSERTION) is
			-- Process `an_assertion'.
		local
			an_expression: ET_EXPRESSION
		do
			an_assertion.tag.process (Current)
			an_expression := an_assertion.expression
			if an_expression /= Void then
				an_expression.process (Current)
			end
		end

	process_tagged_expression_variant (a_variant: ET_TAGGED_EXPRESSION_VARIANT) is
			-- Process `a_variant'.
		do
			a_variant.variant_keyword.process (Current)
			a_variant.tag.process (Current)
			a_variant.expression.process (Current)
		end

	process_tagged_indexing (an_indexing: ET_TAGGED_INDEXING) is
			-- Process `an_indexing'.
		do
			an_indexing.tag.process (Current)
			process_indexing (an_indexing)
		end

	process_token (a_token: ET_TOKEN) is
			-- Process `a_token'.
		do
			file.put_string (a_token.text)
			process_break (a_token.break)
		end

	process_true_constant (a_constant: ET_TRUE_CONSTANT) is
			-- Process `a_constant'.
		do
			process_token (a_constant)
		end

	process_type_comma (a_type: ET_TYPE_COMMA) is
			-- Process `a_type'.
		do
			a_type.type.process (Current)
			file.put_character (',')
			process_break (a_type.comma.break)
		end

	process_typed_bang_instruction (an_instruction: ET_TYPED_BANG_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			file.put_character ('!')
			process_break (an_instruction.left_bang.break)
			an_instruction.type.process (Current)
			file.put_character ('!')
			process_break (an_instruction.right_bang.break)
			an_instruction.target.process (Current)
		end

	process_typed_create_instruction (an_instruction: ET_TYPED_CREATE_INSTRUCTION) is
			-- Process `an_instruction'.
		do
			an_instruction.create_keyword.process (Current)
			file.put_character ('{')
			process_break (an_instruction.left_brace.break)
			an_instruction.type.process (Current)
			file.put_character ('}')
			process_break (an_instruction.right_brace.break)
			an_instruction.target.process (Current)
		end

	process_underscored_integer_constant (a_constant: ET_UNDERSCORED_INTEGER_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SIGN_SYMBOL
		do
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_underscored_real_constant (a_constant: ET_UNDERSCORED_REAL_CONSTANT) is
			-- Process `a_constant'.
		local
			a_sign: ET_SIGN_SYMBOL
		do
			a_sign := a_constant.sign
			if a_sign /= Void then
				a_sign.process (Current)
			end
			file.put_string (a_constant.literal)
			process_break (a_constant.break)
		end

	process_unique_attribute (a_feature: ET_UNIQUE_ATTRIBUTE) is
			-- Process `a_feature'.
		local
			a_frozen_keyword: ET_TOKEN
			a_synonym: ET_FEATURE
		do
			a_frozen_keyword := a_feature.frozen_keyword
			if a_frozen_keyword /= Void then
				a_frozen_keyword.process (Current)
			end
			a_feature.name_item.process (Current)
			from
				a_synonym := a_feature.synonym
			until
				a_synonym = Void
			loop
				a_frozen_keyword := a_synonym.frozen_keyword
				if a_frozen_keyword /= Void then
					a_frozen_keyword.process (Current)
				end
				a_synonym.name_item.process (Current)
				a_synonym := a_synonym.synonym
			end
			a_feature.declared_type.process (Current)
			a_feature.is_keyword.process (Current)
			a_feature.unique_keyword.process (Current)
		end

	process_variant (a_variant: ET_VARIANT) is
			-- Process `a_variant'.
		do
			a_variant.variant_keyword.process (Current)
		end

	process_verbatim_string (a_string: ET_VERBATIM_STRING) is
			-- Process `a_string'.
		do
			file.put_character ('%"')
			file.put_string (a_string.marker)
			file.put_character ('[')
			file.put_string (a_string.open_white_characters)
			file.put_string (a_string.literal)
			file.put_string (a_string.close_white_characters)
			file.put_character (']')
			file.put_string (a_string.marker)
			file.put_character ('%"')
			process_break (a_string.break)
		end

	process_when_part (a_when_part: ET_WHEN_PART) is
			-- Process `a_when_part'.
		local
			a_choices: ET_CHOICE_LIST
		do
			a_when_part.when_keyword.process (Current)
			a_choices := a_when_part.choices
			if a_choices /= Void then
				a_choices.process (Current)
			end
			a_when_part.then_compound.process (Current)
		end

	process_when_part_list (a_list: ET_WHEN_PART_LIST) is
			-- Process `a_list'.
		local
			i, nb: INTEGER
		do
			nb := a_list.count
			from i := 1 until i > nb loop
				a_list.item (i).process (Current)
				i := i + 1
			end
		end

invariant

	file_not_void: file /= Void
	file_is_open_write: file.is_open_write

end
