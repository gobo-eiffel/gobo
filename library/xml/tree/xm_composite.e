indexing

	description:

		"XML nodes that can contain other xml nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_COMPOSITE

inherit

	XM_NODE
		undefine
			is_equal, copy
		redefine
			root_node
		end

	DS_LINKED_LIST [XM_NODE]
		rename
			make as make_list
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal, copy
		end

feature {NONE} -- Initialization

	make_composite is
			-- Initialization specific to current node.
		do
			!! namespaces.make
			make_list
		end

feature -- Access

	root_node: XM_COMPOSITE is
			-- Root node of current node
			-- (In most cases this will be of type XM_DOCUMENT)
		do
			if is_root_node then
				Result := Current
			else
				Result := parent.root_node
			end
		end

	element_by_name (a_name: STRING): XM_ELEMENT is
			-- Direct child element with name `a_name';
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: like new_cursor
			e: XM_ELEMENT
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				e ?= a_cursor.item
				if e /= Void and then same_string (e.name, a_name) then
					Result := e
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			element_not_void: has_element_by_name (a_name) = (Result /= Void)
		end

	namespaces: XM_NAMESPACE_TABLE
			-- Namespaces

	text: STRING is
			-- Concatenation of all texts directly found in
			-- current element; Void if no text found
			-- (Return a new string at each call.)
		local
			text_node: XM_CHARACTER_DATA
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				text_node ?= a_cursor.item
				if text_node /= Void then
					if Result = Void then
						Result := clone (text_node.content)
					else
						Result := STRING_.appended_string (Result, text_node.content)
					end
				end
				a_cursor.forth
			end
		end

feature -- Status report

	has_element_by_name (a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with the name `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: like new_cursor
			e: XM_ELEMENT
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				e ?= a_cursor.item
				if e /= Void and then same_string (e.name, a_name) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature -- Element change

	join_text_nodes is
			-- Join sequences of text nodes.
		local
			text_node: XM_CHARACTER_DATA
			joint_text_node: XM_CHARACTER_DATA
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				text_node ?= a_cursor.item
				if text_node /= Void then
						-- Found a text node.
						-- Now join all text-nodes that are following it
						-- until there is a node that is no text-node.
					joint_text_node := clone (text_node)
					remove_at_cursor (a_cursor)
					from
					until
						a_cursor.after or text_node = Void
					loop
						text_node ?= a_cursor.item
						if text_node /= Void then
								-- Found another text-node -> join.
							joint_text_node.append_content (text_node)
							remove_at_cursor (a_cursor)
						else
							a_cursor.forth
						end
					end
					force_left_cursor (joint_text_node, a_cursor)
				else
					a_cursor.forth
				end
			end
		end

feature -- Namespaces

	resolve_namespaces is
			-- Check for "xmlns" attributes and set the corresponding namespace
			-- and namespace_declaration features in elements and attributes.
			-- Additionally the prefixes are removed from the attribute names
			-- (except for "xmlns", see `remove_namespace_declaration_from_attributes'
			-- to remove those as well).
		local
			decls: XM_NAMESPACE_TABLE
		do
			!! decls.make
			resolve_namespaces_impl (decls)
		end

	remove_namespace_declarations_from_attributes is
			-- Remove all attributes that are namespace declarations.
			-- That is any attribute whose name starts with "xmlns".
		local
			element: XM_COMPOSITE
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				element ?= a_cursor.item
				if element /= Void then
						-- Found an element, now let's check if it has "xmlns"
						-- attributes defined.
					element.remove_namespace_declarations_from_attributes
				end
				a_cursor.forth
			end
		end

feature -- Obsolete

	resolve_namespaces_start is
			-- Check for "xmlns" attributes and set the corresponding namespace
			-- and namespace_declaration features in elements and attributes.
			-- Additionally the prefixes are removed from the attribute names
			-- (except for "xmlns", see `remove_namespace_declaration_from_attributes'
			-- to remove those as well).
		obsolete
			"[020811] Use `resolve_namespaces' instead."
		do
			resolve_namespaces
		end

feature {XM_COMPOSITE} -- Namespaces

	resolve_namespaces_impl (decls: XM_NAMESPACE_TABLE) is
			-- Check for "xmlns" attributes and set the corresponding namespace
			-- and namespace_declaration features in elements and attributes.
			-- Additionally the prefixes are removed from the attribute names
			-- (except for "xmlns", see `remove_namespace_declaration_from_attributes'
			-- to remove those as well).
		require
			decls_not_void: decls /= Void
		local
			element: XM_ELEMENT
			comp: XM_COMPOSITE
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				element ?= a_cursor.item
				if element /= Void then
						-- Found an element, now let's check if it has "xmlns"
						-- attributes defined.
					decls.override_with_list (element.namespace_declarations)
					element.apply_namespace_declarations (decls)
				end
				comp ?= a_cursor.item
				if comp /= Void then
					comp.resolve_namespaces_impl (decls)
				end
				a_cursor.forth
			end
		end

feature -- Processing

	process_children (a_processor: XM_NODE_PROCESSOR) is
			-- Process direct children.
		require
			a_processor_not_void: a_processor /= Void
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (a_processor)
				a_cursor.forth
			end
		end

	process_children_recursive (a_processor: XM_NODE_PROCESSOR) is
			-- Process direct and indirect children.
		require
			processor_not_void: a_processor /= Void
		local
			a_cursor: like new_cursor
			e: XM_COMPOSITE
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (a_processor)
				e ?= a_cursor.item
				if e /= Void then
					e.process_children_recursive (a_processor)
				end
				a_cursor.forth
			end
		end

invariant

	namespaces_not_void: namespaces /= Void

end
