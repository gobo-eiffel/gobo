indexing

	description:

		"XPath Expressions representing the context item (.)"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_CONTEXT_ITEM_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			compute_intrinsic_dependencies, create_iterator, evaluate_item, same_expression,
			compute_special_properties, is_context_item, as_context_item
		end

create

	make

feature {NONE} -- Initialization

	make is
		do
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access

	is_context_item: BOOLEAN is
			-- Is `Current' a context-item expression?
		do
			Result := True
		end

	as_context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION is
			-- `Current' seen as a context-item expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := any_item
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_context_item
		end
	
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), ".")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization
	
	check_static_type (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static type-checking of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

	optimize (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform optimization of `Current' and its subexpressions.
		do
			mark_unreplaced
		end

feature -- Evaluation

	evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			if a_context /= Void and then a_context.is_context_position_set then
				last_evaluated_item := a_context.context_item
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)				
			end
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
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
	
feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

	compute_special_properties is
			-- Compute special properties.
		do
			Precursor
			set_non_creating
		end

end
