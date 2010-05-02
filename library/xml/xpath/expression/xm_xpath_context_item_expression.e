note

	description:

		"XPath Expressions representing the context item (.)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT_ITEM_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			compute_intrinsic_dependencies, create_iterator, evaluate_item, same_expression,
			compute_special_properties, is_context_item, as_context_item, create_node_iterator
		end

create

	make, make_current

feature {NONE} -- Initialization

	make
			-- Initialize `Current' as a normal context item expression.
		do
			compute_static_properties
			item_type := any_item
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			not_current_replacement: not is_current_replacement
		end

	make_current
			-- Initialize `Current' as a replacement for fn:current().
		do
			make
			is_current_replacement := True
		ensure
			static_properties_computed: are_static_properties_computed
			current_replacement: is_current_replacement
		end

feature -- Access

	is_context_item: BOOLEAN
			-- Is `Current' a context-item expression?
		do
			Result := True
		end

	as_context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION
			-- `Current' seen as a context-item expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			--Determine the data type of the expression, if possible

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_context_item
		end

feature -- Status report

	is_current_replacement: BOOLEAN
			-- Is `Current' a replacement for fn:current()?

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), ".")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization

	check_static_type (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			if a_context_item_type = Void then
				if is_current_replacement then
					set_last_error_from_string ("The context item is undefined at this point", Xpath_errors_uri, "XTDE1360", Type_error)
				else
					set_last_error_from_string ("The context item is undefined at this point", Xpath_errors_uri, "XPDY0002", Type_error)
				end
			else
				item_type := a_context_item_type
			end
			a_replacement.put (Current)
		end

	optimize (a_replacement: DS_CELL [XM_XPATH_EXPRESSION]; a_context: XM_XPATH_STATIC_CONTEXT; a_context_item_type: XM_XPATH_ITEM_TYPE)
			-- Perform optimization of `Current' and its subexpressions.
		do

			-- In XSLT, we don't catch this error in `check_static_type'
			--  because it's done one XPath expression,
			--  at a time. So we repeat the check here.

			check_static_type (a_replacement, a_context, a_context_item_type)
		end

feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT)
			-- Evaluate as a single item to `a_result'.
		do
			if a_context /= Void and then a_context.is_context_position_set then
				a_result.put (a_context.context_item)
			else
				a_result.put (create {XM_XPATH_INVALID_ITEM}.make_from_string ("The context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)				)
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT)
			-- Iterator over the values of a sequence
		do
			if a_context /= Void and then a_context.is_context_position_set then
				if a_context.context_item.is_node then
					create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_iterator.make (a_context.context_item.as_node)
				else
					create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} last_iterator.make (a_context.context_item)
				end
			else
				create {XM_XPATH_INVALID_ITERATOR} last_iterator.make_from_string ("The context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			end
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT)
			-- Create an iterator over a node sequence
		do
			if a_context /= Void and then a_context.is_context_position_set then
				create {XM_XPATH_SINGLETON_NODE_ITERATOR} last_node_iterator.make (a_context.context_item.as_node)
			else
				create {XM_XPATH_INVALID_NODE_ITERATOR} last_node_iterator.make_from_string ("The context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			end
		end

feature {NONE} -- Implementation

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end
