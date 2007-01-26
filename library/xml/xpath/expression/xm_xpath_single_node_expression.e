indexing

	description:

		"XPath Single Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_SINGLE_NODE_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			create_iterator, create_node_iterator,
			evaluate_item, calculate_effective_boolean_value, compute_intrinsic_dependencies, compute_special_properties
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

	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
			if a_context_item_type = Void then
				set_last_error_from_string ("Cannot select a node here: the context item is undefined", Xpath_errors_uri, "XPDY0002", Type_error)
			elseif a_context_item_type.is_atomic_type then
				set_last_error_from_string ("Cannot select a node here: the context item is an atomic value", Xpath_errors_uri, "XPTY0020", Type_error)
			end
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced

			-- Repeat the check: in XSLT insufficient information is available the first time.

			check_static_type (a_context, a_context_item_type)
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT) is
			-- Effective boolean value
		do
			if is_valid_context_for_node (a_context) then
				create last_boolean_value.make (node (a_context) /= Void)
			else
				create last_boolean_value.make (False)
				last_boolean_value.set_last_error (dynamic_error_value (a_context))
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

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over the values of a sequence
		do
			if is_valid_context_for_node (a_context) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (node (a_context))
			else
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (dynamic_error_value (a_context))
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Create an iterator over a node sequence
		do
			if is_valid_context_for_node (a_context) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (node (a_context))
			else
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (dynamic_error_value (a_context))
			end
		end

feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_optional
		end
	
	compute_special_properties is
			-- Compute special properties.
		do
			initialize_special_properties
			set_context_document_nodeset
			set_single_document_nodeset
			set_ordered_nodeset
			set_non_creating
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
