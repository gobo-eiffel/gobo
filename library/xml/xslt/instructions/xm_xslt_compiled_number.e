indexing

	description: "Objects that represent an xsl:number,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_NUMBER

inherit
	
	XM_XSLT_INSTRUCTION

	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_XPATH_NUMERIC_ROUTINES

	XM_XSLT_NUMBER_ROUTINES

	MA_DECIMAL_MATH

creation

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: XM_XPATH_EXPRESSION; a_level: INTEGER; a_count_pattern, a_from_pattern: XM_XSLT_PATTERN;
		a_value_expression, a_format, a_grouping_size, a_grouping_separator, a_letter_value, an_ordinal, a_language: XM_XPATH_EXPRESSION;
		a_formatter: XM_XSLT_NUMBER_FORMATTER;	a_numberer: XM_XSLT_NUMBERER; variables_in_patterns: BOOLEAN) is
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			language: a_language = Void implies a_numberer /= Void
			formatter: a_formatter = Void implies a_format /= Void
		do
			executable := an_executable
			select_expression := a_select_expression
			level := a_level
			count_pattern := a_count_pattern
			from_pattern := a_from_pattern
			value_expression := a_value_expression
			format := a_format
			grouping_size := a_grouping_size
			grouping_separator := a_grouping_separator
			letter_value := a_letter_value
			ordinal := an_ordinal
			language := a_language
			formatter := a_formatter
			numberer := a_numberer
			has_variables_in_patterns := variables_in_patterns

			if value_expression /= Void and then is_sub_type (value_expression.item_type, type_factory.any_atomic_type) then
				create {XM_XPATH_ATOMIZER_EXPRESSION} value_expression.make (value_expression)
			end
			instruction_name := "number"
			create children.make (0)
		ensure
			executable_set: executable = an_executable
			select_expression_set: select_expression = a_select_expression
			level_set: level = a_level
			count_pattern_set: count_pattern = a_count_pattern
			from_pattern_set: from_pattern = a_from_pattern
			value_expression_set: a_value_expression /= Void implies value_expression /= Void
			format_set: format = a_format
			grouping_size_set: grouping_size = a_grouping_size
			grouping_separator_set: grouping_separator = a_grouping_separator
			letter_value_set: letter_value = a_letter_value
			ordinal_set: ordinal = an_ordinal
			language_set: language = a_language
			formatter_set: formatter = a_formatter
			numberer_set: numberer = a_numberer
			has_variables_in_patterns_set: has_variables_in_patterns = variables_in_patterns
		end

feature -- Access
	
	instruction_name: STRING
			-- Name of instruction, for diagnostics

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			a_receiver: XM_XSLT_SEQUENCE_RECEIVER
			a_group_size: MA_DECIMAL
			a_group_separator, an_ordinal_value, a_letter: STRING
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_number_formatter: XM_XSLT_NUMBER_FORMATTER
		do
			transformer := a_context.transformer
			a_receiver := transformer.current_receiver
			last_tail_call := Void
			calculate_value (a_context)
			if not transformer.is_error then
				if grouping_size = Void then
					create a_group_size.make_zero
				else
					grouping_size.evaluate_as_string (a_context)
					if grouping_size.last_evaluated_string.is_error then
						report_fatal_error (Current, "grouping-size must be numeric", transformer)
					else
						create a_group_size.make_from_string (grouping_size.last_evaluated_string.string_value)
						if not a_group_size.is_integer then
							report_fatal_error (Current, "grouping-size must be an integer", transformer)
						end
					end
				end
			end
			if not transformer.is_error then
				a_group_separator := ""
				if grouping_separator /= Void then
					grouping_separator.evaluate_as_string (a_context)
					check
						grouping_serparator: not grouping_separator.last_evaluated_string.is_error
					end
					a_group_separator := grouping_separator.last_evaluated_string.string_value
					if a_group_separator.count > 1 then
						report_fatal_error (Current, "grouping-separator must evaluate to a single character", transformer)
					end
				end
				if ordinal /= Void then
					ordinal.evaluate_as_string (a_context)
					check
						ordinal: not ordinal.last_evaluated_string.is_error
					end
					an_ordinal_value := ordinal.last_evaluated_string.string_value
				else
					an_ordinal_value := ""
				end
				if integer_vector = Void and then format = Void and then a_group_size.is_zero and then language = Void then

				-- fast path for the simple case

					a_receiver.notify_characters (value.to_scientific_string, 0)
				else
					if numberer = Void then
						todo ("process_leaving_tail", True)
					end
					if letter_value = Void then
						a_letter := ""
					else
						letter_value.evaluate_as_string (a_context)
						if letter_value.last_evaluated_string.is_error or else
							not (STRING_.same_string (letter_value.last_evaluated_string.string_value, "alphabetic") or else
								  STRING_.same_string (letter_value.last_evaluated_string.string_value, "traditional")) then
							report_fatal_error (Current, "letter-value must be %"traditional%" or %"alphabetic%"", transformer)
						end
					end
				end
			end
			if not transformer.is_error then
				if integer_vector = Void then
					create integer_vector.make (1)
					create an_integer_value.make (value)
					integer_vector.put_last (an_integer_value)
				end
				if formatter = Void then
					format.evaluate_as_string (a_context)
					if format.last_evaluated_string.is_error then
						report_fatal_error (Current, "format must evaluate to a string", transformer)
					else
						create a_number_formatter.make (format.last_evaluated_string.string_value)
					end
				else
					a_number_formatter := formatter
				end
			end
			if not transformer.is_error then
				a_receiver.notify_characters (a_number_formatter.formatted_string (integer_vector, a_group_size, a_group_separator, a_letter, an_ordinal_value, numberer), 0)
			end
			last_tail_call := Void
		end

feature {NONE} -- Implementation
	
	select_expression: XM_XPATH_EXPRESSION
			-- Selected node

	level: INTEGER
			-- Level

	count_pattern: XM_XSLT_PATTERN
			-- Nodes which are to be counted 

	from_pattern: XM_XSLT_PATTERN
			-- Node from which counted is to be started

	value_expression: XM_XPATH_EXPRESSION
			-- Supplied value

	format: XM_XPATH_EXPRESSION
			-- Format for formatted number

	grouping_size, grouping_separator: XM_XPATH_EXPRESSION
			-- Grouping parameters

	letter_value: XM_XPATH_EXPRESSION
		-- Letter value

	ordinal: XM_XPATH_EXPRESSION
			-- Ordinal marker

	language: XM_XPATH_EXPRESSION
			-- Language

	formatter: XM_XSLT_NUMBER_FORMATTER
			-- Formatter

	numberer: XM_XSLT_NUMBERER
			-- Numberer

	has_variables_in_patterns: BOOLEAN
			-- Do any supplied patterns include variable references?


	-- The following are used to communicate between `process_leaving_tail' and it's sub-routines
	
	value: MA_DECIMAL
			-- Value of number

	integer_vector: DS_ARRAYED_LIST [XM_XPATH_INTEGER_VALUE]
			-- Sequence of integers to be used as place marker to be formatted

	transformer: XM_XSLT_TRANSFORMER
			-- Transformer

	calculate_value (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `value' and `vector'.
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			a_source: XM_XPATH_NODE
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			finished: BOOLEAN
		do
			create value.make_copy (minus_one)

			if value_expression /= Void then
				from
					a_sequence_iterator := value_expression.iterator (a_context); a_sequence_iterator.start
					create integer_vector.make_default
				until
					finished or else a_sequence_iterator.after
				loop
					an_atomic_value ?= a_sequence_iterator.item
					if an_atomic_value = Void then
						finished := True
					else
						an_integer_value ?= an_atomic_value
						if an_integer_value = Void then
							a_numeric_value ?= an_atomic_value
							if a_numeric_value = Void then
								a_numeric_value := item_to_double (an_atomic_value)
								if a_numeric_value.is_nan then
									report_fatal_error (Current, "Numbers to be formatted must be positive integers", transformer)
									finished := True
								end
							end
							if not finished then
								a_numeric_value := a_numeric_value.rounded_value
								an_integer_value ?= a_numeric_value.convert_to_type (type_factory.integer_type)
							end
						end
						if not finished and then an_integer_value.value.is_negative then
							report_fatal_error (Current, "Numbers to be formatted must be positive integers", transformer)								
						end
						if not finished then
							integer_vector.force_last (an_integer_value)
						end
					end
					a_sequence_iterator.forth
				end
			else
				if select_expression /= Void then
					select_expression.evaluate_item (a_context)
					a_source ?= select_expression.last_evaluated_item
				else
					a_source  ?= transformer.current_item
					if a_source = Void then
						report_recoverable_error (Current, "context item for xsl:number must be a node", transformer)
					end
				end
				if not transformer.is_error then
					if level = Simple_numbering then
						value := simple_number (a_source)
					else
						todo ("calculate_value", True)
					end
				end
			end
		ensure
			value_not_void: value /= Void
		end

	simple_number (a_node: XM_XPATH_NODE): MA_DECIMAL is
			-- Simple number of `a_node'
			-- This is defined as one plus the number of previous siblings
			--  of the same node type and name.
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			a_fingerprint: INTEGER
			a_node_test: XM_XPATH_NODE_TEST
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			finished: BOOLEAN
			a_previous_node: XM_XPATH_NODE
			a_memo: MA_DECIMAL
		do
			a_fingerprint := a_node.fingerprint
			if a_fingerprint = -1 then
				create {XM_XPATH_NODE_KIND_TEST} a_node_test.make (a_node.node_type)
			else
				create {XM_XPATH_NAME_TEST} a_node_test.make_same_type (a_node)
			end
			from
				an_iterator := a_node.new_axis_iterator_with_node_test (Preceding_sibling_axis, a_node_test)
				an_iterator.start
				create Result.make_one
			until
				finished or else an_iterator.after
			loop
				a_previous_node := an_iterator.item
				a_memo := transformer.remembered_number (a_previous_node)
				if not a_memo.is_zero then
					Result := Result + a_memo
					transformer.set_remembered_number (Result, a_node)
					finished := True
				else
					an_iterator.forth
					Result := Result + one
				end
				if not finished then
					transformer.set_remembered_number (Result, a_node)
				end
			end
		ensure
			strictly_positive_integer: Result /= Void and then Result.is_integer and then Result.is_positive
				and then not Result.is_zero
		end

invariant

	language: language = Void implies numberer /= Void
	formatter: formatter = Void implies format /= Void

end
	
