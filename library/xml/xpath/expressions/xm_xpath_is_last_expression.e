indexing

	description:

		"XPath is-last Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_IS_LAST_EXPRESSION

inherit

	XM_XPATH_COMPUTED_EXPRESSION
		redefine
			evaluate_item, compute_intrinsic_dependencies, compute_special_properties,
			is_last_expression, as_last_expression
		end

create

	make

feature {NONE} -- Initialization

	make (a_condition: BOOLEAN) is
			-- Set condition.
		do
			condition := a_condition
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
			condition_set: condition = a_condition
		end

feature -- Access
	
	item_type: XM_XPATH_ITEM_TYPE is
			--Determine the data type of the expression, if possible
		do
			Result := type_factory.boolean_type
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	condition: BOOLEAN
			-- Is position() eq last()?

	is_last_expression: BOOLEAN is
			-- Is `Current' an is-last expression?
		do
			Result := True
		end

	as_last_expression: XM_XPATH_IS_LAST_EXPRESSION is
			-- `Current' seen as an is-last expression
		do
			Result := Current
		end

feature -- Status setting

	
	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_position
			set_intrinsically_depends_upon_last
		end

feature -- Status report

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "isLast(" +condition.out + ")")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Optimization

	analyze (a_context: XM_XPATH_STATIC_CONTEXT) is
			-- Perform static analysis of `Current' and its subexpressions
		do
			mark_unreplaced
		end

feature -- Evaluation
	
		evaluate_item (a_context: XM_XPATH_CONTEXT) is
			-- Evaluate `Current' as a single item
		do
			if a_context.is_context_position_set then
				create {XM_XPATH_BOOLEAN_VALUE} last_evaluated_item.make (condition = a_context.is_at_last)
			else
				create {XM_XPATH_INVALID_ITEM} last_evaluated_item.make_from_string ("Context position is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			end
		end
	
feature {XM_XSLT_EXPRESSION} -- Restricted
	
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
