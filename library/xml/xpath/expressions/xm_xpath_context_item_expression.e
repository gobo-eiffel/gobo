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
			compute_intrinsic_dependencies, iterator, evaluate_item, same_expression
		end

creation

	make

feature {NONE} -- Initialization

	make is
		do
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access
	
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
		local
			another_context_item: XM_XPATH_CONTEXT_ITEM_EXPRESSION
		do
			another_context_item ?= other
			Result := another_context_item /= Void
		end
	
feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), ".")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
			end
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of an expression and its subexpressions
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
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not set", 2, Dynamic_error)				
			end
		end

	iterator (a_context: XM_XPATH_CONTEXT): XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ITEM] is
			-- Iterator over the values of a sequence
		do
			if a_context /= Void and then a_context.is_context_position_set then
				create {XM_XPATH_SINGLETON_ITERATOR [XM_XPATH_ITEM]} Result.make (a_context.context_item)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("The context item is not set", 2, Dynamic_error)
			end
		end
	
feature {NONE} -- Implementation
	
	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
