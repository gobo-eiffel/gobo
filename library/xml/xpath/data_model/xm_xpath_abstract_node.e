indexing

	description:

		"Gexslt's abstraction of a Node"

	library: "Gobo Eiffel XML XPath Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_ABSTRACT_NODE

inherit

	XM_XPATH_NODE

	KL_SHARED_STANDARD_FILES
	
	-- This class represents a node in gexslt's object model.
	-- It combines the features of the XPath data model, 
	--  with some of the features from the W3C's dom::Node (for convenience).
	
feature -- Access

	root: XM_XPATH_NODE is
			-- The root node for `Current';
			-- This is not necessarily a Document node.
		local
			parent_node: XM_XPATH_NODE
		do
			from
				Result := Current
				parent_node := parent
			until
				parent_node = Void
			loop
				Result := parent_node
				parent_node := parent_node.parent
			end
		ensure
			root_node_not_void: Result /= Void
		end

	type_annotation: INTEGER is
			--Type annotation of this node, if any
		do
			if item_type = Element_node then
				Result := Untyped_any_type
			else
				Result := Untyped_atomic_type
			end
		end

	fingerprint: INTEGER is
			-- Fingerprint of this node - used in matching names
		deferred
		end
	
	name_code: INTEGER is
			-- Name code this node - used in displaying names
		deferred
		end
	
	document_root: XM_XPATH_DOCUMENT is
			-- The document node for `Current';
			-- If `Current' is in a document fragment, then return Void
		local
			the_root: XM_XPATH_DOCUMENT
		do
			the_root ?= root
			if the_root = Void then
				debug ("XPath abstract node")
					std.error.put_string ("Document node is void%N")
				end
			else
				debug ("XPath abstract node")
					std.error.put_string ("Document node kind is ")
					std.error.put_string (the_root.node_kind)
					std.error.put_new_line
				end
			end
			if the_root /= Void and then the_root.node_kind.is_equal ("document") then
				Result := the_root
			end
		end

	first_child: XM_XPATH_ABSTRACT_NODE is
			-- The first child of this node;
			-- If there are no children, return `Void'
		local
			iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ABSTRACT_NODE]
		do
			iterator := new_axis_iterator (Child_axis)
			if iterator.before and then not iterator.after then
				iterator.forth
			end
			if not iterator.before then Result := iterator.item_for_iteration end
		end

	last_child: XM_XPATH_ABSTRACT_NODE is
			-- The last child of this node;
			-- If there are no children, return `Void'
		local
			iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ABSTRACT_NODE]
		do
			iterator := new_axis_iterator (Child_axis)
			from
			until
				iterator.after
			loop
				if not iterator.after then
					iterator.forth
				end
			end
			if not iterator.before then Result := iterator.item_for_iteration end
		end

	previous_sibling: XM_XPATH_ABSTRACT_NODE is
			-- The previous sibling of this node;
			-- If there is no such node, return `Void'
		local
			iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ABSTRACT_NODE]
		do
			iterator := new_axis_iterator (Preceding_sibling_axis)
			if iterator.before and not iterator.after then
				iterator.forth
			end
			if not iterator.before then Result := iterator.item_for_iteration end
		end
	
	next_sibling: XM_XPATH_ABSTRACT_NODE is
			-- The next sibling of this node;
			-- If there is no such node, return `Void'
		local
			iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_ABSTRACT_NODE]
		do
			iterator := new_axis_iterator (Following_sibling_axis)
			if iterator.before and not iterator.after then
				iterator.forth
			end
			if not iterator.before then Result := iterator.item_for_iteration end
		end
	
	document_element: XM_XPATH_ELEMENT is
			-- The top-level element;
			-- If the document is not well-formed
			-- (i.e. it is a document fragment), then
			-- return the last element child of the document root.
		local
			the_root: XM_XPATH_DOCUMENT
			iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
			element_node_test: XM_XPATH_NODE_KIND_TEST
		do
			the_root := document_root
			if the_root = Void then
				debug ("XPath abstract node")
					std.error.put_string ("Document root is void%N")
				end
				Result := Void
			else
				create element_node_test.make (Element_node)
				iterator := the_root.new_axis_iterator_with_node_test (Child_axis, element_node_test)
				debug ("XPath abstract node")
					std.error.put_string ("Document element: iterator is after? ")
					std.error.put_string (iterator.after.out)
					std.error.put_new_line
				end
				if iterator.before and then not iterator.after then
					iterator.forth
					Result ?= iterator.item_for_iteration
						check
							node_is_element: Result /= Void
						end
				end
			end
		end
	
	typed_value: XM_XPATH_VALUE is
			-- Typed value
		local
			the_type: INTEGER
			value_as_string: STRING
			a_string_value: XM_XPATH_STRING_VALUE
		do
			the_type := type_annotation
			if the_type = Untyped_atomic_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			elseif the_type = Untyped_any_type then
				create {XM_XPATH_UNTYPED_ATOMIC_VALUE} Result.make (string_value)
			else
				-- TODO complex types should be dealt with properly
				create a_string_value.make (string_value)
				-- This is wrong, as convert requires and yields an atomic type
				-- Result := a_string_value.convert (the_type)
			end
		end

feature -- Status report
	
	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		deferred
		end
	
--	generate_id: STRING is
--			-- Generate a unique id for this node
--		deferred
--		end

--	system_id: STRING is
--			-- SYSTEM id for this node's containing entity
--		deferred
--		end

feature -- Status report

--	is_same_node (other: XM_XPATH_NODE) is
--			-- Does `Current' represent the same node in the tree as `other'?
--		require
--			other_node_not_void: other /= Void
--		deferred
--		end

end
