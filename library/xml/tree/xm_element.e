indexing

	description:

		"XML element nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v1 (see forum.txt)"
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
			remove_namespace_declarations_from_attributes_recursive,
			resolve_namespaces, make_default
		end

	XM_NAMED_NODE
		undefine
			copy, is_equal
		redefine
			apply_namespace_declarations
		end

creation

	make_root, make_child

feature {NONE} -- Initialization

	make_root (a_name: like name; a_prefix: like ns_prefix) is
			-- Create a new root element based on the information held in a
			-- XM_START_TAG object. This will fill in the name and the attributes.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
		do
			name := a_name
			ns_prefix := a_prefix
			make_composite
		ensure
			name_set: name = a_name
			ns_prefix_set: ns_prefix = a_prefix
		end

	make_child (a_parent: like parent; a_name: like name; a_prefix: like ns_prefix) is
			-- Create a new child element based on the information held in a
			-- XM_START_TAG object. This will fill in the name and the attributes.
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
		do
			make_root (a_name, a_prefix)
			parent := a_parent
		ensure
			name_set: name = a_name
			ns_prefix_set: ns_prefix = a_prefix
			parent_set: parent = a_parent
		end

	make_default is
			-- Default creation for empty container.
			-- Meaningless in the current context.
		do
			make_root ("dummy", Void)
		end

feature -- Status report

	has_attribute_by_name (a_name: STRING): BOOLEAN is
			-- Does current element contain an attribute named `a_name'?
			-- element?
		require
			a_name_not_void: a_name /= Void
		local
			a_cursor: like new_cursor
			att: XM_ATTRIBUTE
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				att ?= a_cursor.item
				if att /= Void and then same_string (att.name, a_name) then
					Result := True
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
			a_cursor: like new_cursor
			att: XM_ATTRIBUTE
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				att ?= a_cursor.item
				if att /= Void and then same_string (att.name, a_name) then
					Result := att
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			attribute_not_void: has_attribute_by_name (a_name) = (Result /= Void)
		end

	namespace_declarations: DS_LINKED_LIST [XM_NAMESPACE] is
			-- Namespaces declared directly in this element;
			-- This list must contain at most one namespace with a
			-- void prefix. If such a namespace exists it is a declared
			-- default namespace.
			-- (Return the same list object at each call.)
		local
			a_cursor: like new_cursor
			att: XM_ATTRIBUTE
		do
			if namespace_declarations_cache /= Void then
				Result := namespace_declarations_cache
			else
				!! Result.make
				a_cursor := new_cursor
				from a_cursor.start until a_cursor.after loop
					att ?= a_cursor.item
					if att /= Void and then att.is_namespace_declaration then
						Result.force_last (att.namespace_declaration)
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
			att: XM_ATTRIBUTE
		do
			!DS_BILINKED_LIST [XM_ATTRIBUTE]! Result.make
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				att ?= a_cursor.item
				if att /= Void then
					Result.force_last (att)
				end
				a_cursor.forth
			end
		end

feature {XM_PARSER} -- Element change

	add_attributes (an_attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [STRING, STRING], STRING]]) is
			-- Add `an_attributes' to current element.
		require
			an_attributes_not_void: an_attributes /= Void
			-- no void pairs nor strings in `an_attributes'
		local
			a_cursor: DS_BILINEAR_CURSOR [DS_PAIR [DS_PAIR [STRING, STRING], STRING]]
		do
			a_cursor := an_attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
				add_attribute (a_cursor.item.first.first, a_cursor.item.first.second, a_cursor.item.second)
				a_cursor.forth
			end
		end

	add_attribute (a_name, a_prefix, a_value: STRING) is
			-- Add an attribute to current element.
		require
			a_name_not_void: a_name /= Void
			a_name_not_empty: a_name.count > 0
			a_value_not_void: a_value /= Void
		local
			an_attribute: XM_ATTRIBUTE
		do
			!! an_attribute.make (a_name, a_prefix, a_value, Current)
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
			att: XM_ATTRIBUTE
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				att ?= a_cursor.item
				if att /= Void and then same_string (a_name, att.name) then
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
			precursor
		end

	remove_namespace_declarations_from_attributes is
			-- Remove all attributes that start with "xmlns:".
		local
			a_cursor: like new_cursor
			att: XM_ATTRIBUTE
		do
			a_cursor := new_cursor
			from a_cursor.start until a_cursor.after loop
				att ?= a_cursor.item
				if att /= Void and then att.is_namespace_declaration then
					remove_at_cursor (a_cursor)
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
			decls.override_with_list (namespace_declarations)
			apply_namespace_declarations (decls)
			resolve_namespaces_impl (decls)
		end

	apply_namespace_declarations (decls: XM_NAMESPACE_TABLE) is
			-- Apply namespace declarations.
		local
			a_cursor: DS_BILINEAR_CURSOR [XM_ATTRIBUTE]
		do
			if has_prefix then
				precursor (decls)
			else
				if decls.has_default then
					set_namespace (decls.default_ns)
				end
			end
			a_cursor := attributes.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_cursor.item.apply_namespace_declarations (decls)
				a_cursor.forth
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
