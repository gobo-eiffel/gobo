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
		redefine
			iterator, evaluated_item, effective_boolean_value
		end

	-- N.B. This class is supposed to have intrinsic dependency on the context item
	-- But check this out for each concrete sub-class.

feature -- Access
	
	item_type: INTEGER is
			--Determine the data type of the expression, if possible
		do
			Result := Any_node
		end

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		require
			context_not_void: a_context /= Void
		deferred
		ensure
			May_be_an_empty_node_set: True
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (node (a_context)) 
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT): XM_XPATH_EXPRESSION is
			-- Perform static analysis of `Current' and its subexpressions
		do
			Result := Current
			Result.set_analyzed			
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			create Result.make (node (a_context) /= Void)
		end

	evaluated_item (a_context: XM_XPATH_CONTEXT): XM_XPATH_ITEM is
			-- Evaluate `Current' as a single item
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM]
		do
			Result := node (a_context)
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

end
