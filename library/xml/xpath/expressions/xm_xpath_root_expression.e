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
			if an_item = Void then
				set_last_error_from_string ("Evaluating '/': the context item is not set", 2, Dynamic_error)
			else
				a_node ?= an_item
				if a_node = Void then
					set_last_error_from_string ("Evaluating '/': the context item is not a node", 20, Type_error)
				
				else
					a_document := a_node.document_root
					if a_document = Void then
						set_last_error_from_string ("Evaluating '/': the root of the tree containing the context item is not a document node", 20, Type_error)
					else
						Result := a_document
					end
				end
			end
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

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "/")
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_cardinality is
			-- Compute cardinality.
		do
			set_cardinality_exactly_one
		end

end
