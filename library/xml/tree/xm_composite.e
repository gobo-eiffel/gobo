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
			make as make_list,
			is_first as list_is_first,
			is_last as list_is_last
		end

	KL_IMPORTED_STRING_ROUTINES
		undefine
			is_equal, copy
		end

feature {NONE} -- Initialization

	make_composite is
			-- Initialization specific to current node.
		do
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
			typer: XM_NODE_TYPER
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element and then 
					named_same_name (typer.element, a_name)
				then
					Result := typer.element
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			element_not_void: has_element_by_name (a_name) = (Result /= Void)
			--namespace: Result /= Void implies same_namespace (Result)
		end

	elements: DS_LIST [XM_ELEMENT] is
			-- List of all direct child elements in current element
			-- (Create a new list at each call.)
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			!! typer
			!DS_BILINKED_LIST [XM_ELEMENT]! Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element then
					Result.force_last (typer.element)
				end
				a_cursor.forth
			end
		end

	text: STRING is
			-- Concatenation of all texts directly found in
			-- current element; Void if no text found
			-- (Return a new string at each call.)
		local
			typer: XM_NODE_TYPER
			a_cursor: like new_cursor
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_character_data then
					if Result = Void then
						Result := clone (typer.character_data.content)
					else
						Result := STRING_.appended_string (Result, typer.character_data.content)
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
			typer: XM_NODE_TYPER
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element and then 
					named_same_name (typer.element, a_name)
				then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Name comparison with namespace.

	named_same_name (a_named: XM_NAMED_NODE; a_name: STRING): BOOLEAN is
			-- Has 'a_named' same name as 'a_name' and 
			-- same namespace as current node?
		require
			a_named_not_void: a_named /= Void
			a_name_not_void: a_name /= Void
		deferred
		end
		
feature -- Element change

	join_text_nodes is
			-- Join sequences of text nodes.
		local
			text_node: XM_CHARACTER_DATA
			joint_text_node: XM_CHARACTER_DATA
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_character_data then
					text_node := typer.character_data
						-- Found a text node.
						-- Now join all text-nodes that are following it
						-- until there is a node that is no text-node.
					joint_text_node := clone (text_node)
					remove_at_cursor (a_cursor)
					from
					until
						a_cursor.after or text_node = Void
					loop
						a_cursor.item.process (typer)
						if typer.is_character_data then
								-- Found another text-node -> join.
							joint_text_node.append_content (typer.character_data)
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

	remove_namespace_declarations_from_attributes is
			-- Remove all attributes that are namespace declarations.
			-- That is any attribute whose name starts with "xmlns".
		local
			typer: XM_NODE_TYPER
			a_cursor: like new_cursor
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_composite then
						-- Found an element, now let's check if it has "xmlns"
						-- attributes defined.
					typer.composite.remove_namespace_declarations_from_attributes
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
			typer: XM_NODE_TYPER
		do
			!! typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (a_processor)
				a_cursor.item.process (typer)
				if typer.is_composite then
					typer.composite.process_children_recursive (a_processor)
				end
				a_cursor.forth
			end
		end

end
