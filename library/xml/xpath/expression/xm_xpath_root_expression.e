indexing

	description:

		"XPath Root Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ROOT_EXPRESSION

inherit

	XM_XPATH_SINGLE_NODE_EXPRESSION
		redefine
			same_expression, compute_cardinality, item_type, compute_intrinsic_dependencies,
			is_root_expression, as_root_expression
		end

	XM_XPATH_SHARED_NODE_KIND_TESTS
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create intrinsic dependencies.
		do
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access

	is_root_expression: BOOLEAN is
			-- Is `Current' a root expression?
		do
			Result := True
		end

	as_root_expression: XM_XPATH_ROOT_EXPRESSION is
			-- `Current' seen as a root expression
		do
			Result := Current
		end
	
	item_type: XM_XPATH_ITEM_TYPE is
			-- Determine the data type of the expression, if possible
		do
			Result := document_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		local
			a_document: XM_XPATH_DOCUMENT
		do
			check
				is_node: a_context.context_item.is_node
				-- from pre-condition
			end
			a_document := a_context.context_item.as_node.document_root
			check
				is_document: a_document /= Void -- TODO: as_document
				-- from pre-condition
			end
			Result := a_document
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_root_expression
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Is the dynamic context in a suitable condition to call `node'?
		do
			if a_context /= Void and then a_context.context_item /= Void then
				if a_context.context_item.is_node then
					Result := a_context.context_item.as_node.document_root /= Void
				end
			end
		end

	display (a_level: INTEGER) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "/")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies is
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
			set_intrinsically_depends_upon_context_document
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE is
			-- Dynamic error value
		do
			if a_context = Void then
				create Result.make_from_string ("Evaluating '/': the dynamic context is not available", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			else
				if a_context.context_item = Void then
					create Result.make_from_string ("Evaluating '/': the context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
				else
					if not a_context.context_item.is_node then
						create Result.make_from_string ("Evaluating '/': the context item is not a node", Xpath_errors_uri, "XPTY0020", Type_error)
					else
						check
							no_document_node: a_context.context_item.as_node.document_root = Void
							-- follows from pre-condition
						end
						create Result.make_from_string ("Evaluating '/': the root of the tree containing the context item is not a document node", Xpath_errors_uri, "XPTY0020", Type_error)
					end
				end
			end
		end

end
