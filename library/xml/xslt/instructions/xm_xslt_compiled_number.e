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

	XM_XPATH_SHARED_TYPE_FACTORY

creation

	make

feature {NONE} -- Initialization

	make (a_select_expression: XM_XPATH_EXPRESSION; a_level: INTEGER; a_count_pattern, a_from_pattern: XM_XSLT_PATTERN;
		a_value_expression, a_format, a_grouping_size, a_grouping_separator, a_letter_value, an_ordinal, a_language: XM_XPATH_EXPRESSION;
		a_formatter: XM_XSLT_NUMBER_FORMATTER;	a_numberer: XM_XSLT_NUMBERER; variables_in_patterns: BOOLEAN) is
			-- Establish invariant.
		require

		do
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

	process_leaving_tail (a_context: XM_XSLT_CONTEXT) is
			-- Execute `Current', writing results to the current `XM_XPATH_RECEIVER'.
		do
			todo ("process_leaving_tail", False)
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

invariant

	-- TODO

end
	
