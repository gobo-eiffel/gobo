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
			same_expression, compute_cardinality
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create intrinsic dependencies.
		do
			create intrinsic_dependencies.make (1, 6)
			intrinsic_dependencies.put (True, 5) -- depends_upon_context_document
			compute_static_properties
			initialize
		ensure
			static_properties_computed: are_static_properties_computed			
		end

feature -- Access

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		local
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
			a_document: XM_XPATH_DOCUMENT
		do
			an_item := a_context.context_item
			a_node ?= an_item
				check
					a_node /= void
					-- from pre-condition
				end
			a_document := a_node.document_root
				check
					a_document /= Void
					-- from pre-condition
				end
			Result := a_document
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			another_root: XM_XPATH_ROOT_EXPRESSION
		do
			another_root ?= other
			Result := another_root /= Void
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Is the dynamic context in a suitable condition to call `node'?
		local
			a_node: XM_XPATH_NODE
		do
			if a_context /= Void and then a_context.context_item /= Void then
				a_node ?= a_context.context_item
				if a_node /= Void then
					Result := a_node.document_root /= Void
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
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
			end
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
		local
			an_item: XM_XPATH_ITEM
			a_node: XM_XPATH_NODE
		do
			if a_context = Void then
				create Result.make_from_string ("Evaluating '/': the dynamic context is not available", "XP0002", Dynamic_error)
			else
				an_item := a_context.context_item
				if an_item = Void then
					create Result.make_from_string ("Evaluating '/': the context item is not set", "XP0002", Dynamic_error)
				else
					a_node ?= an_item
					if a_node = Void then
						create Result.make_from_string ("Evaluating '/': the context item is not a node", "XP0020", Type_error)
					else
							check
								a_node.document_root = Void
								-- follows from pre-condition
							end
						create Result.make_from_string ("Evaluating '/': the root of the tree containing the context item is not a document node", "XP0020", Type_error)
					end
				end
			end
		end

end
