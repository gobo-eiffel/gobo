indexing

	description:

		"XML documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_DOCUMENT

inherit

	XM_COMPOSITE
		redefine
			root_node
		end

	DS_LINKED_LIST [XM_DOCUMENT_NODE]
		rename
			make as make_list,
			is_first as list_is_first,
			is_last as list_is_last
		end
		
creation

	make

feature {NONE} -- Initialization

	make is
			-- Create root node.
		local
			a_ns: XM_NAMESPACE
		do
			create a_ns.make_default
			create root_element.make (Current, Default_name, a_ns)
			make_list
			force_last (root_element)
		end

	Default_name: STRING is "root"
	
feature -- Access

	root_element: XM_ELEMENT
			-- Root element of current document

	root_node: XM_DOCUMENT is
			-- Root node.
		do
			Result := Current
		end
		
feature -- Setting

	set_root_element (an_element: like root_element) is
			-- Set root element.
		require
			an_element_not_void: an_element /= Void
		local
			a_cursor: DS_LIST_CURSOR[XM_DOCUMENT_NODE] 
		do
				-- Remove previous root element from composite:
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

			root_element := an_element
			
				-- Composite operations:
			force_last (an_element)
		ensure
			root_element_set: root_element = an_element
			last_set: last = root_element
		end

feature -- Access

	element_by_name (a_name: STRING): XM_ELEMENT is
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
		
	has_element_by_name (a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with the name `a_name'?
			-- (Namespace is ignored on the root node because the 
			-- root element defines the current namespace.)
		do
			Result := same_string (root_element.name, a_name)
		ensure then
			definition: 
		end

feature -- Text

	join_text_nodes is
			-- Nothing to do in document.
		do
		end
		
feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_document (Current)
		end

invariant
	
	root_element_not_void: root_element /= Void
	single_element: elements.count = 1
	
end
