indexing

	description:

		"Objects that implement the XPath last() function"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LAST

inherit

	XM_XPATH_SYSTEM_FUNCTION
		redefine
			early_evaluation, evaluated_item, compute_intrinsic_dependencies
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Establish invariant
		do
			name := "last"
			minimum_argument_count := 0
			maximum_argument_count := 0
			create arguments.make (0)
			compute_static_properties
		end

feature -- Access

	item_type: INTEGER is
			-- Determine the data type of the expression, if possible
		do
			Result := Integer_type
		end

feature -- Status report

	required_type (argument_number: INTEGER): XM_XPATH_SEQUENCE_TYPE is
			-- Type of argument number `argument_number'
		do
			-- This cannot be called for `Current', as it has no arguments.
			-- Therefore the pre-condition cannot be met, so we will not
			--  attempt to meet the post-condition.

			do_nothing
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			create intrinsic_dependencies.make (1, 6)
			-- Now all are `False'
			intrinsic_dependencies.put (True, 4) -- Depends_upon_last
			are_intrinsic_dependencies_computed := True
		end

feature -- Evaluation

	evaluated_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate as a single item
		do
			create {XM_XPATH_INTEGER_VALUE} Result.make (a_context.last)
		end

	early_evaluation (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Pre-evaluate `Current' at compile time.
		do
			Result := Current
		end
	
feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
	
