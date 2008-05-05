indexing

	description:

		"Objects that implement the XPath implicit-timezone function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IMPLICIT_TIMEZONE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, pre_evaluate
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "implicit-timezone"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Implicit_timezone_function_type_code
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
			Result := type_factory.day_time_duration_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			-- never called
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		local
			l_tz: DT_FIXED_OFFSET_TIME_ZONE
			l_td: DT_TIME_DURATION
			l_dd: DT_DATE_DURATION
			l_duration: DT_DATE_TIME_DURATION
		do
			l_tz := a_context.implicit_timezone
			l_td := l_tz.fixed_offset
			create l_dd.make (0, 0, 0)
			create l_duration.make_from_date_time_duration (l_dd, l_td)
			a_result.put (create {XM_XPATH_SECONDS_DURATION_VALUE}.make_from_duration (l_duration))
		ensure then
			good_result: a_result.item /= Void and then not a_result.item.is_error
		end

	pre_evaluate (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			a_replacement.put (Current)
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
