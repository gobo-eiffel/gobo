indexing

	description:

		"XPath Single Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SINGLE_NODE_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Any_node
		end

feature -- Analysis

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			Result := Current
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			-- TODO
		end

	-- set_intrinsic_dependencies et. al.
end
