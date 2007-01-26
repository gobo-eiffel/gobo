indexing

	description:

		"Objects that implement the XPath adjust-date-to-timezone() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ADJUST_DATE_TO_TIMEZONE

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item, simplify, pre_evaluate
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "adjust-date-to-timezone"
			namespace_uri := Xpath_standard_functions_uri
			fingerprint := Adjust_date_to_timezone_function_type_code
			minimum_argument_count := 1
			maximum_argument_count := 2
			create arguments.make (2)
			arguments.set_equality_tester (expression_tester)
			initialized := True
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.date_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			if argument_number = 1 then
				create Result.make_optional_date
			else
				create Result.make_optional_day_time_duration
			end
		end

feature -- Optimization

	simplify is
			-- Perform context-independent static optimizations
		do
			if arguments.count = 1 then
				set_intrinsically_depends_upon_implicit_timezone
				reset_dependencies
			end
			Precursor
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			a_date_value: XM_XPATH_DATE_VALUE
			a_zone: DT_FIXED_OFFSET_TIME_ZONE
			a_duration: DT_DATE_TIME_DURATION
			a_duration_value: XM_XPATH_SECONDS_DURATION_VALUE
			a_zero_duration: DT_DATE_DURATION
			finished: BOOLEAN
		do
			arguments.item (1).evaluate_item (a_context)
			last_evaluated_item := arguments.item (1).last_evaluated_item
			if last_evaluated_item /= Void and then not last_evaluated_item.is_error then
				a_date_value := last_evaluated_item.as_atomic_value.as_date_value
				if arguments.count = 1 then
					a_zone := a_context.implicit_timezone
					create a_zero_duration.make (0, 0, 0)
					create a_duration.make_from_date_time_duration (a_zero_duration, a_zone.fixed_offset)
					create a_duration_value.make_from_duration (a_duration)
				else
					arguments.item (2).evaluate_item (a_context)
					if arguments.item (2).last_evaluated_item = Void then
						last_evaluated_item := a_date_value.as_zoneless; finished := True
					elseif arguments.item (2).last_evaluated_item.is_error then
						last_evaluated_item := arguments.item (2).last_evaluated_item; finished := True
					else
						a_duration_value := arguments.item (2).last_evaluated_item.as_atomic_value.as_seconds_duration
						if not a_duration_value.is_valid_time_zone then
							create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Time zone has bad values", Xpath_errors_uri, "FODT0003", Dynamic_error)
							finished := True
						end
					end
				end
				if not finished then
					last_evaluated_item := a_date_value.to_another_time_zone (a_duration_value)
				end
			end
		end

	pre_evaluate (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Pre-evaluate `Current' at compile time.
		do
			-- do_nothing
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			-- pre-condition is never met
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
	
