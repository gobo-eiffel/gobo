indexing

	description:

		"Objects that represent xml nodes that can contain other xml nodes"

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

	UC_UNICODE_FACTORY
		export
			{NONE} all
		undefine
			copy, is_equal
		end

feature {NONE} -- Access

	make_composite is
			-- Initialisation specific to this node.
		do
			!! namespaces.make (10)
			make_list
		end

feature {ANY} -- Access

	root_node: XM_COMPOSITE is
			-- the root node of this node. In most cases this will be of
			-- type XM_DOCUMENT
		do
			if is_root_node then
				Result := Current
			else
				Result := precursor
			end
		end

			-- TODO: This feature does not work right now, fix needed
			-- new_element_cursor: DS_BILINEAR_CURSOR [XM_ELEMENT] is
			-- -- New external cursor. This cursor will ignore all nodes
			-- -- but elements.
			-- do
			-- !XM_ELEMENT_CURSOR! Result.make (new_cursor)
			-- end

	has_element_by_name (a_name: UC_STRING): BOOLEAN is
			-- Has this element at least 1 direct child element with the name `a_name'?
		require
			a_name_not_void: a_name /= Void
		local
			cs: like new_cursor
			e: XM_ELEMENT
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				e ?= cs.item
				if e /= Void and then equal (e.name, a_name) then
					Result := True
				end
				cs.forth
			end
		end

	element_by_name (a_name: UC_STRING): XM_ELEMENT is
			-- retrieve direct child element with name `a_name'.
			-- if there are more than one elements with that name,
			-- anyone may be returned.
			-- Returns Void if no element with that name is a child of Current
		require
			a_name_not_void: a_name /= Void
		local
			cs: like new_cursor
			e: XM_ELEMENT
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				e ?= cs.item
				if e /= Void and then equal (e.name, a_name) then
					Result := e
				end
				cs.forth
			end
		ensure
			result_not_void: has_element_by_name (a_name) = (Result /= Void)
		end

	namespaces: XM_NAMESPACE_TABLE

feature {ANY} -- Basic routines

	process_children (x: XM_NODE_PROCESSOR) is
			-- process direct children
		require
			x_not_void: x /= Void
		local
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				cs.item.process (x)
				cs.forth
			end
		end

	process_children_recursive (x: XM_NODE_PROCESSOR) is
			-- process direct and indirect children
		require
			x_not_void: x /= Void
		local
			cs: like new_cursor
			e: XM_ELEMENT
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				cs.item.process (x)
				e ?= cs.item
				if e /= Void then
					e.process_children_recursive (x)
				end
				cs.forth
			end
		end

feature {ANY} -- Element change

	resolve_namespaces_start is
		local
			decls: XM_NAMESPACE_TABLE
		do
			!! decls.make (10)
			resolve_namespaces (decls)
		end

	resolve_namespaces (decls: XM_NAMESPACE_TABLE) is
			-- checks for "xmlns" attributes and sets
			-- the correspondig namespace and namespace_declaration
			-- features in elements and attributes
			-- additionally the prefixes are removed from the attribute names
			-- (except for "xmlns", see `remove_namespace_declaration_from_attributes'
			-- to remove those as well
		require
			decls_not_void: decls /= Void
		local
			element: XM_ELEMENT
			comp: XM_COMPOSITE
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				element ?= cs.item
				if element /= Void then
						-- found an element, now let's check if it has "xmlns"
						-- attributes are defined
					decls.override_with_list (element.namespace_declarations)
					element.apply_namespace_declarations (decls)
				end
				comp ?= cs.item
				if comp /= Void then
					comp.resolve_namespaces (decls)
				end
				cs.forth
			end
		end

	remove_namespace_declarations_from_attributes is
			-- Removes all attributes that are namesapce declarations.
			-- That is any attribute whos name starts with "xmlns".
		local
			element: XM_COMPOSITE
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				element ?= cs.item
				if element /= Void then
						-- found an element, now let's check if it has "xmlns"
						-- attributes are defined
					element.remove_namespace_declarations_from_attributes
				end
				cs.forth
			end
		end

	join_text_nodes is
			-- joins sequences of text nodes
		local
			text_node: XM_CHARACTER_DATA
			joint_text_node: XM_CHARACTER_DATA
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				text_node ?= cs.item
				if text_node /= Void then
						-- found a text node
						-- now join all text-nodes that are
						-- more forward until there
						-- is a node that is no text-node
					joint_text_node := clone (text_node)
					remove_at_cursor (cs)
					from
					until
						cs.off or text_node = Void
					loop
						text_node ?= cs.item
						if text_node /= Void then
								-- found another text-node -> join
							joint_text_node.append_content (text_node)
							remove_at_cursor (cs)
						else
							cs.forth
						end
					end
					force_left_cursor (joint_text_node, cs)
				else
					cs.forth
				end
			end
		end

	text: UC_STRING is
			-- returns all text directly found in this element and
			-- returns it as one string
		local
			text_node: XM_CHARACTER_DATA
			cs: like new_cursor
		do
			from
				cs := new_cursor
				cs.start
				Result := new_unicode_string ("")
			until
				cs.off
			loop
				text_node ?= cs.item
				if text_node /= Void then
					Result.append_uc_string (text_node.content)
				end
				cs.forth
			end
		ensure
			result_not_void: Result /= Void
		end

invariant

	namespaces_not_void: namespaces /= Void

end -- class XM_COMPOSITE
