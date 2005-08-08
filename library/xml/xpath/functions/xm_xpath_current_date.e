indexing

	description:

		"Objects that implement the XPath current-date() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CURRENT_DATE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			pre_evaluate, evaluate_item
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "current-date"; namespace_uri := Xpath_standard_functions_uri
			fingerprint := Current_date_function_type_code
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.date_time_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			--	do_nothing
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_result_string: STRING
			a_date_time: DT_DATE_TIME
			a_month, a_day: INTEGER
		do
			a_date_time := a_context.current_date_time
			a_result_string := a_date_time.year.out + "-"
			a_month := a_date_time.month
			if a_month < 10 then
				a_result_string.append_character ('0')
			end
			a_result_string.append_string (a_month.out)
			a_result_string.append_character ('-')
			a_day := a_date_time.day
			if a_day < 10 then
				a_result_string.append_character ('0')
			end
			a_result_string.append_string (a_day.out)
			a_result_string.append_character ('Z')
			create {XM_XPATH_STRING_VALUE} last_evaluated_item.make (a_result_string)
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			--	do_nothing
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
