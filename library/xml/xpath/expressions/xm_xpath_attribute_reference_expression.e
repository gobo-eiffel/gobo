indexing

	description:

		"XPath Attribute Reference Expressions"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_ATTRIBUTE_REFERENCE_EXPRESSION

inherit

	XM_XPATH_SINGLE_NODE_EXPRESSION
		redefine
			compute_special_properties, same_expression, evaluate_as_string
		end

	XM_XPATH_AXIS

creation

	make

feature {NONE} -- Initialization

	make (a_fingerprint: INTEGER) is
			-- Create intrinsic dependencies, and establish invariant.
		require
			positive_fingerprint: fingerprint > 0
		do
			fingerprint := a_fingerprint
			create name_test.make (Attribute_node, a_fingerprint) 
			create intrinsic_dependencies.make (1, 6)
			intrinsic_dependencies.put (True, 2) -- depends_upon_context_item
			compute_static_properties
		ensure
			fingerprint_set: fingerprint = a_fingerprint
		end

feature -- Access

	node (a_context: XM_XPATH_CONTEXT): XM_XPATH_NODE is
			-- The single node
		local
			an_element: XM_XPATH_ELEMENT
		do
			an_element := find_element_node (a_context)
			Result := find_attribute_node (an_element)
		end

feature -- Comparison

	same_expression (other: XM_XPATH_EXPRESSION): BOOLEAN is
			-- Are `Current' and `other' the same expression?
		local
			another_attribute: XM_XPATH_ATTRIBUTE_REFERENCE_EXPRESSION
		do
			another_attribute ?= other
			Result := another_attribute /= Void and then another_attribute.fingerprint = fingerprint
		end

feature -- Status report

	display (a_level: INTEGER; pool: XM_XPATH_NAME_POOL) is
			-- Diagnostic print of expression structure to `std.error'
		local
			a_string: STRING
		do
			a_string := STRING_.appended_string (indent (a_level), "@")
			a_string := STRING_.appended_string (a_string, fingerprint.out)
			std.error.put_string (a_string)
			std.error.put_new_line
		end

feature -- Evaluation

	evaluate_as_string (a_context: XM_XPATH_CONTEXT): XM_XPATH_STRING_VALUE is
			-- Evaluate `Current' as a String
		local
			an_element: XM_XPATH_ELEMENT
			a_string: STRING
		do
			an_element := find_element_node (a_context)
			if an_element = Void then
				create Result.make ("")
			else
				a_string := an_element.attribute_value (fingerprint)
				if a_string = Void then
					create Result.make ("")
				else
					create Result.make (a_string)
				end
			end
		end

feature {XM_XPATH_EXPRESSION} -- Restricted

	compute_special_properties is
			-- Compute special properties.
		do
			set_attribute_ns_nodeset
		end

feature {XM_XPATH_ATTRIBUTE_REFERENCE_EXPRESSION} -- Local

	fingerprint: INTEGER
			-- Fingerprint of name in name_pool

feature {NONE} -- Implementation


	name_test: XM_XPATH_NAME_TEST
			-- Test if a node matches `Current'

	find_element_node (a_context: XM_XPATH_CONTEXT): XM_XPATH_ELEMENT is
			-- The parent element
		require
			context_not_void: a_context /= Void
		local
			an_item: XM_XPATH_ITEM
			an_element: XM_XPATH_ELEMENT
		do
			an_item := a_context.context_item
			if an_item = Void then
				set_last_error_from_string ("Evaluating 'attribute::node()': the context item is not set", 2, Dynamic_error)
			else
				an_element ?= an_item
				Result := an_element -- may be Void!
			end
		end

	find_attribute_node (an_element: XM_XPATH_ELEMENT): XM_XPATH_ATTRIBUTE is
			-- The referenced attribute
		require
			element_not_void: an_element /= Void
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			if an_element = Void then
				Result := Void
			else
				an_iterator := an_element.new_axis_iterator_with_node_test (Attribute_axis, name_test)
					check
						before: an_iterator.before
					end
				if not an_iterator.after then
					an_iterator.forth
					Result ?= an_iterator.item_for_iteration
				end
			end
		end

invariant

	positive_fingerprint: fingerprint > 0
	name_test_not_void: name_test /= Void

end
