note

	description:

		"XPath Single Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

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

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := any_node_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	node (a_context: XM_XPATH_CONTEXT): detachable XM_XPATH_NODE
			-- The single node
		require
			dynamic_context: is_valid_context_for_node (a_context)
		deferred
		ensure
			May_be_an_empty_node_set: True
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN
			-- Is the dynamic context in a suitable condition to call `node'?
		deferred
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			if a_context_item_type = Void then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (
					"Cannot select a node here: the context item is undefined", Xpath_errors_uri, "XPDY0002", Type_error))
			elseif a_context_item_type.is_atomic_type then
				set_replacement (a_replacement, create {XM_XPATH_INVALID_VALUE}.make_from_string (
					"Cannot select a node here: the context item is an atomic value", Xpath_errors_uri, "XPTY0020", Type_error))
			else
				a_replacement.put (Current)
			end
		end

	optimize (a_replacement: DS_CELL [detachable XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: detachable XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do
			-- Repeat the check: in XSLT insufficient information is available the first time.

			check_static_type (a_replacement, a_context, a_context_item_type)
		end

feature -- Evaluation

	calculate_effective_boolean_value (a_context: XM_XPATH_CONTEXT)
			-- Effective boolean value
		local
			l_last_boolean_value: like last_boolean_value
		do
			if is_valid_context_for_node (a_context) then
				create last_boolean_value.make (node (a_context) /= Void)
			else
				create l_last_boolean_value.make (False)
				l_last_boolean_value.set_last_error (dynamic_error_value (a_context))
				last_boolean_value := l_last_boolean_value
			end
		end

	evaluate_item (a_result: DS_CELL [detachable XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			if is_valid_context_for_node (a_context) then
				a_result.put (node (a_context))
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make (dynamic_error_value (a_context)))
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over the values of a sequence
		do
			if is_valid_context_for_node (a_context) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (node (a_context))
			else
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make (dynamic_error_value (a_context))
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			if is_valid_context_for_node (a_context) then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (node (a_context))
			else
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_iterator.make (dynamic_error_value (a_context))
			end
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_optional
		end

	compute_special_properties
			-- Compute special properties.
		do
			initialize_special_properties
			set_context_document_nodeset
			set_single_document_nodeset
			set_ordered_nodeset
			set_non_creating
		end

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE
			-- Dynamic error value
		require
			invalid_context: not is_valid_context_for_node (a_context)
		deferred
		ensure
			error_value_not_void: Result /= Void
		end

end
