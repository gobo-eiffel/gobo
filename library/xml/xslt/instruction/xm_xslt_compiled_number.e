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
		redefine
			sub_expressions, compute_intrinsic_dependencies, item_type,
			compute_cardinality, promote
		end

	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_XPATH_NUMERIC_ROUTINES

	XM_XSLT_NUMBER_ROUTINES

	XM_XPATH_SHARED_NODE_KIND_TESTS

	MA_DECIMAL_CONSTANTS
		export {NONE} all end

create

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
			select_expression := a_select_expression;	if select_expression /= Void then adopt_child_expression (select_expression) end
			level := a_level
			count_pattern := a_count_pattern
			from_pattern := a_from_pattern
			value_expression := a_value_expression; if value_expression /= Void then adopt_child_expression (value_expression) end
			format := a_format; if format /= Void then adopt_child_expression (format) end
			grouping_size := a_grouping_size; if grouping_size /= Void then adopt_child_expression (grouping_size) end
			grouping_separator := a_grouping_separator; if grouping_separator /= Void then adopt_child_expression (grouping_separator) end
			letter_value := a_letter_value; if letter_value /= Void then adopt_child_expression (letter_value) end
			ordinal := an_ordinal; if ordinal /= Void then adopt_child_expression (ordinal) end
			language := a_language; if language /= Void then adopt_child_expression (language) end
			formatter := a_formatter
			numberer := a_numberer
			has_variables_in_patterns := variables_in_patterns

			if value_expression /= Void and then is_sub_type (value_expression.item_type, type_factory.any_atomic_type) then
				create {XM_XPATH_ATOMIZER_EXPRESSION} value_expression.make (value_expression, False)
			end
			compute_static_properties
			initialized := True
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
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, when known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION] is
			-- Immediate sub-expressions of `Current'
		do
			create Result.make (10)
			Result.set_equality_tester (expression_tester)
			if select_expression /= Void then Result.put_last (select_expression) end
			if value_expression /= Void then Result.put_last (value_expression) end
			if format /= Void then Result.put_last (format) end
			if grouping_size /= Void then Result.put_last (grouping_size) end
			if grouping_separator /= Void then Result.put_last (grouping_separator) end
			if letter_value /= Void then Result.put_last (letter_value) end
			if ordinal /= Void then Result.put_last (ordinal) end
			if language /= Void then Result.put_last (language) end
			-- TODO: add pattern expressions for count_pattern and from_pattern
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		do
			todo ("display", False)
		end

feature -- Status setting

		compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			initialize_intrinsic_dependencies
			if select_expression = Void then
				set_intrinsically_depends_upon_current_item
			end
		end

feature -- Optimization
	
	simplify is
			-- Perform context-independent static optimizations.
		do
			if select_expression /= Void then
				select_expression.simplify
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression;	adopt_child_expression (select_expression)
				end
			end
			if value_expression /= Void then
				value_expression.simplify
				if value_expression.was_expression_replaced then
					value_expression := value_expression.replacement_expression;	adopt_child_expression (value_expression)
				end
			end
			if format /= Void then
				format.simplify
				if format.was_expression_replaced then
					format := format.replacement_expression;	adopt_child_expression (format)
				end
			end
			if grouping_size /= Void then
				grouping_size.simplify
				if grouping_size.was_expression_replaced then
					grouping_size := grouping_size.replacement_expression;	adopt_child_expression (grouping_size)
				end
			end
			if grouping_separator /= Void then
				grouping_separator.simplify
				if grouping_separator.was_expression_replaced then
					grouping_separator := grouping_separator.replacement_expression;	adopt_child_expression (grouping_separator)
				end
			end
			if letter_value /= Void then
				letter_value.simplify
				if letter_value.was_expression_replaced then
					letter_value := letter_value.replacement_expression;	adopt_child_expression (letter_value)
				end
			end
			if ordinal /= Void then
				ordinal.simplify
				if ordinal.was_expression_replaced then
					ordinal := ordinal.replacement_expression;	adopt_child_expression (ordinal)
				end
			end
			if language /= Void then
				language.simplify
				if language.was_expression_replaced then
					language := language.replacement_expression;	adopt_child_expression (language)
				end
			end
			-- TODO: simplify count_pattern and from_pattern
		end

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			if select_expression /= Void then
				select_expression.check_static_type (a_context, a_context_item_type)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression;	adopt_child_expression (select_expression)
				end
			end
			if value_expression /= Void then
				value_expression.check_static_type (a_context, a_context_item_type)
				if value_expression.was_expression_replaced then
					value_expression := value_expression.replacement_expression;	adopt_child_expression (value_expression)
				end
			end
			if format /= Void then
				format.check_static_type (a_context, a_context_item_type)
				if format.was_expression_replaced then
					format := format.replacement_expression;	adopt_child_expression (format)
				end
			end
			if grouping_size /= Void then
				grouping_size.check_static_type (a_context, a_context_item_type)
				if grouping_size.was_expression_replaced then
					grouping_size := grouping_size.replacement_expression;	adopt_child_expression (grouping_size)
				end
			end
			if grouping_separator /= Void then
				grouping_separator.check_static_type (a_context, a_context_item_type)
				if grouping_separator.was_expression_replaced then
					grouping_separator := grouping_separator.replacement_expression;	adopt_child_expression (grouping_separator)
				end
			end
			if letter_value /= Void then
				letter_value.check_static_type (a_context, a_context_item_type)
				if letter_value.was_expression_replaced then
					letter_value := letter_value.replacement_expression;	adopt_child_expression (letter_value)
				end
			end
			if ordinal /= Void then
				ordinal.check_static_type (a_context, a_context_item_type)
				if ordinal.was_expression_replaced then
					ordinal := ordinal.replacement_expression;	adopt_child_expression (ordinal)
				end
			end
			if language /= Void then
				language.check_static_type (a_context, a_context_item_type)
				if language.was_expression_replaced then
					language := language.replacement_expression;	adopt_child_expression (language)
				end
			end
			-- TODO: check count_pattern and from_pattern
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			if select_expression /= Void then
				select_expression.optimize (a_context, a_context_item_type)
				if select_expression.was_expression_replaced then
					select_expression := select_expression.replacement_expression;	adopt_child_expression (select_expression)
				end
			end
			if value_expression /= Void then
				value_expression.optimize (a_context, a_context_item_type)
				if value_expression.was_expression_replaced then
					value_expression := value_expression.replacement_expression;	adopt_child_expression (value_expression)
				end
			end
			if format /= Void then
				format.optimize (a_context, a_context_item_type)
				if format.was_expression_replaced then
					format := format.replacement_expression;	adopt_child_expression (format)
				end
			end
			if grouping_size /= Void then
				grouping_size.optimize (a_context, a_context_item_type)
				if grouping_size.was_expression_replaced then
					grouping_size := grouping_size.replacement_expression;	adopt_child_expression (grouping_size)
				end
			end
			if grouping_separator /= Void then
				grouping_separator.optimize (a_context, a_context_item_type)
				if grouping_separator.was_expression_replaced then
					grouping_separator := grouping_separator.replacement_expression;	adopt_child_expression (grouping_separator)
				end
			end
			if letter_value /= Void then
				letter_value.optimize (a_context, a_context_item_type)
				if letter_value.was_expression_replaced then
					letter_value := letter_value.replacement_expression;	adopt_child_expression (letter_value)
				end
			end
			if ordinal /= Void then
				ordinal.optimize (a_context, a_context_item_type)
				if ordinal.was_expression_replaced then
					ordinal := ordinal.replacement_expression;	adopt_child_expression (ordinal)
				end
			end
			if language /= Void then
				language.optimize (a_context, a_context_item_type)
				if language.was_expression_replaced then
					language := language.replacement_expression;	adopt_child_expression (language)
				end
			end
		end

	promote (an_offer: XM_XPATH_PROMOTION_OFFER) is
			-- Promote this subexpression.
		local
			a_promotion: XM_XPATH_EXPRESSION
		do
			an_offer.accept (Current)
			a_promotion := an_offer.accepted_expression
			if a_promotion /= Void then
				set_replacement (a_promotion)
			else
				if select_expression /= Void then
					select_expression.promote (an_offer)
					if select_expression.was_expression_replaced then
						select_expression := select_expression.replacement_expression;	adopt_child_expression (select_expression)
					end
				end
				if value_expression /= Void then
					value_expression.promote (an_offer)
					if value_expression.was_expression_replaced then
						value_expression := value_expression.replacement_expression;	adopt_child_expression (value_expression)
					end
				end
				if format /= Void then
					format.promote (an_offer)
					if format.was_expression_replaced then
						format := format.replacement_expression;	adopt_child_expression (format)
					end
				end
				if grouping_size /= Void then
					grouping_size.promote (an_offer)
					if grouping_size.was_expression_replaced then
						grouping_size := grouping_size.replacement_expression;	adopt_child_expression (grouping_size)
					end
				end
				if grouping_separator /= Void then
					grouping_separator.promote (an_offer)
					if grouping_separator.was_expression_replaced then
						grouping_separator := grouping_separator.replacement_expression;	adopt_child_expression (grouping_separator)
					end
				end
				if letter_value /= Void then
					letter_value.promote (an_offer)
					if letter_value.was_expression_replaced then
						letter_value := letter_value.replacement_expression;	adopt_child_expression (letter_value)
					end
				end
				if ordinal /= Void then
					ordinal.promote (an_offer)
					if ordinal.was_expression_replaced then
						ordinal := ordinal.replacement_expression;	adopt_child_expression (ordinal)
					end
				end
				if language /= Void then
					language.promote (an_offer)
					if language.was_expression_replaced then
						language := language.replacement_expression;	adopt_child_expression (language)
					end
				end
				-- TODO: promote count_pattern and from_pattern
			end
		end

feature -- Evaluation

	process_leaving_tail (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.	
		local
			a_receiver: XM_XPATH_SEQUENCE_RECEIVER
			a_letter: STRING
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_number_formatter: XM_XSLT_NUMBER_FORMATTER
			an_error: XM_XPATH_ERROR_VALUE
		do
			last_tail_call := Void
			transformer := a_context.transformer
			a_receiver := a_context.current_receiver
			calculate_vector (a_context)
			if not transformer.is_error then calculate_group_size (a_context)	end
			if not transformer.is_error then calculate_group_separator (a_context) end
			if not transformer.is_error then calculate_ordinal (a_context) end
			calculate_ordinal (a_context)
			if integer_vector = Void and then format = Void and then group_size = 0 and then language = Void then
				
				-- fast path for the simple case
				
				a_receiver.notify_characters (value.to_scientific_string, 0)
			else
				if numberer = Void then
					language.evaluate_as_string (a_context)
					numberer := selected_numberer (language.last_evaluated_string.string_value)
				end
				if letter_value = Void then
					a_letter := ""
				else
					letter_value.evaluate_as_string (a_context)
					if letter_value.last_evaluated_string.is_error or else
						not (STRING_.same_string (letter_value.last_evaluated_string.string_value, "alphabetic") or else
							  STRING_.same_string (letter_value.last_evaluated_string.string_value, "traditional")) then
						create an_error.make_from_string ("Letter-value must be %"traditional%" or %"alphabetic%"", Xpath_errors_uri, "XTDE0030", Dynamic_error)
						an_error.set_location (system_id, line_number)
						transformer.report_fatal_error (an_error)
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
							create an_error.make_from_string ("Format must evaluate to a string", Xpath_errors_uri, "XTDE0030", Dynamic_error)
							an_error.set_location (system_id, line_number)
							transformer.report_fatal_error (an_error)
						else
							create a_number_formatter.make (format.last_evaluated_string.string_value)
						end
					else
						a_number_formatter := formatter
					end
				end
				if not transformer.is_error then
					a_receiver.notify_characters (a_number_formatter.formatted_string (integer_vector, group_size, group_separator, a_letter, ordinal_value, numberer), 0)
				end
			end
		end

feature {XM_XSLT_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
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

	group_size: INTEGER
			-- Group size set by `calculate_group_size'

	group_separator: STRING
			-- Group separator

	ordinal_value: STRING
			-- Ordinal

	calculate_ordinal (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `ordinal_value'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		do
			if ordinal /= Void then
				ordinal.evaluate_as_string (a_context)
				check
					ordinal: not ordinal.last_evaluated_string.is_error
				end
				ordinal_value := ordinal.last_evaluated_string.string_value
			else
				ordinal_value := ""
			end
		end

	calculate_group_separator (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `group_separator'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
		do
			group_separator := ""
			if grouping_separator /= Void then
				grouping_separator.evaluate_as_string (a_context)
				check
					grouping_separator: not grouping_separator.last_evaluated_string.is_error
				end
				group_separator := grouping_separator.last_evaluated_string.string_value
				if group_separator.count > 1 then
					create an_error.make_from_string ("Grouping-separator must evaluate to a single character", Xpath_errors_uri, "XTDE0030", Dynamic_error)
					an_error.set_location (system_id, line_number)
					transformer.report_fatal_error (an_error)
				end
			end
		end

	calculate_group_size (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `group_size'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			a_string: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			if grouping_size = Void then
				group_size := 0
			else
				grouping_size.evaluate_as_string (a_context)
				if grouping_size.last_evaluated_string.is_error then
					create an_error.make_from_string ("grouping-size must be numeric", Xpath_errors_uri, "XTDE0030", Dynamic_error)
					an_error.set_location (system_id, line_number)
					transformer.report_fatal_error (an_error)
				else
					a_string := grouping_size.last_evaluated_string.string_value
					if not a_string.is_integer then
						create an_error.make_from_string ("grouping-size must be an integer", Xpath_errors_uri, "XTDE0030", Dynamic_error)
						an_error.set_location (system_id, line_number)
						transformer.report_fatal_error (an_error)
					else
						group_size := a_string.to_integer
						if group_size < 0 then
							create an_error.make_from_string ("grouping-size must be positive", Xpath_errors_uri, "XTDE0030", Dynamic_error)
							an_error.set_location (system_id, line_number)
							transformer.report_fatal_error (an_error)
						end
					end
				end
			end
		end
				
	calculate_vector (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `vector'.
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			a_source: XM_XPATH_NODE
			an_error: XM_XPATH_ERROR_VALUE
		do
			create value.make_copy (minus_one)
			if value_expression /= Void then
				calculate_value (a_context)
			else
				if select_expression /= Void then
					select_expression.evaluate_item (a_context)
					if select_expression.last_evaluated_item.is_node then
						a_source := select_expression.last_evaluated_item.as_node
					end
				else
					if not a_context.context_item.is_node then
						create an_error.make_from_string ("Context item for xsl:number must be a node",
																	 Xpath_errors_uri, "XTTE0990", Type_error)
						an_error.set_location (system_id, line_number)
						transformer.report_fatal_error (an_error)
					else
						a_source := a_context.context_item.as_node
					end
				end
				if not transformer.is_error then
					if level = Simple_numbering then
						value := simple_number (a_source)
					elseif level = Single_level then
						value := single_number (a_source, count_pattern, from_pattern, a_context)
						if value.is_zero then
							create integer_vector.make (0)
						end
					elseif level = Any_level then
						value := any_number (a_source, a_context)
					elseif level = Multiple_levels then
						integer_vector := multi_level_number (a_source, a_context)
					end
				end
			end
		ensure
			value_not_void: value /= Void
		end

	calculate_value (a_context: XM_XSLT_EVALUATION_CONTEXT) is
			-- Calculate `value'.
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			a_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			finished: BOOLEAN
			an_atomic_value: XM_XPATH_ATOMIC_VALUE
			an_integer_value: XM_XPATH_INTEGER_VALUE
			a_numeric_value: XM_XPATH_NUMERIC_VALUE			
			an_error: XM_XPATH_ERROR_VALUE
		do
			from
				value_expression.create_iterator (a_context)
				a_sequence_iterator := value_expression.last_iterator
				if a_sequence_iterator.is_error then
					a_sequence_iterator.error_value.set_location (system_id, line_number)
					a_context.transformer.report_fatal_error (a_sequence_iterator.error_value)
				else
					a_sequence_iterator.start
				end
				create integer_vector.make_default
			until
				finished or else a_sequence_iterator.is_error or else a_sequence_iterator.after
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
								create an_error.make_from_string ("Numbers to be formatted must be positive integers",
																			 Xpath_errors_uri, "XTDE0980", Dynamic_error)
								an_error.set_location (system_id, line_number)
								transformer.report_fatal_error (an_error)
								finished := True
							end
						end
						if not finished then
							a_numeric_value := a_numeric_value.rounded_value
							an_integer_value ?= a_numeric_value.convert_to_type (type_factory.integer_type)
						end
					end
					if not finished and then an_integer_value.value.is_negative then
						create an_error.make_from_string ("Numbers to be formatted must be positive integers",
																	 Xpath_errors_uri, "XTDE0980", Dynamic_error)
						an_error.set_location (system_id, line_number)
						transformer.report_fatal_error (an_error)
					end
					if not finished then
						integer_vector.force_last (an_integer_value)
					end
				end
				a_sequence_iterator.forth
			end
			if a_sequence_iterator.is_error then
				a_sequence_iterator.error_value.set_location (system_id, line_number)
				a_context.transformer.report_fatal_error (a_sequence_iterator.error_value)
			end
		end
	
	simple_number (a_node: XM_XPATH_NODE): MA_DECIMAL is
			-- Simple number of `a_node';
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
				if a_memo /= Void then
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

	single_number (a_node: XM_XPATH_NODE; a_count_pattern, a_from_pattern: XM_XSLT_PATTERN; a_context: XM_XSLT_EVALUATION_CONTEXT): MA_DECIMAL is
			-- One plus the number of previous siblings
			--  of the nearest ancestor-or-self, that match `count_pattern'.
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			known_to_match, finished, already_checked: BOOLEAN
			a_target: XM_XPATH_NODE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_count: XM_XSLT_PATTERN
			i: INTEGER
		do
			if a_count_pattern = Void and then a_from_pattern = Void then
				Result := simple_number (a_node)
			else
				if a_count_pattern = Void then
					if a_node.fingerprint = -1 then
						create {XM_XSLT_NODE_KIND_TEST} a_count.make_without_location (a_node.node_type)
					else
						create {XM_XSLT_NAME_TEST} a_count.make_without_location (a_node)
					end
					known_to_match := True
				else
					a_count := a_count_pattern
				end
				from
					a_target := a_node
				until known_to_match or else finished or else a_count.matches (a_target, a_context) loop
					a_target := a_target.parent
					if a_target = Void then
						create Result.make_zero
						finished := True
					end
				end
				if not finished then
					if a_from_pattern /= Void and then a_from_pattern.matches (a_target, a_context) then
						create Result.make_zero
					else

						-- We've found the ancestor to count from

						already_checked := a_count.is_node_test
						from
							an_iterator := a_target.new_axis_iterator_with_node_test (Preceding_sibling_axis, a_count.node_test)
							an_iterator.start; i := 1
						until an_iterator.after loop
							if already_checked or else a_count.matches (an_iterator.item, a_context) then
								i := i + 1
							end
							an_iterator.forth
						end
						create Result.make_from_integer (i)
					end
				end
			end
		ensure
			positive_integer: Result /= Void and then Result.is_integer and then Result.is_positive
		end			

	any_number (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT): MA_DECIMAL is
			-- One plus number of previous nodes that match `count_pattern'
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			a_memo: MA_DECIMAL
			memoize, finished: BOOLEAN
			a_count: INTEGER
			a_filter: XM_XPATH_NODE_TEST
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			memoize := not has_variables_in_patterns and then count_pattern /= Void
			if count_pattern = Void then
				if a_node.fingerprint = -1 then
						create {XM_XSLT_NODE_KIND_TEST} count_pattern.make_without_location (a_node.node_type)
					else
						create {XM_XSLT_NAME_TEST} count_pattern.make_without_location (a_node)
				end
				a_count := 1
			elseif count_pattern.matches (a_node, a_context) then
				a_count := 1
			end
			
			-- Pass part of the filtering down to the axis iterator if possible

			if from_pattern = Void then
				a_filter := count_pattern.node_test
			elseif from_pattern.node_kind = Element_node and then count_pattern.node_kind = Element_node then
				a_filter := element_node_kind_test
			else
				a_filter := any_node_test
			end
			from
				an_iterator := a_node.new_axis_iterator_with_node_test (Preceding_or_ancestor_axis, a_filter); an_iterator.start
			until finished or else an_iterator.after loop
				if from_pattern /= Void and then from_pattern.matches (an_iterator.item, a_context) then
					create Result.make_from_integer (a_count); finished := True
				elseif count_pattern.matches (an_iterator.item, a_context) then
					if memoize and then a_count = 1 then
						a_memo := transformer.remembered_number (an_iterator.item)
						if a_memo /= Void then
							a_count := a_memo.to_integer + 1; finished := True
						end
					end
					if not finished then a_count := a_count + 1 end
				end
				an_iterator.forth
			end
			if from_pattern /= Void and then Result = Void then
				create Result.make_zero
			else
				create Result.make_from_integer (a_count)
			end
			if memoize then
				transformer.set_remembered_number (Result, a_node)
			end
		ensure
			positive_integer: Result /= Void and then Result.is_integer and then Result.is_positive
		end			

	multi_level_number (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT): DS_ARRAYED_LIST [XM_XPATH_INTEGER_VALUE] is
			-- Hirerarchic position of `a_node'
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			a_current_node: XM_XPATH_NODE
			finished: BOOLEAN
			an_integer_value: XM_XPATH_INTEGER_VALUE
		do
			create Result.make_default
			if count_pattern = Void then
				if a_node.fingerprint = -1 then
					create {XM_XSLT_NODE_KIND_TEST} count_pattern.make_without_location (a_node.node_type)
				else
					create {XM_XSLT_NAME_TEST} count_pattern.make_without_location (a_node)
				end
			end
			from a_current_node := a_node	until finished loop
				if count_pattern.matches (a_current_node, a_context) then
					create an_integer_value.make (single_number (a_current_node, count_pattern, Void, a_context))
					Result.force_first (an_integer_value)
				end
				a_current_node := a_current_node.parent
				if a_current_node = Void then
					finished := True
				elseif from_pattern /= Void and then from_pattern.matches (a_current_node, a_context) then
					finished := True
				end
			end
		ensure
			result_not_void: Result /= Void
		end

invariant

	language: initialized and then language = Void implies numberer /= Void
	formatter: initialized and then formatter = Void implies format /= Void

end
	
