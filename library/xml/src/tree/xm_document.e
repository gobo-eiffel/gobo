note

	description:

		"XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

class XM_DOCUMENT

inherit

	XM_COMPOSITE
		redefine
			last,
			root_node
		end

create

	make,
	make_with_root_named

feature {NONE} -- Initialization

	make
			-- Create root node.
		do
			make_with_root_named (Default_name, Default_ns)
		end

	make_with_root_named (a_name: STRING; a_ns: XM_NAMESPACE)
			-- Create root node, with a root_element
			-- with given name.
		require
			not_void: a_name /= Void
			not_empty: a_name.count > 0
			a_ns_not_void: a_ns /= Void
		do
			create children.make
			create root_element.make (Current, a_name, a_ns)
			force_last (root_element)
		ensure
			root_element_name_set: root_element.name = a_name
		end

	Default_name: STRING = "root"

feature -- Access

	last: XM_DOCUMENT_NODE
			-- Last child
		do
			Result := children.last
		end

	root_element: XM_ELEMENT
			-- Root element of current document

	root_node: XM_DOCUMENT
			-- Root node.
		do
			Result := Current
		end

feature -- Setting

	set_root_element (an_element: like root_element)
			-- Set root element.
		require
			an_element_not_void: an_element /= Void
		do
			remove_previous_root_element
			root_element := an_element
			force_last (an_element)
		ensure
			root_element_parent: root_element.parent = Current
			root_element_set: root_element = an_element
			last_set: last = root_element
		end

feature {NONE} -- Implementation

	remove_previous_root_element
			-- Remove previous root element from composite.
		local
			a_cursor: like new_cursor
		do
			from
				a_cursor := new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				if a_cursor.item = root_element then
					a_cursor.remove
					a_cursor.go_after
				else
					a_cursor.forth
				end
			end
		end

feature -- Access

	element_by_name (a_name: STRING): detachable XM_ELEMENT
			-- Direct child element with name `a_name';
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		do
			if has_element_by_name (a_name) then
				Result := root_element
			end
		ensure then
			root_element: has_element_by_name (a_name) implies Result = root_element
		end

	element_by_qualified_name (a_uri: STRING; a_name: STRING): detachable XM_ELEMENT
			-- Root element, if name matches, Void otherwise.
		do
			if has_element_by_qualified_name (a_uri, a_name) then
				Result := root_element
			end
		ensure then
			root_element: has_element_by_qualified_name (a_uri, a_name) implies Result = root_element
		end

	has_element_by_name (a_name: STRING): BOOLEAN
			-- Has current node at least one direct child
			-- element with the name `a_name'?
			-- (Namespace is ignored on the root node because the
			-- root element defines the current namespace.)
		do
			Result := same_string (root_element.name, a_name)
		ensure then
			definition: Result = same_string (root_element.name, a_name)
		end

	has_element_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN
			-- Is this the qualified name of the root element?
		do
			Result := root_element.has_qualified_name (a_uri, a_name)
		ensure then
			definition: Result = root_element.has_qualified_name (a_uri, a_name)
		end

feature -- Text

	join_text_nodes
			-- Nothing to do in document.
		do
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		do
			a_processor.process_document (Current)
		end

	process_to_events (a_filter: XM_CALLBACKS)
			-- Traverse the document and issue events
			-- on event consumer.
		require
			a_filter_not_void: a_filter /= Void
		local
			a_source: XM_TREE_TO_EVENTS
		do
			create a_source.make (a_filter)
			process (a_source)
		end

invariant

	root_element_not_void: root_element /= Void
	--single_element: elements.count = 1

end
