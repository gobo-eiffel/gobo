indexing

	description:

		"Objects that implement the XPath count() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_COUNT

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			evaluate_item
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "count"
			minimum_argument_count := 1
			maximum_argument_count := 1
			create arguments.make (1)
			arguments.set_equality_tester (expression_tester)
			compute_static_properties
		end

feature -- Access

	item_type: XM_XPATH_ITEM_TYPE is
			-- Data type of the expression, where known
		do
			Result := type_factory.integer_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			create Result.make_any_sequence
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
			a_count: INTEGER -- TODO - MA_DECIMAL
			a_last_position_finder: XM_XPATH_LAST_POSITION_FINDER [XM_XPATH_ITEM]
			an_integer_value: XM_XPATH_INTEGER_VALUE
			an_integer: INTEGER
		do
			an_iterator := arguments.item (1).iterator (a_context)
			a_last_position_finder ?= an_iterator
			if a_last_position_finder /= Void then
				create an_integer_value.make_from_integer (a_last_position_finder.last_position)
				last_evaluated_item := an_integer_value
			else
				from
					an_integer := 0
					if not an_iterator.is_error then	an_iterator.start end
				until
					an_iterator.is_error or else an_iterator.after
				loop
					an_integer := an_integer + 1
					an_iterator.forth
				end
				if not an_iterator.is_error then
					create an_integer_value.make_from_integer (an_integer)
					last_evaluated_item := an_integer_value
				else
					create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (an_iterator.error_value)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
