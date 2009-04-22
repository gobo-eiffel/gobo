indexing

	description:

		"XML element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_ELEMENT

inherit

	XM_COMPOSITE
		undefine
			root_node
		redefine
			force_last, put_last
		end

	XM_NAMED_NODE
		undefine
			copy, is_equal
		end

	XM_DOCUMENT_NODE
		undefine
			copy, is_equal
		end

create

	make,
	make_last,
	make_root,
	make_child

feature {NONE} -- Initialization
	
	make (a_parent: like parent; a_name: like name; a_ns: like namespace) is
			-- Create a new child element, without attaching to parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			parent := a_parent
			name := a_name
			namespace := a_ns
			list_make
		ensure
			parent_set: parent = a_parent
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end
		
	make_last (a_parent: XM_ELEMENT; a_name: like name; a_ns: like namespace) is
			-- Create a new child element, and add it to the parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			name := a_name
			namespace := a_ns
			list_make
			a_parent.force_last (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: parent.last = Current
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end
		
	make_root (a_parent: XM_DOCUMENT; a_name: like name; a_ns: like namespace) is
			-- Create a new root element, and add it to the document parent.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			name := a_name
			namespace := a_ns
			list_make
			a_parent.set_root_element (Current)
		ensure
			parent_set: parent = a_parent
			in_parent: parent.last = Current
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
		end
		
	make_child (a_parent: like parent; a_name: like name; a_ns: like namespace) is
			-- Create a new child element.
		obsolete
			"Use make"
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
			a_ns_not_void: a_ns /= Void
		do
			make (a_parent, a_name, a_ns)
		end

feature -- Element change

	force_last (v: like last) is
			-- `force_last' with parent removal and optimisation for
			-- force_last (last).
		do
			-- check last_efficient: O(last) < O(Precursor) end
			if is_empty or else last /= v then
				Precursor (v)
			-- else force_last (last) happens to be a no-op.
			end
		end
		
	put_last (v: like last) is
			-- `put_last' with parent removal and optimisation for
			-- put_last (last).
		do
			-- check last_efficient: O(last) < O(Precursor) end
			if is_empty or else last /= v then
				Precursor (v)
			-- else force_last (last) happens to be a no-op.
			end
		end
		
feature {NONE} -- Parent processing

	before_addition (a_node: XM_NODE) is
			-- Remove node from original parent if not us.
		do
			if a_node /= Void then
				check addable: addable_item (a_node) end
					-- Remove from previous parent.
				if a_node.parent /= Void then
					a_node.parent.equality_delete (a_node)
				end
				a_node.node_set_parent (Current)
			end
		ensure then
			parent_accepted: a_node /= Void implies a_node.parent = Current
		end
	
	addable_item (a_node: XM_NODE): BOOLEAN is
			-- Is this not of the correct type for addition?
			-- (element node)
		local
			typer: XM_NODE_TYPER
		do
			if a_node /= Void then
				create typer
				a_node.process (typer)
				Result := typer.is_comment
					or typer.is_processing_instruction
					or typer.is_element
					or typer.is_character_data
					or typer.is_attribute
			end
		end
		
feature {XM_NODE} -- Removal

	equality_delete (v: XM_NODE) is
			-- Call `delete' with Void equality tester.
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_NODE]
		do
			-- we do DS_LIST.delete by hand, because
			-- it takes a descendant type, while we don't
			-- really need to know the subtype for object
			-- equality.
			from
				a_cursor := new_cursor
				a_cursor.start
			until
				a_cursor.after
			loop
				if a_cursor.item = v then
					a_cursor.remove
				else
					a_cursor.forth
				end
			end
		end
		
feature -- Status report

	has_attribute_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN is
			-- Does current element contain an attribute with
			-- this qualified name?
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					typer.xml_attribute.has_qualified_name (a_uri, a_name)
				then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end
		
	has_attribute_by_name (a_name: STRING): BOOLEAN is
			-- Does current element contain an attribute named `a_name'?
			-- element?
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					attribute_same_name (typer.xml_attribute, a_name)
				then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature {NONE} -- Name comparison with namespace.

	attribute_same_name (a_named: XM_ATTRIBUTE; a_name: STRING): BOOLEAN is
			-- Has 'a_named' attribute the same name as `a_name',
			-- either because of same namespace or within the
			-- default namespace.
		require
			named_not_void: a_named /= Void
		do
			Result := same_string (a_named.name, a_name) and (a_named.namespace.uri.count = 0)
		ensure
			same_name: Result implies same_string (a_named.name, a_name)
			default_ns: (a_named.namespace.uri.count = 0) implies (Result = same_string (a_named.name, a_name))
		end
		
	named_same_name (a_named: XM_NAMED_NODE; a_name: STRING): BOOLEAN is
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
	
	has_element_by_name (a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with the name `a_name'?
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
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

	has_element_by_qualified_name (a_uri: STRING; a_name: STRING): BOOLEAN is
			-- Has current node at least one direct child
			-- element with this qualified name ?
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element and then
					typer.element.has_qualified_name (a_uri, a_name)
				then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end
		
	element_by_name (a_name: STRING): XM_ELEMENT is
			-- Direct child element with name `a_name';
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
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
		end
		
	element_by_qualified_name (a_uri: STRING; a_name: STRING): XM_ELEMENT is
			-- Direct child element with given qualified name;
			-- If there are more than one element with that name, anyone may be returned.
			-- Return Void if no element with that name is a child of current node.
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_element and then
					typer.element.has_qualified_name (a_uri, a_name)
				then
					Result := typer.element
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end
	
feature -- Access

	attribute_by_name (a_name: STRING): XM_ATTRIBUTE is
			-- Attribute named `a_name' in current element;
			-- Return Void if no such attribute was found.
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					attribute_same_name (typer.xml_attribute, a_name)
				then
					Result := typer.xml_attribute
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_name (a_name) = (Result /= Void)
			namespace: Result /= Void implies (not Result.has_prefix)
		end

	attribute_by_qualified_name (a_uri: STRING; a_name: STRING): XM_ATTRIBUTE is
			-- Attribute named `a_name' in current element;
			-- Return Void if no such attribute was found.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					typer.xml_attribute.has_qualified_name (a_uri, a_name)
				then
					Result := typer.xml_attribute
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_qualified_name (a_uri, a_name) = (Result /= Void)
			namespace: Result /= Void implies Result.has_qualified_name (a_uri, a_name)
		end

	namespace_declarations: DS_LINKED_LIST [XM_NAMESPACE] is
			-- Namespaces declared directly in this element;
			-- This list must contain at most one namespace with a
			-- void prefix. If such a namespace exists it is a declared
			-- default namespace.
			-- (Returns a new list object at each call.)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			create Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then typer.xml_attribute.is_namespace_declaration then
					Result.force_last (typer.xml_attribute.namespace_declaration)
				end
				a_cursor.forth
			end
		ensure
			namespace_declarations_not_void: Result /= Void
			no_void_declaration: not Result.has_void
		end

	attributes: DS_LIST [XM_ATTRIBUTE] is
			-- List of all attributes in current element
			-- (Create a new list at each call.)
		local
			a_cursor: DS_LINEAR_CURSOR [XM_NODE] 
			typer: XM_NODE_TYPER
		do
			create typer
			create {DS_BILINKED_LIST [XM_ATTRIBUTE]} Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute then
					Result.force_last (typer.xml_attribute)
				end
				a_cursor.forth
			end
		end

feature -- Element change

	add_unqualified_attribute (a_name: STRING; a_value: STRING) is
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
		
	add_attribute (a_name: STRING; a_ns: XM_NAMESPACE; a_value: STRING) is
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
			if count = 0 then
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

	remove_attribute_by_name (a_name: STRING) is
			-- Remove attribute named `a_name' from current element.
		require
			a_name_not_void: a_name /= Void
			has_attribute: has_attribute_by_name (a_name)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					attribute_same_name (typer.xml_attribute, a_name)
				then
					remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end

	remove_attribute_by_qualified_name (a_uri: STRING; a_name: STRING) is
			-- Remove attribute named `a_name' from current element.
		require
			a_uri_not_void: a_uri /= Void
			a_name_not_void: a_name /= Void
			has_attribute: has_attribute_by_qualified_name (a_uri, a_name)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then
					typer.xml_attribute.has_qualified_name (a_uri, a_name)
				then
					remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end
		
	join_text_nodes is
			-- Join sequences of text nodes.
		local
			text_node: XM_CHARACTER_DATA
			joint_text_node: XM_CHARACTER_DATA
			a_cursor: DS_LINKED_LIST_CURSOR [XM_NODE]
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_character_data then
					text_node := typer.character_data
						-- Found a text node.
						-- Now join all text-nodes that are following it
						-- until there is a node that is no text-node.
					joint_text_node := text_node.cloned_object
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


feature -- Processing

	process (a_processor: XM_NODE_PROCESSOR) is
			-- Process current node with `a_processor'.
		do
			a_processor.process_element (Current)
		end

end
