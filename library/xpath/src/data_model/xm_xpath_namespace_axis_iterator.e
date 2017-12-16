note

	description:

		"Objects that iterate over an XPath namespace axis"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005-2014, Colin Adams and others"
	license: "MIT License"
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

	make (a_element: XM_XPATH_ELEMENT; a_node_test: XM_XPATH_NODE_TEST)
			-- Establish invariant.
		require
			element_not_void: a_element /= Void
			node_test_not_void: a_node_test /= Void
		local
			l_undeclared_prefixes: DS_HASH_SET [INTEGER]
			l_declared_codes: DS_HASH_SET [INTEGER]
			l_codes: DS_ARRAYED_LIST [INTEGER]
			l_node: detachable XM_XPATH_NODE
			l_cursor: DS_ARRAYED_LIST_CURSOR [INTEGER]
			l_uri_code, l_prefix_code: INTEGER --_16
		do
			element := a_element
			node_test := a_node_test
			create l_declared_codes.make_default
			create l_undeclared_prefixes.make_default
			l_declared_codes.put (Xml_namespace_code)
			from
				l_node := element
			until l_node = Void or else l_node.node_type /= Element_node loop
				l_codes := l_node.as_element.declared_namespaces
				from l_cursor := l_codes.new_cursor; l_cursor.start until l_cursor.after loop
					l_uri_code := uri_code_from_namespace_code (l_cursor.item)
					l_prefix_code := prefix_code_from_namespace_code (l_cursor.item)
					if l_uri_code = Default_uri_code then

						-- A namespace undeclaration

						l_undeclared_prefixes.force_last (l_prefix_code)
					else
						if not l_undeclared_prefixes.has (l_prefix_code) then
							l_undeclared_prefixes.force_new (l_prefix_code)
							l_declared_codes.force_last (l_cursor.item)
						end
					end
					l_cursor.forth
				end
				l_node := l_node.parent
			end
			cursor := l_declared_codes.new_cursor
		ensure
			element_set: element = a_element
			node_test_set: node_test = a_node_test
			cursor_before: cursor /= Void and then cursor.before
		end

feature -- Access

	item: XM_XPATH_NAMESPACE_NODE
			-- Node at the current position
		do
			check precondition_not_off: attached internal_item as l_internal_item then
				Result := l_internal_item
			end
		end
feature -- Status report

	before: BOOLEAN
			-- Has `start' been called yet on this sequence?
		do
			Result := cursor.before
		end

	after: BOOLEAN
			-- Are there any more items in the sequence?
		do
			Result := cursor.after
		end

feature -- Cursor movement

	start
			-- Move to first position
		do
			cursor.start; position := 1
			from
				if not cursor.after then
					create internal_item.make (element, cursor.item, position)
				end
			until
				cursor.after or else node_test.matches_item (item, False)
			loop
				cursor.forth
				position := position + 1
				if not cursor.after then
					create internal_item.make (element, cursor.item, position)
				end
			end
			index := 1
		end

	forth
			-- Move to next position
		do
			cursor.forth; position := position + 1
			from
				if not cursor.after then
					create internal_item.make (element, cursor.item, position)
				end
			until
				cursor.after or else node_test.matches_item (item, False)
			loop
				cursor.forth; position := position + 1
				if not cursor.after then
					create internal_item.make (element, cursor.item, position)
				end
			end
			index := index + 1
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (element, node_test)
		end

feature {NONE} -- Implementation

	internal_item: detachable XM_XPATH_NAMESPACE_NODE
			-- Node at the current position

	element: XM_XPATH_ELEMENT
			-- Element whose namespaces will be iterated over

	node_test: XM_XPATH_NODE_TEST
			-- Node test for selective iteration

	cursor: DS_HASH_SET_CURSOR [INTEGER]
		-- Cursor over accumulated namespace codes

	position: INTEGER
			-- Position of namespace on axis, ignoring `node_test'

	advance
			-- Move to the next position
		do
			-- Not used
		end

invariant

	element_not_void: element /= Void
	node_test_not_void: node_test /= Void

end

