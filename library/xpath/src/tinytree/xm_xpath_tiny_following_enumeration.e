note

	description:

		"Objects that enumerate the following:: Axis"

	library: "Gobo Eiffel XPath Library"
	copyright: "Copyright (c) 2004-2014, Colin Adams and others"
	license: "MIT License"

class XM_XPATH_TINY_FOLLOWING_ENUMERATION

inherit

	XM_XPATH_AXIS_ITERATOR [XM_XPATH_TINY_NODE]
		redefine
			start, as_node_iterator
		end

	XM_XPATH_NAME_UTILITIES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make (a_document: XM_XPATH_TINY_FOREST; a_starting_node: XM_XPATH_TINY_NODE; a_node_test: XM_XPATH_NODE_TEST; descendants: BOOLEAN)
			-- Establish invariant
		require
			document_not_void: a_document /= Void
			starting_node_not_void: a_starting_node /= Void
			node_test_not_void: a_node_test /= Void
		do
			document := a_document
			starting_node := a_starting_node
			node_test := a_node_test
			include_descendants := descendants
		ensure
			document_set: document = a_document
			starting_node_set: starting_node = a_starting_node
			test_set: node_test = a_node_test
			include_descendants: include_descendants = descendants
		end

feature -- Access

	as_node_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			-- `Current' seen as a node iterator
		do
			Result := Current
		end

feature -- Cursor movement

		start
			-- Move to next position
		do
			forth
		end

	forth
			-- Move to next position
		local
			l_node_number: INTEGER
			l_found, l_valid: BOOLEAN
		do
			from
				index := index + 1
				if index = 1 then
					l_node_number := initial_node_number
				else
					check was_not_before_and_not_after: attached current_item as l_current_item then
						l_node_number := l_current_item.node_number + 1
						if l_node_number = -1 then
							current_item := Void
							l_found := True
						end
					end
				end
			until
				l_found
			loop
				l_valid := document.is_node_number_valid (l_node_number)
				if not l_valid then
					current_item := Void
					l_found := True
				elseif document.depth_of (l_node_number) = 1 then
					current_item := Void
					l_found := True
				else
					if l_valid and then node_test.matches_node (document.retrieve_node_kind (l_node_number),
					                                            fingerprint_from_name_code (document.retrieve_name_code (l_node_number)),
																			  document.element_annotation (l_node_number)) then
						current_item := document.retrieve_node (l_node_number)
						l_found := True
					else
						l_node_number := l_node_number + 1
					end
				end
			end
		end

feature -- Duplication

	another: like Current
			-- Another iterator that iterates over the same items as the original
		do
			create Result.make (document, starting_node, node_test, include_descendants)
		end

feature {NONE} -- Implemnentation

	document: XM_XPATH_TINY_FOREST
			-- The document within which we enumerate

	starting_node: XM_XPATH_TINY_NODE
			-- The starting node for the enumeration

	node_test: XM_XPATH_NODE_TEST
			-- The node test to apply when selecting nodes

	include_descendants: BOOLEAN
			-- Do we include descendants in the enumeration?
			-- For elements, no, for attributes and namespaces, yes.

	advance
			-- Move to the next matching node
		do
			-- not used
		end

	initial_node_number: INTEGER
			-- Node number to try first
		require
			first_item: index = 1
		local
			l_next: INTEGER
			l_found: BOOLEAN
		do
			Result := starting_node.node_number
			if include_descendants then
				Result := Result + 1
			else
				from
				until
					l_found
				loop
					if document.is_node_number_valid (Result) then
						l_next := document.retrieve_next_sibling (Result)
						if l_next > Result then
							l_found := True
							Result := l_next
						elseif not document.is_node_number_valid (l_next) then
							l_found := True
							Result := -1
						elseif document.depth_of (l_next) = 1 then
							l_found := True
							Result := -1
						else
							Result := l_next
						end
					else
						l_found := True
						Result := -1
					end
				end
			end
		end

invariant

	document_not_void: document /= Void
	starting_node_not_void: starting_node /= Void
	node_test_not_void: node_test /= Void

end

