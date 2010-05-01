note

	description:

		"XPath Parent Node Expressions - '..' or 'parent::node()'"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PARENT_NODE_EXPRESSION

inherit

	XM_XPATH_SINGLE_NODE_EXPRESSION
		redefine
			same_expression, is_parent_node_expression, as_parent_node_expression
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create intrinsic dependencies.
		do
			initialize_intrinsic_dependencies
			set_intrinsically_depends_upon_context_item												
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_parent_node_expression: BOOLEAN is
			-- Is `Current' a parent node expression?
		do
			Result := True
		end

	as_parent_node_expression: XM_XPATH_PARENT_NODE_EXPRESSION is
			-- `Current' seen as a parent node expression
		do
			Result := Current 
		end

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		local
			an_item: XM_XPATH_ITEM
		do
			an_item := a_context.context_item
			if not an_item.is_node then
				Result := Void
			else
				Result := an_item.as_node.parent
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_parent_node_expression
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Is the dynamic context in a suitable condition to call `node'?
		do
			Result := a_context /= Void and then a_context.context_item /= Void
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "..")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature {NONE} -- Implementation

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE is
			-- Dynamic error value
		do
			if a_context = Void then
				create Result.make_from_string 	("Evaluating '/': dynamic the context is not available", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			else
					check
						a_context.context_item = Void
						-- follows from pre-condition
					end
				create Result.make_from_string ("Evaluating 'parent::node()': the context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			end
		end

end
