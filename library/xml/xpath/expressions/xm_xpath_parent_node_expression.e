indexing

	description:

		"XPath Parent Node Expressions - '..' or 'parent::node()'"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_PARENT_NODE_EXPRESSION

inherit

	XM_XPATH_SINGLE_NODE_EXPRESSION
		redefine
			same_expression
		end

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create intrinsic dependencies.
		do
			create intrinsic_dependencies.make (1, 6)
			intrinsic_dependencies.put (True, 2) -- depends_upon_context_item												
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
			--if an_item = Void then
			--	set_last_error_from_string ("Evaluating 'parent::node()': the context item is not set", 2, Dynamic_error)
			--else
			a_node ?= an_item
			if a_node = Void then
				Result := Void
			else
				Result := a_node.parent
			end
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			another_parent: XM_XPATH_PARENT_NODE_EXPRESSION
		do
			another_parent ?= other
			Result := another_parent /= Void
		end

feature -- Status report

	is_valid_context_for_node (a_context: XM_XPATH_CONTEXT): BOOLEAN is
			-- Is the dynamic context in a suitable condition to call `node'?
		do
			Result := a_context /= Void and then a_context.context_item /= Void
		end

	display (a_level: INTEGER; a_pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indentation (a_level), "..")
			std.error.put_string (a_string)
			if is_error then
				std.error.put_string (" in error%N")
			else
				std.error.put_new_line
			end
		end

feature {NONE} -- Implementation

	dynamic_error_value (a_context: XM_XPATH_CONTEXT): XM_XPATH_ERROR_VALUE is
			-- Dynamic error value
		do
			if a_context = Void then
				create Result.make_from_string 	("Evaluating '/': dynamic the context is not avaialable", 2, Dynamic_error)
			else
					check
						a_context.context_item = Void
						-- follows from pre-condition
					end
				create Result.make_from_string ("Evaluating 'parent::node()': the context item is not set", 2, Dynamic_error)
			end
		end

end
