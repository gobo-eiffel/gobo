indexing

	description:

		"Objects that represent XML element nodes"

	library:	"Gobo Eiffel XML Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_ELEMENT

inherit

	XM_COMPOSITE
		rename
			remove_namespace_declarations_from_attributes as remove_namespace_declarations_from_attributes_recursive
		undefine
			root_node
		redefine
			remove_namespace_declarations_from_attributes_recursive,
			resolve_namespaces_start, make_default
		end

	XM_NAMED_NODE
		undefine
			copy, is_equal
		redefine
			apply_namespace_declarations
		end

creation

	make_root, make_child

feature {NONE} -- Implementation

	make_root (a_name, a_ns_prefix: UC_STRING) is
			-- make a new root element based on the information held in a
			-- XM_START_TAG object. This will fill in the name and the attributes
		require
			a_name_not_void: a_name /= Void
		do
			make_composite
			name := a_name
			ns_prefix := a_ns_prefix
		ensure
			name_set: equal (name, a_name)
		end

	make_child (a_parent: XM_COMPOSITE; a_name, a_ns_prefix: UC_STRING) is
			-- make a new child element based on the information held in a
			-- XM_START_TAG object. This will fill in the name and the attributes
		require
			a_parent_not_void: a_parent /= Void
			a_name_not_void: a_name /= Void
		do
			make_root (a_name, a_ns_prefix)
			parent := a_parent
		ensure
			name_set: equal (name, a_name)
		end

	make_default is
		do
				-- needed by gobo 2.0
				-- TODO: make a empty but valid document
		end

feature {ANY} -- Access

	has_attribute_by_name (a_name: UC_STRING): BOOLEAN is
			-- is an attribute with the name `a_name' present in this
			-- element?
		require
			a_name_not_void: a_name /= Void
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				att ?= cs.item
				if att /= Void and then equal (att.name, a_name) then
					Result := True
					cs.go_after
				else
					cs.forth
				end
			end
		end

	attribute_by_name (a_name: UC_STRING): XM_ATTRIBUTE is
			-- retrieves the attribute with the name `a_name' from element.
			-- returns `Void' if no Attribute was found.
		require
			a_name_not_void: a_name /= Void
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off or Result /= Void
			loop
				att ?= cs.item
				if att /= Void then
					if equal (att.name, a_name) then
						Result := att
					end
				end
				cs.forth
			end
		end

	namespace_declarations: DS_LINKED_LIST [XM_NAMESPACE] is
			-- namespaces declared directly in this element
			-- this list must contain at most one namespace with a
			-- void prefix. If such a namespace exists it is a declared
			-- default namespace
		do
			if namespace_declarations_cache = Void then
				namespace_declarations_cache := get_namespace_declarations_from_attributes
			end
			Result := namespace_declarations_cache
		end

	attributes: DS_BILINEAR [XM_ATTRIBUTE] is
			-- List of all attributes in this element.
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
			l: DS_BILINKED_LIST [XM_ATTRIBUTE]
		do
			!! l.make
			Result := l
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				att ?= cs.item
				if att /= Void then
					l.force_last (att)
				end
				cs.forth
			end
		end

feature {ANY} -- Element change

	add_attributes (a_attributes: DS_BILINEAR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]) is
			-- Add `a_attributes' to this element.
		require
			a_attributes_not_void: a_attributes /= Void
		local
			cs: DS_BILINEAR_CURSOR [DS_PAIR [DS_PAIR [UC_STRING, UC_STRING], UC_STRING]]
		do
			from
				cs := a_attributes.new_cursor
				cs.start
			until
				cs.off
			loop
				add_attribute (cs.item.first.first, cs.item.first.second, cs.item.second)
				cs.forth
			end
		end

	add_attribute (a_name, a_prefix, a_value: UC_STRING) is
			-- Add one attribute to this element.
		local
			xml: XM_ATTRIBUTE
		do
			!! xml.make (a_name, a_prefix, a_value, Current)
			force_last (xml)
		end
		
feature {ANY} -- Removal

	remove_attribute_by_name (n: UC_STRING) is
			-- removes attribute with name `n' from element.
		require
			n_not_void: n /= Void
			has_attribute: has_attribute_by_name (n)
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				att ?= cs.item
				if att /= Void and then equal (n, att.name) then
					remove_at_cursor (cs)
						-- `remove_at_cursor' does implicit `forth' for all cursors
				else
					cs.forth
				end
			end
		end

	remove_namespace_declarations_from_attributes_recursive is
			-- Removes the namespace declarations from the attributes 
			-- in this element and all child-elements recursivly.
		do
			remove_namespace_declarations_from_attributes
			precursor
		end

	remove_namespace_declarations_from_attributes is
			-- Remove all attributes that start with "xmlns:" permanently.
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
		do
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				att ?= cs.item
				if att /= Void and then att.is_namespace_declaration then
					remove_at_cursor (cs)
						-- `remove_at_cursor' does implicit `forth' for all cursors
				else
					cs.forth
				end
			end
		end

feature {ANY} -- Basic operations

	process (x: XM_NODE_PROCESSOR) is
			-- Processing procedure for Visitor Pattern.
		do
			x.process_element (Current)
		end

	resolve_namespaces_start is
		local
			decls: XM_NAMESPACE_TABLE
		do
			!! decls.make (10)
			decls.override_with_list (namespace_declarations)
			apply_namespace_declarations (decls)
			resolve_namespaces (decls)
		end

	apply_namespace_declarations (decls: XM_NAMESPACE_TABLE) is
			-- Apply namespace declaration.
		local
			cs: DS_BILINEAR_CURSOR [XM_ATTRIBUTE]
		do
			if has_prefix then
				precursor (decls)
			else
				if decls.has_default then
					set_namespace (decls.default_ns)
				end
			end
			from
				cs := attributes.new_cursor
				cs.start
			until
				cs.off
			loop
				cs.item.apply_namespace_declarations (decls)
				cs.forth
			end
		end

feature {NONE} -- Implementation

	get_namespace_declarations_from_attributes: DS_LINKED_LIST [XM_NAMESPACE] is
		local
			cs: like new_cursor
			att: XM_ATTRIBUTE
			l: DS_LINKED_LIST [XM_NAMESPACE]
		do
			!! l.make
			Result := l
			from
				cs := new_cursor
				cs.start
			until
				cs.off
			loop
				att ?= cs.item
				if att /= Void and then att.is_namespace_declaration then
					l.force_last (att.namespace_declaration)
				end
				cs.forth
			end
		end

	namespace_declarations_cache: DS_LINKED_LIST [XM_NAMESPACE]

end -- class XM_ELEMENT

