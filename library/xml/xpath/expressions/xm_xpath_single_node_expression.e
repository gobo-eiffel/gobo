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
			iterator, evaluate_item, effective_boolean_value, compute_intrinsic_dependencies
		end

	-- N.B. This class is supposed to have intrinsic dependency on the context item
	-- But check this out for each concrete sub-class.

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		require
			dynamic_context: is_valid_context_for_node (a_context)
		deferred
		ensure
			May_be_an_empty_node_set: True
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Is the dynamic context in a suitable condition to call `node'?
		deferred
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end
			
feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
		end

feature -- Evaluation

	effective_boolean_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_BOOLEAN_VALUE is
			-- Effective boolean value
		do
			if is_valid_context_for_node (a_context) then
				create Result.make (node (a_context) /= Void)
			else
				create Result.make (False)
				Result.set_last_error (dynamic_error_value (a_context))
			end
		end

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			if is_valid_context_for_node (a_context) then
				last_evaluated_item := node (a_context)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make (dynamic_error_value (a_context))
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			if is_valid_context_for_node (a_context) then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (node (a_context))
			else
				create {XM_XPATH_INVALID_ITERATOR} Result.make (dynamic_error_value (a_context))
			end
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE is
			-- Dynamic error value
		require
			invalid_context: not is_valid_context_for_node (a_context)
		deferred
		ensure
			error_value_not_void: Result /= Void
		end

end
