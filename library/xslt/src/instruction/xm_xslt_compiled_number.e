note

	description: "Objects that represent an xsl:number,"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004-2018, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_COMPILED_NUMBER

inherit

	XM_XSLT_INSTRUCTION
		redefine
			sub_expressions, compute_intrinsic_dependencies, item_type,
			compute_cardinality, promote
		end

	HASHABLE

	XM_XPATH_TYPE

	XM_XPATH_AXIS

	XM_XPATH_NUMERIC_ROUTINES

	ST_XSLT_NUMBER_ROUTINES

	XM_XPATH_SHARED_NODE_KIND_TESTS

create

	make

feature {NONE} -- Initialization

	make (an_executable: XM_XSLT_EXECUTABLE; a_select_expression: detachable XM_XPATH_EXPRESSION; a_level, a_hash_code: INTEGER; a_count_pattern, a_from_pattern: detachable XM_XSLT_PATTERN;
		a_value_expression, a_format, a_grouping_size, a_grouping_separator, a_letter_value, an_ordinal, a_language: detachable XM_XPATH_EXPRESSION;
		a_formatter: detachable XM_XSLT_NUMBER_FORMATTER;	a_numberer: detachable ST_XSLT_NUMBERER; a_variables_in_patterns, a_backwards: BOOLEAN)
			-- Establish invariant.
		require
			executable_not_void: an_executable /= Void
			language: a_language = Void implies a_numberer /= Void
			formatter: a_formatter = Void implies a_format /= Void
			strictly_positive_hash_code: a_hash_code > 0
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
			if a_select_expression /= Void then
				adopt_child_expression (a_select_expression)
			end
			if a_value_expression /= Void then
				adopt_child_expression (a_value_expression)
			end
			if a_format /= Void then
				adopt_child_expression (a_format)
			end
			if a_grouping_size /= Void then
				adopt_child_expression (a_grouping_size)
			end
			if a_grouping_separator /= Void then
				adopt_child_expression (a_grouping_separator)
			end
			if a_letter_value /= Void then
				adopt_child_expression (a_letter_value)
			end
			if an_ordinal /= Void then
				adopt_child_expression (an_ordinal)
			end
			if a_language /= Void then
				adopt_child_expression (a_language)
			end
			formatter := a_formatter
			numberer := a_numberer
			has_variables_in_patterns := a_variables_in_patterns
			is_backwards_compatible := a_backwards
			if attached value_expression as l_value_expression and then not is_sub_type (l_value_expression.item_type, type_factory.any_atomic_type) then
				create {XM_XPATH_ATOMIZER_EXPRESSION} value_expression.make (l_value_expression, False)
			end
			hash_code := a_hash_code
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
			has_variables_in_patterns_set: has_variables_in_patterns = a_variables_in_patterns
			backwards_compatible: is_backwards_compatible = a_backwards
			hash_code_set: hash_code = a_hash_code
		end

feature -- Access

	hash_code: INTEGER
			-- Hash code value

	item_type: XM_XPATH_ITEM_TYPE
			-- Data type of the expression, when known
		do
			Result := type_factory.string_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	sub_expressions: DS_ARRAYED_LIST [XM_XPATH_EXPRESSION]
			-- Immediate sub-expressions of `Current'
		local
			l_bridge: XM_XSLT_PATTERN_BRIDGE
		do
			create Result.make (10)
			Result.set_equality_tester (expression_tester)
			if attached select_expression as l_select_expression then Result.put_last (l_select_expression) end
			if attached value_expression as l_value_expression then Result.put_last (l_value_expression) end
			if attached format as l_format then Result.put_last (l_format) end
			if attached grouping_size as l_grouping_size then Result.put_last (l_grouping_size) end
			if attached grouping_separator as l_grouping_separator then Result.put_last (l_grouping_separator) end
			if attached letter_value as l_letter_value then Result.put_last (l_letter_value) end
			if attached ordinal as l_ordinal then Result.put_last (l_ordinal) end
			if attached language as l_language then Result.put_last (l_language) end
			if attached count_pattern as l_count_pattern then
				create l_bridge.make (l_count_pattern, Current)
				Result.put_last (l_bridge)
			end
			if attached from_pattern as l_from_pattern then
				create l_bridge.make (l_from_pattern, Current)
				Result.put_last (l_bridge)
			end
		end

feature -- Status report

	is_backwards_compatible: BOOLEAN
			-- Is in backwards compatible mode?

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		do
			std.error.put_string (STRING_.appended_string (indentation (a_level), "xsl:number"))
			std.error.put_new_line
			if attached select_expression as l_select_expression then l_select_expression.display (a_level + 1) end
		end

feature -- Status setting

		compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			initialize_intrinsic_dependencies
			if select_expression = Void then
				set_intrinsically_depends_upon_context_item
			end
		end

feature -- Optimization

	simplify (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION])
			-- Perform context-independent static optimizations.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if attached select_expression as l_select_expression then
				l_select_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_select_expression then
					set_select_expression (l_new_select_expression)
					if l_new_select_expression.is_error then
						set_replacement (a_replacement, l_new_select_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached value_expression as l_value_expression then
				l_value_expression.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_value_expression then
					set_value_expression (l_new_value_expression)
					if l_new_value_expression.is_error then
						set_replacement (a_replacement, l_new_value_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached format as l_format then
				l_format.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_format then
					set_format (l_new_format)
					if l_new_format.is_error then
						set_replacement (a_replacement, l_new_format)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_size as l_grouping_size then
				l_grouping_size.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_grouping_size then
					set_grouping_size (l_new_grouping_size)
					if l_new_grouping_size.is_error then
						set_replacement (a_replacement, l_new_grouping_size)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_separator as l_grouping_separator then
				l_grouping_separator.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_grouping_separator then
					set_grouping_separator (l_new_grouping_separator)
					if l_new_grouping_separator.is_error then
						set_replacement (a_replacement, l_new_grouping_separator)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached letter_value as l_letter_value then
				l_letter_value.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_letter_value then
					set_letter_value (l_new_letter_value)
					if l_new_letter_value.is_error then
						set_replacement (a_replacement, l_new_letter_value)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached ordinal as l_ordinal then
				l_ordinal.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_ordinal then
					set_ordinal (l_new_ordinal)
					if l_new_ordinal.is_error then
						set_replacement (a_replacement, l_new_ordinal)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached language as l_language then
				l_language.simplify (l_replacement)
				check postcondition_of_simplify: attached l_replacement.item as l_new_language then
					set_language (l_new_language)
					if l_new_language.is_error then
						set_replacement (a_replacement, l_new_language)
						-- TODO: simplify count_pattern and from_pattern,
						--  in which case uncomment: l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if attached select_expression as l_select_expression then
				l_select_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_select_expression then
					set_select_expression (l_new_select_expression)
					if l_new_select_expression.is_error then
						set_replacement (a_replacement, l_new_select_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached value_expression as l_value_expression then
				l_value_expression.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_value_expression then
					set_value_expression (l_new_value_expression)
					if l_new_value_expression.is_error then
						set_replacement (a_replacement, l_new_value_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached format as l_format then
				l_format.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_value_expression then
					set_format (l_new_value_expression)
					if l_new_value_expression.is_error then
						set_replacement (a_replacement, l_new_value_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_size as l_grouping_size then
				l_grouping_size.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_grouping_size then
					set_grouping_size (l_new_grouping_size)
					if l_new_grouping_size.is_error then
						set_replacement (a_replacement, l_new_grouping_size)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_separator as l_grouping_separator then
				l_grouping_separator.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_grouping_separator then
					set_grouping_separator (l_new_grouping_separator)
					if l_new_grouping_separator.is_error then
						set_replacement (a_replacement, l_new_grouping_separator)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached letter_value as l_letter_value then
				l_letter_value.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_letter_value then
					set_letter_value (l_new_letter_value)
					if l_new_letter_value.is_error then
						set_replacement (a_replacement, l_new_letter_value)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached ordinal as l_ordinal then
				l_ordinal.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_ordinal then
					set_ordinal (l_new_ordinal)
					if l_new_ordinal.is_error then
						set_replacement (a_replacement, l_new_ordinal)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached language as l_language then
				l_language.check_static_type (l_replacement, a_context, a_context_item_type)
				check postcondition_of_check_static_type: attached l_replacement.item as l_new_language then
					set_language (l_new_language)
					if l_new_language.is_error then
						set_replacement (a_replacement, l_new_language)
						-- TODO: check count_pattern and from_pattern,
						--  in which case uncomment: l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
		do
			create l_replacement.make (Void)
			if attached select_expression as l_select_expression then
				l_select_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_select_expression then
					set_select_expression (l_new_select_expression)
					if l_new_select_expression.is_error then
						set_replacement (a_replacement, l_new_select_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached value_expression as l_value_expression then
				l_value_expression.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_value_expression then
					set_value_expression (l_new_value_expression)
					if l_new_value_expression.is_error then
						set_replacement (a_replacement, l_new_value_expression)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached format as l_format then
				l_format.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_format then
					set_format (l_new_format)
					if l_new_format.is_error then
						set_replacement (a_replacement, l_new_format)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_size as l_grouping_size then
				l_grouping_size.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_grouping_size then
					set_grouping_size (l_new_grouping_size)
					if l_new_grouping_size.is_error then
						set_replacement (a_replacement, l_new_grouping_size)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached grouping_separator as l_grouping_separator then
				l_grouping_separator.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_grouping_separator then
					set_grouping_separator (l_new_grouping_separator)
					if l_new_grouping_separator.is_error then
						set_replacement (a_replacement, l_new_grouping_separator)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached letter_value as l_letter_value then
				l_letter_value.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_letter_value then
					set_letter_value (l_new_letter_value)
					if l_new_letter_value.is_error then
						set_replacement (a_replacement, l_new_letter_value)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached ordinal as l_ordinal then
				l_ordinal.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_ordinal then
					set_ordinal (l_new_ordinal)
					if l_new_ordinal.is_error then
						set_replacement (a_replacement, l_new_ordinal)
					else
						l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void and attached language as l_language then
				l_language.optimize (l_replacement, a_context, a_context_item_type)
				check postcondition_of_optimize: attached l_replacement.item as l_new_language then
					set_language (l_new_language)
					if l_new_language.is_error then
						set_replacement (a_replacement, l_new_language)
						-- TODO: optimize count_pattern and from_pattern,
						--  in which case uncomment: l_replacement.put (Void)
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

	promote (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_offer: XM_XPATH_PROMOTION_OFFER)
			-- Promote this subexpression.
		local
			l_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]
			l_promotion: detachable XM_XPATH_EXPRESSION
		do
			a_offer.accept (Current)
			l_promotion := a_offer.accepted_expression
			if l_promotion /= Void then
				set_replacement (a_replacement, l_promotion)
			else
				create l_replacement.make (Void)
				if attached select_expression as l_select_expression then
					l_select_expression.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_select_expression then
						set_select_expression (l_new_select_expression)
						if l_new_select_expression.is_error then
							set_replacement (a_replacement, l_new_select_expression)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached value_expression as l_value_expression then
					l_value_expression.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_value_expression then
						set_value_expression (l_new_value_expression)
						if l_new_value_expression.is_error then
							set_replacement (a_replacement, l_new_value_expression)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached format as l_format then
					l_format.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_format then
						set_format (l_new_format)
						if l_new_format.is_error then
							set_replacement (a_replacement, l_new_format)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached grouping_size as l_grouping_size then
					l_grouping_size.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_grouping_size then
						set_grouping_size (l_new_grouping_size)
						if l_new_grouping_size.is_error then
							set_replacement (a_replacement, l_new_grouping_size)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached grouping_separator as l_grouping_separator then
					l_grouping_separator.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_grouping_separator then
						set_grouping_separator (l_new_grouping_separator)
						if l_new_grouping_separator.is_error then
							set_replacement (a_replacement, l_new_grouping_separator)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached letter_value as l_letter_value then
					l_letter_value.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_letter_value then
						set_letter_value (l_new_letter_value)
						if l_new_letter_value.is_error then
							set_replacement (a_replacement, l_new_letter_value)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached ordinal as l_ordinal then
					l_ordinal.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_ordinal then
						set_ordinal (l_new_ordinal)
						if l_new_ordinal.is_error then
							set_replacement (a_replacement, l_new_ordinal)
						else
							l_replacement.put (Void)
						end
					end
				end
				if a_replacement.item = Void and attached language as l_language then
					l_language.promote (l_replacement, a_offer)
					check potscondition_of_promote: attached l_replacement.item as l_new_language then
						set_language (l_new_language)
						if l_new_language.is_error then
							set_replacement (a_replacement, l_new_language)
							-- TODO: promote count_pattern and from_pattern,
							--  in which case uncomment: l_replacement.put (Void)
						end
					end
				end
			end
			if a_replacement.item = Void then
				a_replacement.put (Current)
			end
		end

feature -- Evaluation

	generate_tail_call (a_tail: DS_CELL [detachable XM_XPATH_TAIL_CALL]; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		local
			l_letter: detachable STRING
			l_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_number_formatter: detachable XM_XSLT_NUMBER_FORMATTER
			l_error: XM_XPATH_ERROR_VALUE
			l_atomic_vector: like atomic_vector
		do
			check
				attached a_context.transformer as l_transformer
				attached a_context.current_receiver as l_receiver
			then
				transformer := l_transformer
				atomic_vector := Void
				calculate_vector (a_context)
				if not l_transformer.is_error then calculate_group_size (a_context)	end
				if not l_transformer.is_error then calculate_group_separator (a_context) end
				if not l_transformer.is_error then
					calculate_ordinal (a_context)
					if atomic_vector = Void and then format = Void and then group_size = 0 and then language = Void then

						-- fast path for the simple case

						l_receiver.notify_characters (value.out, 0)
					else
						if numberer = Void then
							check attached language as l_language then
								l_language.evaluate_as_string (a_context)
								check postcondition_of_evaluate_as_string: attached l_language.last_evaluated_string as l_language_last_evaluated_string then
									numberer := selected_numberer (l_language_last_evaluated_string.string_value)
								end
							end
						end
						if not attached letter_value as l_letter_value then
							l_letter := ""
						else
							l_letter_value.evaluate_as_string (a_context)
							check postcondition_of_evaluate_as_string: attached l_letter_value.last_evaluated_string as l_letter_value_last_evaluated_string then
								if l_letter_value_last_evaluated_string.is_error or else
									not (STRING_.same_string (l_letter_value_last_evaluated_string.string_value, "alphabetic") or else
										  STRING_.same_string (l_letter_value_last_evaluated_string.string_value, "traditional")) then
									create l_error.make_from_string ("Letter-value must be %"traditional%" or %"alphabetic%"", Xpath_errors_uri, "XTDE0030", Dynamic_error)
									l_error.set_location (system_id, line_number)
									l_transformer.report_fatal_error (l_error)
								else
									l_letter := l_letter_value_last_evaluated_string.string_value
								end
							end
						end
						if not l_transformer.is_error then
							if atomic_vector = Void then
								create l_atomic_vector.make (1)
								atomic_vector := l_atomic_vector
								create l_integer_value.make (value)
								l_atomic_vector.put_last (l_integer_value)
							end
							if formatter = Void then
								check attached format as l_format then
									l_format.evaluate_as_string (a_context)
									check postcondition_of_evaluate_as_string: attached l_format.last_evaluated_string as l_format_last_evaluated_string then
										if l_format_last_evaluated_string.is_error then
											create l_error.make_from_string ("Format must evaluate to a string", Xpath_errors_uri, "XTDE0030", Dynamic_error)
											l_error.set_location (system_id, line_number)
											l_transformer.report_fatal_error (l_error)
										else
											create l_number_formatter.make (l_format_last_evaluated_string.string_value)
										end
									end
								end
							else
								l_number_formatter := formatter
							end
						end
						if not l_transformer.is_error then
							check
								l_number_formatter /= Void
								l_letter /= Void
								attached atomic_vector as l_atomic_vector2
								attached group_separator as l_group_separator
								attached ordinal_value as l_ordinal_value
								attached numberer as l_numberer
							then
								l_receiver.notify_characters (l_number_formatter.formatted_string (l_atomic_vector2, group_size, l_group_separator, l_letter, l_ordinal_value, l_numberer), 0)
							end
						end
					end
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	select_expression: detachable XM_XPATH_EXPRESSION
			-- Selected node

	level: INTEGER
			-- Level

	count_pattern: detachable XM_XSLT_PATTERN
			-- Nodes which are to be counted

	from_pattern: detachable XM_XSLT_PATTERN
			-- Node from which counting is to be started

	value_expression: detachable XM_XPATH_EXPRESSION
			-- Supplied value

	format: detachable XM_XPATH_EXPRESSION
			-- Format for formatted number

	grouping_size, grouping_separator: detachable XM_XPATH_EXPRESSION
			-- Grouping parameters

	letter_value: detachable XM_XPATH_EXPRESSION
		-- Letter value

	ordinal: detachable XM_XPATH_EXPRESSION
			-- Ordinal marker

	language: detachable XM_XPATH_EXPRESSION
			-- Language

	formatter: detachable XM_XSLT_NUMBER_FORMATTER
			-- Formatter

	numberer: detachable ST_XSLT_NUMBERER
			-- Numberer

	has_variables_in_patterns: BOOLEAN
			-- Do any supplied patterns include variable references?


	-- The following are used to communicate between `generate_tail_call' and it's sub-routines

	value: INTEGER_64
			-- Value of number

	atomic_vector: detachable DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			-- Sequence of atoms to be used as place marker to be formatted

	transformer: detachable XM_XSLT_TRANSFORMER
			-- Transformer

	group_size: INTEGER
			-- Group size set by `calculate_group_size'

	group_separator: detachable STRING
			-- Group separator

	ordinal_value: detachable STRING
			-- Ordinal

	set_select_expression (a_select_expression: XM_XPATH_EXPRESSION)
			-- Ensure `select_expression' = `a_select_expression'.
		do
			if select_expression /= a_select_expression then
				select_expression := a_select_expression
				if a_select_expression /= Void then
					adopt_child_expression (a_select_expression)
					reset_static_properties
				end
			end
		ensure
			set: select_expression = a_select_expression
		end

	set_value_expression (a_value_expression: XM_XPATH_EXPRESSION)
			-- Ensure `value_expression' = `a_value_expression'.
		do
			if value_expression /= a_value_expression then
				value_expression := a_value_expression
				if a_value_expression /= Void then
					adopt_child_expression (a_value_expression)
					reset_static_properties
				end
			end
		ensure
			set: value_expression = a_value_expression
		end

	set_format (a_format: XM_XPATH_EXPRESSION)
			-- Ensure `format' = `a_format'.
		do
			if format /= a_format then
				format := a_format
				if a_format /= Void then
					adopt_child_expression (a_format)
					reset_static_properties
				end
			end
		ensure
			set: format = a_format
		end

	set_grouping_size (a_grouping_size: XM_XPATH_EXPRESSION)
			-- Ensure `grouping_size' = `a_grouping_size'.
		do
			if grouping_size /= a_grouping_size then
				grouping_size := a_grouping_size
				if a_grouping_size /= Void then
					adopt_child_expression (a_grouping_size)
					reset_static_properties
				end
			end
		ensure
			set: grouping_size = a_grouping_size
		end

	set_grouping_separator (a_grouping_separator: XM_XPATH_EXPRESSION)
			-- Ensure `grouping_separator' = `a_grouping_separator'.
		do
			if grouping_separator /= a_grouping_separator then
				grouping_separator := a_grouping_separator
				if a_grouping_separator /= Void then
					adopt_child_expression (a_grouping_separator)
					reset_static_properties
				end
			end
		ensure
			set: grouping_separator = a_grouping_separator
		end

	set_language (a_language: XM_XPATH_EXPRESSION)
			-- Ensure `language' = `a_language'.
		do
			if language /= a_language then
				language := a_language
				if a_language /= Void then
					adopt_child_expression (a_language)
					reset_static_properties
				end
			end
		ensure
			set: language = a_language
		end

	set_ordinal (a_ordinal: XM_XPATH_EXPRESSION)
			-- Ensure `ordinal' = `a_ordinal'.
		do
			if ordinal /= a_ordinal then
				ordinal := a_ordinal
				if a_ordinal /= Void then
					adopt_child_expression (a_ordinal)
					reset_static_properties
				end
			end
		ensure
			set: ordinal = a_ordinal
		end

	set_letter_value (a_letter_value: XM_XPATH_EXPRESSION)
			-- Ensure `letter_value' = `a_letter_value'.
		do
			if letter_value /= a_letter_value then
				letter_value := a_letter_value
				if a_letter_value /= Void then
					adopt_child_expression (a_letter_value)
					reset_static_properties
				end
			end
		ensure
			set: letter_value = a_letter_value
		end


	calculate_ordinal (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate `ordinal_value'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		do
			if attached ordinal as l_ordinal then
				l_ordinal.evaluate_as_string (a_context)
				check
					postcondition_of_evaluate_as_string: attached l_ordinal.last_evaluated_string as l_ordinal_last_evaluated_string
					ordinal: not l_ordinal_last_evaluated_string.is_error
				then
					ordinal_value := l_ordinal_last_evaluated_string.string_value
				end
			else
				ordinal_value := ""
			end
		end

	calculate_group_separator (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate `group_separator'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			an_error: XM_XPATH_ERROR_VALUE
			l_group_separator: like group_separator
		do
			group_separator := ""
			if attached grouping_separator as l_grouping_separator then
				l_grouping_separator.evaluate_as_string (a_context)
				check
					potcondition_of_evaluate_as_string: attached l_grouping_separator.last_evaluated_string as l_grouping_separator_last_evaluated_string
					grouping_separator: not l_grouping_separator_last_evaluated_string.is_error
				then
					l_group_separator := l_grouping_separator_last_evaluated_string.string_value
					group_separator := l_group_separator
					if l_group_separator.count > 1 then
						create an_error.make_from_string ("Grouping-separator must evaluate to a single character", Xpath_errors_uri, "XTDE0030", Dynamic_error)
						an_error.set_location (system_id, line_number)
						check precondition_transformer_not_void: attached transformer as l_transformer then
							l_transformer.report_fatal_error (an_error)
						end
					end
				end
			end
		end

	calculate_group_size (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate `group_size'
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			a_string: STRING
			an_error: XM_XPATH_ERROR_VALUE
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				if not attached grouping_size as l_grouping_size then
					group_size := 0
				else
					l_grouping_size.evaluate_as_string (a_context)
					check postcondition_of_evaluate_as_string: attached l_grouping_size.last_evaluated_string as l_grouping_size_last_evaluated_string then
						if l_grouping_size_last_evaluated_string.is_error then
							create an_error.make_from_string ("grouping-size must be numeric", Xpath_errors_uri, "XTDE0030", Dynamic_error)
							an_error.set_location (system_id, line_number)
							l_transformer.report_fatal_error (an_error)
						else
							a_string := l_grouping_size_last_evaluated_string.string_value
							if not a_string.is_integer then
								create an_error.make_from_string ("grouping-size must be an integer", Xpath_errors_uri, "XTDE0030", Dynamic_error)
								an_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (an_error)
							else
								group_size := a_string.to_integer
								if group_size < 0 then
									create an_error.make_from_string ("grouping-size must be positive", Xpath_errors_uri, "XTDE0030", Dynamic_error)
									an_error.set_location (system_id, line_number)
									l_transformer.report_fatal_error (an_error)
								end
							end
						end
					end
				end
			end
		end

	calculate_vector (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate `atomic_vector' or `value'.
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			l_source: detachable XM_XPATH_NODE
			l_error: XM_XPATH_ERROR_VALUE
			l_item: DS_CELL [detachable XM_XPATH_ITEM]
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				value := -1
				atomic_vector := Void
				if value_expression /= Void then
					calculate_value (a_context)
				else
					if attached select_expression as l_select_expression then
						create l_item.make (Void)
						l_select_expression.evaluate_item (l_item, a_context)
						check attached l_item.item as l_item_item then
							if l_item_item.is_node then
								l_source := l_item_item.as_node
							else
								create l_error.make_from_string ("Context item for xsl:number must be a node",
																			 Xpath_errors_uri, "XTTE0990", Type_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error)
							end
						end
					else
						check attached a_context.context_item as l_context_context_item then
							if not l_context_context_item.is_node then
								create l_error.make_from_string ("Context item for xsl:number must be a node",
																			 Xpath_errors_uri, "XTTE0990", Type_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error)
							else
								l_source := l_context_context_item.as_node
							end
						end
					end
					if not l_transformer.is_error then
						check l_source /= Void then
							if level = Simple_numbering then
								value := simple_number (l_source)
							elseif level = Single_level then
								calculate_single_number (l_source, count_pattern, from_pattern, a_context)
								if not l_transformer.is_error then
									value := last_single_number
									if value = 0 then
										create atomic_vector.make (0)
									end
								end
							elseif level = Any_level then
								calculate_any_number (l_source, count_pattern, a_context)
								if not l_transformer.is_error then
									value := last_single_number
									if value = 0 then
										create atomic_vector.make (0)
									end
								end
							elseif level = Multiple_levels then
								calculate_multi_level_number (l_source, a_context)
								if not l_transformer.is_error then
									atomic_vector := multi_level_number
								end
							end
						end
					end
				end
			end
		ensure
			error_or_value_or_atomic_vector: attached transformer as l_transformer and then not l_transformer.is_error implies (value > 0 or atomic_vector /= Void)
		end

	calculate_value (a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Calculate `value'.
		require
			context_not_void: a_context /= Void
			transformer_not_void: transformer /= Void
		local
			l_sequence_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			l_finished: BOOLEAN
			l_double_value: XM_XPATH_DOUBLE_VALUE
			l_string_value: XM_XPATH_STRING_VALUE
			l_numeric_value: XM_XPATH_NUMERIC_VALUE
			l_atomic_value: XM_XPATH_ATOMIC_VALUE
			l_error: XM_XPATH_ERROR_VALUE
			l_atomic_vector: like atomic_vector
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				from
					check attached value_expression as l_value_expression then
						l_value_expression.create_iterator (a_context)
						check postcondition_of_create_iterator: attached l_value_expression.last_iterator as l_last_iterator then
							l_sequence_iterator := l_last_iterator
						end
					end
					if attached l_sequence_iterator.error_value as l_error_value then
						check is_error: l_sequence_iterator.is_error end
						l_error_value.set_location (system_id, line_number)
						check attached a_context.transformer as l_context_transformer then
							l_context_transformer.report_fatal_error (l_error_value)
						end
					else
						l_sequence_iterator.start
					end
					create l_atomic_vector.make_default
					atomic_vector := l_atomic_vector
				until
					l_finished or else l_sequence_iterator.is_error or else l_sequence_iterator.after
				loop
					if not attached {XM_XPATH_ATOMIC_VALUE} l_sequence_iterator.item as l_atomic_value2 then
						l_finished := True
					else
						l_atomic_value := l_atomic_value2
						if not l_atomic_value.is_numeric_value then
							l_double_value := item_to_double (l_atomic_value)
							if l_double_value.is_error then
								create l_double_value.make_nan
							end
							l_numeric_value := l_double_value
						else
							l_numeric_value := l_atomic_value.as_numeric_value
						end
						if l_numeric_value.is_nan then
							if is_backwards_compatible then
								l_finished := True
								create l_string_value.make ("NaN")
								l_atomic_vector.force_last (l_string_value)
							else
								create l_error.make_from_string ("Numbers to be formatted must be positive integers",
									Xpath_errors_uri, "XTDE0980", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error)
								l_finished := True
							end
						else
							if not l_finished then
								l_numeric_value := l_numeric_value.rounded_value
								l_numeric_value.convert_to_type (type_factory.integer_type)
								check postcondition_of_convert_to_type: attached l_numeric_value.converted_value as l_converted_value then
									l_atomic_value := l_converted_value
								end
							end
						end
						if not l_finished and then l_atomic_value.as_numeric_value.is_negative then
							if is_backwards_compatible then
								l_finished := True
								create l_string_value.make ("NaN")
								l_atomic_vector.force_last (l_string_value)
							else
								create l_error.make_from_string ("Numbers to be formatted must be positive integers",
								Xpath_errors_uri, "XTDE0980", Dynamic_error)
								l_error.set_location (system_id, line_number)
								l_transformer.report_fatal_error (l_error)
							end
						end
						if not l_finished then
							l_atomic_vector.force_last (l_atomic_value)
						end
					end
					l_sequence_iterator.forth
					if is_backwards_compatible then
						l_finished := True
					end
				end
				if attached l_sequence_iterator.error_value as l_error_value then
					check is_error: l_sequence_iterator.is_error end
					l_error_value.set_location (system_id, line_number)
					check attached a_context.transformer as l_context_transformer then
						l_context_transformer.report_fatal_error (l_error_value)
					end
				end
				if l_atomic_vector.is_empty and is_backwards_compatible then
					l_atomic_vector.put_last (create {XM_XPATH_STRING_VALUE}.make ("NaN"))
				end
			end
		end

	simple_number (a_node: XM_XPATH_NODE): INTEGER_64
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
			a_memo: detachable DS_CELL [INTEGER_64]
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				a_fingerprint := a_node.fingerprint
				if a_fingerprint = -1 then
					create {XM_XPATH_NODE_KIND_TEST} a_node_test.make (a_node.node_type)
				else
					create {XM_XPATH_NAME_TEST} a_node_test.make_same_type (a_node)
				end
				from
					an_iterator := a_node.new_axis_iterator_with_node_test (Preceding_sibling_axis, a_node_test)
					an_iterator.start
					Result := 1
				until
					finished or else an_iterator.after
				loop
					a_previous_node := an_iterator.item
					a_memo := l_transformer.remembered_number (a_previous_node, Current)
					if a_memo /= Void then
						Result := Result + a_memo.item
						l_transformer.set_remembered_number (Result, a_node, Current)
						finished := True
					else
						an_iterator.forth
						Result := Result + 1
					end
					if not finished then
						l_transformer.set_remembered_number (Result, a_node, Current)
					end
				end
			end
		ensure
			strictly_positive_integer: Result > 0
		end

	last_single_number: INTEGER_64
			-- Result from `calculate_single_number' or `calculate_any_number'

	calculate_single_number (a_node: XM_XPATH_NODE; a_count_pattern, a_from_pattern: detachable XM_XSLT_PATTERN; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- One plus the number of previous siblings
			--  of the nearest ancestor-or-self, that match `count_pattern'.
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			known_to_match, finished, already_checked: BOOLEAN
			a_target: detachable XM_XPATH_NODE
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			a_count: XM_XSLT_PATTERN
			i: INTEGER
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				last_single_number := -1
				if a_count_pattern = Void and then a_from_pattern = Void then
					last_single_number := simple_number (a_node)
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
					until known_to_match or else finished loop
						check a_target /= Void then
							a_count.match (a_target, a_context.new_pattern_context)
							if l_transformer.is_error then
								finished := True
							elseif a_count.last_match_result then
								known_to_match := True
							else
								a_target := a_target.parent
								if a_target = Void then
									last_single_number := 0
									finished := True
								end
							end
						end
					end
					if not finished then
						check a_target /= Void then
							if a_from_pattern /= Void then
								a_from_pattern.match (a_target, a_context.new_pattern_context)
								if not l_transformer.is_error and a_from_pattern.last_match_result then
									last_single_number := 0
								end
							end
							if last_single_number = -1 then

								-- We've found the ancestor to count from

								already_checked := a_count.is_node_test
								from
									an_iterator := a_target.new_axis_iterator_with_node_test (Preceding_sibling_axis, a_count.node_test)
									an_iterator.start; i := 1
								until l_transformer.is_error or an_iterator.after loop
									if already_checked then
										i := i + 1
									else
										a_count.match (an_iterator.item, a_context.new_pattern_context)
										if not l_transformer.is_error and a_count.last_match_result then
											i := i + 1
										end
									end
									an_iterator.forth
								end
								last_single_number := i
							end
						end
					end
				end
			end
		ensure
			positive_integer: attached transformer as l_transformer and then not l_transformer.is_error implies last_single_number >= 0
		end

	calculate_any_number (a_node: XM_XPATH_NODE; a_count: detachable XM_XSLT_PATTERN; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- One plus number of previous nodes that match `count_pattern'
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			l_memo: detachable DS_CELL [INTEGER_64]
			l_memoize, l_finished: BOOLEAN
			l_count: INTEGER_64
			l_filter: XM_XPATH_NODE_TEST
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			l_count_pattern: XM_XSLT_PATTERN
			l_node: XM_XPATH_NODE
		do
			check precondition_transformer_not_void: attached transformer as l_transformer then
				last_single_number := -1
				l_memoize := not has_variables_in_patterns
				if a_count = Void then
					if a_node.fingerprint = -1 then
							create {XM_XSLT_NODE_KIND_TEST} l_count_pattern.make_without_location (a_node.node_type)
						else
							create {XM_XSLT_NAME_TEST} l_count_pattern.make_without_location (a_node)
					end
					l_count := 1
				else
					l_count_pattern := a_count
					l_count_pattern.match (a_node, a_context.new_pattern_context)
					if not l_transformer.is_error and l_count_pattern.last_match_result then
						l_count := 1
					end
				end

				-- Pass part of the filtering down to the axis iterator if possible

				if not attached from_pattern as l_from_pattern then
					l_filter := l_count_pattern.node_test
				elseif l_from_pattern.node_kind = Element_node and then l_count_pattern.node_kind = Element_node then
					l_filter := element_node_kind_test
				else
					l_filter := any_node_test
				end
				from
					l_iterator := a_node.new_axis_iterator_with_node_test (Preceding_or_ancestor_axis, l_filter)
					l_iterator.start
				until l_finished or l_iterator.after or l_transformer.is_error loop
					l_node := l_iterator.item
					l_count_pattern.match (l_node, a_context.new_pattern_context)
					if not l_transformer.is_error and l_count_pattern.last_match_result then
						if l_memoize and l_count = 1 then
							l_memo := l_transformer.remembered_number (l_node, Current)
							if l_memo /= Void then
								last_single_number := l_memo.item + 1
								l_finished := True
							end
						end
						if not l_finished then
							l_count := l_count + 1
						end
					end
					if not l_finished then
						if attached from_pattern as l_from_pattern then
							l_from_pattern.match (l_iterator.item, a_context.new_pattern_context)
							if not l_transformer.is_error and l_from_pattern.last_match_result then
								last_single_number := l_count
								l_finished := True
							end
						end
					end
					l_iterator.forth
				end
				if not l_finished then
					if from_pattern /= Void and then last_single_number = -1 then
						last_single_number := 0
					else
						last_single_number := l_count
					end
				end
				if l_memoize and last_single_number /= 0 then
					l_transformer.set_remembered_number (last_single_number, a_node, Current)
				end
			end
		ensure
			positive_integer: attached transformer as l_transformer and then not l_transformer.is_error implies last_single_number >= 0
		end

	multi_level_number: detachable DS_ARRAYED_LIST [XM_XPATH_ATOMIC_VALUE]
			-- Result from `calculate_multi_level_number'

	calculate_multi_level_number (a_node: XM_XPATH_NODE; a_context: XM_XSLT_EVALUATION_CONTEXT)
			-- Hirerarchic position of `a_node'
		require
			source_node_not_void: a_node /= Void
			transformer_not_void: transformer /= Void
		local
			a_current_node: detachable XM_XPATH_NODE
			finished: BOOLEAN
			an_integer_value: XM_XPATH_MACHINE_INTEGER_VALUE
			l_count_pattern: like count_pattern
			l_multi_level_number: like multi_level_number
		do
			create l_multi_level_number.make_default
			multi_level_number := l_multi_level_number
			l_count_pattern := count_pattern
			if l_count_pattern = Void then
				if a_node.fingerprint = -1 then
					create {XM_XSLT_NODE_KIND_TEST} l_count_pattern.make_without_location (a_node.node_type)
				else
					create {XM_XSLT_NAME_TEST} l_count_pattern.make_without_location (a_node)
				end
				count_pattern := l_count_pattern
			end
			check precondition_transformer_not_void: attached transformer as l_transformer then
				from a_current_node := a_node	until finished loop
					check a_current_node /= Void then
						l_count_pattern.match (a_current_node, a_context.new_pattern_context)
						if l_transformer.is_error then
							finished := True
						elseif l_count_pattern.last_match_result then
							calculate_single_number (a_current_node, count_pattern, Void, a_context)
							if l_transformer.is_error then
								finished := True
							else
								create an_integer_value.make (last_single_number)
								l_multi_level_number.force_first (an_integer_value)
							end
						end
					end
					a_current_node := a_current_node.parent
					if a_current_node = Void then
						finished := True
					elseif attached from_pattern as l_from_pattern then
						l_from_pattern.match (a_current_node, a_context.new_pattern_context)
						if l_transformer.is_error or l_from_pattern.last_match_result then
							finished := True
						end
					end
				end
			end
		ensure
			multi_level_number_not_void: multi_level_number /= Void
		end

invariant

	language: initialized and then language = Void implies numberer /= Void
	formatter: initialized and then formatter = Void implies format /= Void

end

