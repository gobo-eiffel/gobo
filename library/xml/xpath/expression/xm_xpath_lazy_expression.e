note

	description:

	"Expressions that must not be evaluated eagerly, %
   %as a failure must not be reported until the value%
   %is referenced"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_LAZY_EXPRESSION

inherit

	XM_XPATH_UNARY_EXPRESSION
		redefine
			is_lazy_expression, as_lazy_expression, evaluate_item, create_iterator,
			create_node_iterator, generate_events
		end

create {XM_XPATH_EXPRESSION_FACTORY}

	make

feature {NONE} -- Initialization

	make (an_expression: XM_XPATH_EXPRESSION) is
			-- Establish invariant.
		require
			base_expression_not_void: an_expression /= Void
			base_expression_is_computed: an_expression.is_computed_expression
		do
			make_unary (an_expression)
		end

feature -- Conversion

	is_lazy_expression: BOOLEAN is
			-- Is `Current' a lazy expression?
		do
			Result := True
		end

	as_lazy_expression: XM_XPATH_LAZY_EXPRESSION is
			-- `Current' seen as a lazy expression
		do
			Result := Current
		end
	
feature -- Evaluation

	evaluate_item (a_result: DS_CELL [XM_XPATH_ITEM]; a_context: XM_XPATH_CONTEXT) is
			-- Evaluate as a single item to `a_result'.
		do
			base_expression.evaluate_item (a_result, a_context)
		end

	create_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the values of a sequence
		do
			base_expression.create_iterator (a_context)
			last_iterator := base_expression.last_iterator
		end

	create_node_iterator (a_context: XM_XPATH_CONTEXT) is
			-- Iterator over the nodes of a sequence
		do
			base_expression.create_node_iterator (a_context)
			last_node_iterator := base_expression.last_node_iterator
		end

	generate_events (a_context: XM_XPATH_CONTEXT) is
			-- Execute `Current' completely, writing results to the current `XM_XPATH_RECEIVER'.
		do
			base_expression.generate_events (a_context)
		end

feature {XM_XPATH_UNARY_EXPRESSION} -- Restricted
	
	display_operator: STRING is
			-- Format `operator' for display
		do
			Result := "lazy"
		end

invariant

	base_expression_is_computed: base_expression.is_computed_expression

end
