note

	description:

		"XPath Root Node Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2015, Colin Adams and others"
	license: "MIT License"

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

	make
			-- Create intrinsic dependencies.
		do
			compute_static_properties
			initialized := True
		ensure
			static_properties_computed: are_static_properties_computed
		end

feature -- Access

	is_root_expression: BOOLEAN
			-- Is `Current' a root expression?
		do
			Result := True
		end

	as_root_expression: XM_XPATH_ROOT_EXPRESSION
			-- `Current' seen as a root expression
		do
			Result := Current
		end

	item_type: XM_XPATH_ITEM_TYPE
			-- Determine the data type of the expression, if possible
		do
			Result := document_node_kind_test
			if Result /= Void then
				-- Bug in SE 1.0 and 1.1: Make sure that
				-- that `Result' is not optimized away.
			end
		end

	node (a_context: XM_XPATH_CONTEXT): detachable XM_XPATH_NODE
			-- The single node
		local
			a_document: detachable XM_XPATH_DOCUMENT
		do
			check
				attached a_context.context_item as l_context_item
				is_node: l_context_item.is_node
				-- from pre-condition
			then
				a_document := l_context_item.as_node.document_root
				check
					is_document: a_document /= Void -- TODO: as_document
					-- from pre-condition
				end
				Result := a_document
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN
			-- Are `Current' and `other' the same expression?
		do
			Result := other.is_root_expression
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN
			-- Is the dynamic context in a suitable condition to call `node'?
		do
			if a_context /= Void and then attached a_context.context_item as l_context_item then
				if l_context_item.is_node then
					Result := l_context_item.as_node.document_root /= Void
				end
			end
		end

	display (a_level: INTEGER)
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "/")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Status setting

	compute_intrinsic_dependencies
			-- Determine the intrinsic dependencies of an expression.
		do
			set_intrinsically_depends_upon_context_item
			set_intrinsically_depends_upon_context_document
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

feature {NONE} -- Implementation

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE
			-- Dynamic error value
		do
			if a_context = Void then
				create Result.make_from_string ("Evaluating '/': the dynamic context is not available", Xpath_errors_uri, "XPDY0002", Dynamic_error)
			else
				if not attached a_context.context_item as l_context_item then
					create Result.make_from_string ("Evaluating '/': the context item is not set", Xpath_errors_uri, "XPDY0002", Dynamic_error)
				else
					if not l_context_item.is_node then
						create Result.make_from_string ("Evaluating '/': the context item is not a node", Xpath_errors_uri, "XPTY0020", Type_error)
					else
						check
							no_document_node: l_context_item.as_node.document_root = Void
							-- follows from pre-condition
						end
						create Result.make_from_string ("Evaluating '/': the root of the tree containing the context item is not a document node", Xpath_errors_uri, "XPDY0050", Type_error)
					end
				end
			end
		end

end
