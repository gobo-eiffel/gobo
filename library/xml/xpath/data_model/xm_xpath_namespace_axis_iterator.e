indexing

	description:

		"Objects that iterate over an XPath namespace axis"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XPATH_NAMESPACE_AXIS_ITERATOR

inherit
	
	XM_XPATH_AXIS_ITERATOR [XM_XPATH_NAMESPACE_NODE]
		redefine
			item, before, after, start
		end

	XM_XPATH_STANDARD_NAMESPACES
		export {NONE} all end

	XM_XPATH_TYPE
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (an_element: XM_XPATH_ELEMENT; a_node_test: XM_XPATH_NODE_TEST) is
			-- Establish invariant.
		require
			element_exists: an_element /= Void
			node_test_exists: a_node_test /= Void
		local
			some_undeclared_prefixes: DS_HASH_SET [INTEGER]
			some_declared_codes: DS_HASH_SET [INTEGER]
			some_codes: DS_ARRAYED_LIST [INTEGER]
			a_node: XM_XPATH_NODE
			a_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			a_uri_code, a_prefix_code: INTEGER --_16
		do
			element := an_element
			node_test := a_node_test
			create some_declared_codes.make_default
			create some_undeclared_prefixes.make_default
			some_declared_codes.put (Xml_namespace_code)
			from
				a_node := element
			until a_node = Void or else a_node.node_type /= Element_node loop
				some_codes := a_node.as_element.declared_namespaces
				from a_cursor := some_codes.new_cursor; a_cursor.start until a_cursor.after loop
					a_uri_code := uri_code_from_namespace_code (a_cursor.item)
					a_prefix_code := prefix_code_from_namespace_code (a_cursor.item)
					if a_uri_code = Default_uri_code then

						-- A namespace undeclaration

						some_undeclared_prefixes.force_last (a_prefix_code)
					else
						if not some_undeclared_prefixes.has (a_prefix_code) then
							some_undeclared_prefixes.force_new (a_prefix_code)
							some_declared_codes.force_last (a_cursor.item)
						end
					end
				end
				a_node := a_node.parent
			end
			cursor := some_declared_codes.new_cursor
		ensure
			element_set: element = an_element
			node_test_set: node_test = a_node_test
			cursor_before: cursor /= Void and then cursor.before
		end

feature -- Access

	item: XM_XPATH_NAMESPACE_NODE
			-- Node at the current position
	
feature -- Status report

	before: BOOLEAN is
			-- Has `start' been called yet on this sequence?
		do
			Result := cursor.before
		end

	after: BOOLEAN is
			-- Are there any more items in the sequence?
		do
			Result := cursor.after
		end

feature -- Cursor movement

	start is
			-- Move to first position
		do
			cursor.start; position := 1
			from
				create item.make (element, cursor.item, position)
			until cursor.after or else node_test.matches_item (item) loop
				cursor.forth; position := position + 1
				create item.make (element, cursor.item, position)
			end
			index := 1
		end
			
	forth is
			-- Move to next position
		do
			cursor.forth; position := position + 1
			from
				create item.make (element, cursor.item, position)
			until cursor.after or else node_test.matches_item (item) loop
				cursor.forth; position := position + 1
				create item.make (element, cursor.item, position)
			end
			index := index + 1
		end

feature -- Duplication

	another: like Current is
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (element, node_test)
		end

feature {NONE} -- Implementation

	element: XM_XPATH_ELEMENT
			-- Element whose namespaces will be iterated over

	node_test: XM_XPATH_NODE_TEST
			-- Node test for selective iteration

	cursor: DS_HASH_SET_CURSOR [INTEGER]
		-- Cursor over accumulated namespace codes

	position: INTEGER
			-- Position of namespace on axis, ignoring `node_test'

	advance is
			-- Move to the next position
		do
			-- Not used
		end

invariant

	element_exists: element /= Void
	node_test_exists: node_test /= Void

end
	
