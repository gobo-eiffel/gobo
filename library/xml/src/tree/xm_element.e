note

	description:

		"XML element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

class XM_ELEMENT

inherit

	XM_COMPOSITE
		undefine
			last,
			root_node,
			parent
		end

	XM_NAMED_NODE

	XM_DOCUMENT_NODE

create

	make,
	make_last,
	make_root,
	make_child

feature {NONE} -- Initialization

	make (a_parent: like parent; a_name: like name; a_ns: like namespace)
			-- Create a new child element, without attaching to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			parent := a_parent
			name := a_name
			namespace := a_ns
			create children.make
		ensure
			parent_set: parent = a_parent
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end

	make_last (a_parent: XM_ELEMENT; a_name: like name; a_ns: like namespace)
			-- Create a new child element, and add it to the parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			name := a_name
			namespace := a_ns
			parent := a_parent
			create children.make
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: a_parent.last = Current
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end

	make_root (a_parent: XM_DOCUMENT; a_name: like name; a_ns: like namespace)
			-- Create a new root element, and add it to the document parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			name := a_name
			namespace := a_ns
			parent := a_parent
			create children.make
			a_parent.set_root_element (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: a_parent.last = Current
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end

	make_child (a_parent: like parent; a_name: like name; a_ns: like namespace)
			-- Create a new child element.
		obsolete
			"Use make. [2017-04-09]"
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			make (a_parent, a_name, a_ns)
		end

feature -- Status report

	has_attribute_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN
			-- Does current element contain an attribute with
			-- this qualified name?
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then l_attribute.has_qualified_name (a_uri, a_name) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

	has_attribute_by_name (a_name: STRING): BOOLEAN
			-- Does current element contain an attribute named `a_name'?
			-- element?
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then attribute_same_name (l_attribute, a_name) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Name comparison with namespace.

	attribute_same_name (a_named: XM_ATTRIBUTE; a_name: STRING): BOOLEAN
			-- Has 'a_named' attribute the same name as `a_name',
			-- either because of same namespace or within the
			-- default namespace.
		require
			a_named_not_void: a_named /= Void
			a_name_not_void: a_name /= Void
		do
			Result := same_string (a_named.name, a_name) and (a_named.namespace.uri.count = 0)
		ensure
			same_name: Result implies same_string (a_named.name, a_name)
			default_ns: (a_named.namespace.uri.count = 0) implies (Result = same_string (a_named.name, a_name))
		end

	named_same_name (a_named: XM_NAMED_NODE; a_name: STRING): BOOLEAN
			-- Has 'a_named' same name as 'a_name' and
			-- same namespace as current node?
		require
			a_named_not_void: a_named /= Void
			a_name_not_void: a_name /= Void
		do
			Result := same_string (a_named.name, a_name) and same_namespace (a_named)
		ensure
			same_name: Result implies same_string (a_named.name, a_name)
		end

feature -- Access (from XM_COMPOSITE)

	has_element_by_name (a_name: STRING): BOOLEAN
			-- Has current node at least one direct child
			-- element with the name `a_name'?
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as l_element and then named_same_name (l_element, a_name) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

	has_element_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN
			-- Has current node at least one direct child
			-- element with this qualified name?
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as l_element and then l_element.has_qualified_name (a_uri, a_name) then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

	element_by_name (a_name: STRING): detachable XM_ELEMENT
			-- Direct child element with name `a_name';
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as l_element and then named_same_name (l_element, a_name) then
					Result := l_element
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

	element_by_qualified_name (a_uri: STRING; a_name: STRING): detachable XM_ELEMENT
			-- Direct child element with given qualified name;
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ELEMENT} a_cursor.item as l_element and then l_element.has_qualified_name (a_uri, a_name) then
					Result := l_element
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature -- Access

	last: XM_ELEMENT_NODE
			-- Last child
		do
			Result := children.last
		end

	attribute_by_name (a_name: STRING): detachable XM_ATTRIBUTE
			-- Attribute named `a_name' in current element;
			-- Return Void if no such attribute was found.
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then attribute_same_name (l_attribute, a_name) then
					Result := l_attribute
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_name (a_name) = (Result /= Void)
			namespace: Result /= Void implies (not Result.has_prefix)
		end

	attribute_by_qualified_name (a_uri: STRING; a_name: STRING): detachable XM_ATTRIBUTE
			-- Attribute named `a_name' in current element;
			-- Return Void if no such attribute was found.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then l_attribute.has_qualified_name (a_uri, a_name) then
					Result := l_attribute
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_qualified_name (a_uri, a_name) = (Result /= Void)
			namespace: Result /= Void implies Result.has_qualified_name (a_uri, a_name)
		end

	namespace_declarations: DS_LINKED_LIST [XM_NAMESPACE]
			-- Namespaces declared directly in this element;
			-- This list must contain at most one namespace with a
			-- void prefix. If such a namespace exists it is a declared
			-- default namespace.
			-- (Returns a new list object at each call.)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			create Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then l_attribute.is_namespace_declaration then
					Result.force_last (l_attribute.namespace_declaration)
				end
				a_cursor.forth
			end
		ensure
			namespace_declarations_not_void: Result /= Void
			no_void_declaration: not Result.has_void
		end

	attributes: DS_LIST [XM_ATTRIBUTE]
			-- List of all attributes in current element
			-- (Create a new list at each call.)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
		do
			create {DS_BILINKED_LIST [XM_ATTRIBUTE]} Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute then
					Result.force_last (l_attribute)
				end
				a_cursor.forth
			end
		ensure
			attributes_not_void: Result /= Void
			no_void_attribute: not Result.has_void
		end

feature -- Element change

	add_unqualified_attribute (a_name: STRING; a_value: STRING)
			-- Add an attribute without a specific namespace.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		do
			add_attribute (a_name, Default_ns, a_value)
		ensure
			attribute_added: has_attribute_by_name (a_name)
		end

	add_attribute (a_name: STRING; a_ns: XM_NAMESPACE; a_value: STRING)
			-- Add an attribute to current element.
			-- (at end if last is an attribute, at beginning otherwise)
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_ns_not_void: a_ns /= Void
			a_value_not_void: a_value /= Void
		local
			an_attribute: XM_ATTRIBUTE
			typer: XM_NODE_TYPER
		do
			create an_attribute.make (a_name, a_ns, a_value, Current)
			if is_empty then
				force_last (an_attribute)
			else
				create typer
				last.process (typer)
				if typer.is_attribute then
					force_last (an_attribute)
				else
					force_first (an_attribute)
				end
			end
		ensure
			attribute_added: has_attribute_by_qualified_name (a_ns.uri, a_name)
		end

feature -- Removal

	remove_attribute_by_name (a_name: STRING)
			-- Remove attribute named `a_name' from current element.
		require
			a_name_not_void: a_name /= Void
			has_attribute: has_attribute_by_name (a_name)
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then attribute_same_name (l_attribute, a_name) then
					children.remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end

	remove_attribute_by_qualified_name (a_uri: STRING; a_name: STRING)
			-- Remove attribute named `a_name' from current element.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
			has_attribute: has_attribute_by_qualified_name (a_uri, a_name)
		local
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_ATTRIBUTE} a_cursor.item as l_attribute and then l_attribute.has_qualified_name (a_uri, a_name) then
					children.remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end

	join_text_nodes
			-- Join sequences of text nodes.
		local
			joint_text_node: XM_CHARACTER_DATA
			a_cursor: like new_cursor
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				if attached {XM_CHARACTER_DATA} a_cursor.item as l_character_data then
						-- Found a text node.
						-- Now join all text-nodes that are following it
						-- until there is a node that is no text-node.
					joint_text_node := l_character_data.cloned_object
					children.remove_at_cursor (a_cursor)
					from
					until
						a_cursor.after
					loop
						if attached {XM_CHARACTER_DATA} a_cursor.item as l_other_character_data then
								-- Found another text-node -> join.
							joint_text_node.append_content (l_other_character_data)
							children.remove_at_cursor (a_cursor)
						else
							a_cursor.forth
						end
					end
					before_addition (joint_text_node)
					children.force_left_cursor (joint_text_node, a_cursor)
				else
					a_cursor.forth
				end
			end
		end

feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR)
			-- Process current node with `a_processor'.
		do
			a_processor.process_element (Current)
		end

end
