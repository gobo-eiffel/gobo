indexing

	description:

		"XML element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_ELEMENT

inherit

	XM_COMPOSITE
		rename
			remove_namespace_declarations_from_attributes as remove_namespace_declarations_from_attributes_recursive
		undefine
			root_node
		redefine
			remove_namespace_declarations_from_attributes_recursive
		end

	XM_NAMED_NODE
		undefine
			copy, is_equal
		end

creation

	make

feature {NONE} -- Initialization

	make (a_parent: like parent; a_name: like name; a_ns: like namespace) is
			-- Create a new child element.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
		do
			name := a_name
			namespace := a_ns
			make_composite
			parent := a_parent
		ensure
			name_set: name = a_name
			ns_prefix_set: namespace = a_ns
			parent_set: parent = a_parent
		end

	make_root (a_name: like name; a_ns: like namespace) is
			-- Create a new root element.
		obsolete
			"Document is parent of root element"
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
			namespace := a_ns
			make_composite
		ensure
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
		do
			make (a_parent, a_name, a_ns)
		end

feature -- Status report

	has_attribute_by_name (a_name: STRING): BOOLEAN is
			-- Does current element contain an attribute named `a_name'?
			-- element?
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then 
					attribute_same_name (typer.attribute, a_name)
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
			Result := same_string (a_named.name, a_name) and a_named.namespace.is_default_namespace
		ensure
			same_name: Result implies same_string (a_named.name, a_name)
			default_ns: a_named.namespace.is_default_namespace implies (Result = same_string (a_named.name, a_name))
		end
		
	named_same_name (a_named: XM_NAMED_NODE; a_name: STRING): BOOLEAN is
			-- Has 'a_named' same name as 'a_name' and 
			-- same namespace as current node?
		require
			named_not_void: a_named /= Void
		do
			Result := same_string (a_named.name, a_name) and same_namespace (a_named)
		ensure
			same_name: Result implies same_string (a_named.name, a_name)
		end
		
feature -- Access

	attribute_by_name (a_name: STRING): XM_ATTRIBUTE is
			-- Attribute named `a_name' in current element;
			-- Return Void if no such attribute was found.
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then 
					attribute_same_name (typer.attribute, a_name)
				then
					Result := typer.attribute
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_name (a_name) = (Result /= Void)
			namespace: Result /= Void implies same_namespace (Result)
		end

	namespace_declarations: DS_LINKED_LIST [XM_NAMESPACE] is
			-- Namespaces declared directly in this element;
			-- This list must contain at most one namespace with a
			-- void prefix. If such a namespace exists it is a declared
			-- default namespace.
			-- (Return the same list object at each call.)
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			if namespace_declarations_cache /= Void then
				Result := namespace_declarations_cache
			else
				create Result.make
				a_cursor := new_cursor
				from a_cursor.start until a_cursor.after loop
					a_cursor.item.process (typer)
					if typer.is_attribute and then typer.attribute.is_namespace_declaration then
						Result.force_last (typer.attribute.namespace_declaration)
					end
					a_cursor.forth
				end
				namespace_declarations_cache := Result
			end
		ensure
			namespace_declarations_not_void: Result /= Void
			no_void_declaration: not Result.has (Void)
		end

	attributes: DS_LIST [XM_ATTRIBUTE] is
			-- List of all attributes in current element
			-- (Create a new list at each call.)
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			create {DS_BILINKED_LIST [XM_ATTRIBUTE]} Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute then
					Result.force_last (typer.attribute)
				end
				a_cursor.forth
			end
		end

feature {XM_PARSER} -- Element change

	add_attribute (a_name: STRING; a_ns: XM_NAMESPACE; a_value: STRING) is
			-- Add an attribute to current element.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		local
			an_attribute: XM_ATTRIBUTE
		do
			create an_attribute.make (a_name, a_ns, a_value, Current)
			force_last (an_attribute)
		ensure
			attribute_added: has_attribute_by_name (a_name)
		end

feature -- Removal

	remove_attribute_by_name (a_name: STRING) is
			-- Remove attribute named `a_name' from current element.
		require
			a_name_not_void: a_name /= Void
			has_attribute: has_attribute_by_name (a_name)
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then 
					attribute_same_name (typer.attribute, a_name)
				then
					remove_at_cursor (a_cursor)
				else
					a_cursor.forth
				end
			end
		end

	remove_namespace_declarations_from_attributes_recursive is
			-- Remove the namespace declarations from the attributes 
			-- in current element and all child-elements recursively.
		do
			remove_namespace_declarations_from_attributes
			Precursor
		end

	remove_namespace_declarations_from_attributes is
			-- Remove all attributes that start with "xmlns:".
		local
			a_cursor: like new_cursor
			typer: XM_NODE_TYPER
		do
			create typer
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.process (typer)
				if typer.is_attribute and then typer.attribute.is_namespace_declaration then
					remove_at_cursor (a_cursor)
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

feature {NONE} -- Implementation

	namespace_declarations_cache: DS_LINKED_LIST [XM_NAMESPACE]
			-- Cache for `namespace_declarations'

end
