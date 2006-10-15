indexing

	description:

		"Standard tree composite nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_TREE_COMPOSITE_NODE
	
inherit

	XM_XPATH_COMPOSITE_NODE
		undefine
			document_element, next_sibling, previous_sibling, has_child_nodes, is_tree_node, as_tree_node
		redefine
			first_child, last_child
		end

	XM_XPATH_TREE_NODE
		undefine
			first_child, last_child
		redefine
			has_child_nodes, sequence_number, is_tree_composite_node, as_tree_composite_node
		end
				
feature -- Access

	is_tree_composite_node: BOOLEAN is
			-- Is `Current' a composite node?
		do
			Result := True
		end

	as_tree_composite_node: XM_XPATH_TREE_COMPOSITE_NODE is
			-- `Current' seen as a composite node
		do
			Result := Current
		end

	sequence_number: XM_XPATH_64BIT_NUMERIC_CODE is
			-- Node sequence number (in document order)
			-- In this implementation, parent nodes (elements and roots)
			--  have a zero least-significant word, while namespaces,
			--  attributes, text nodes, comments, and PIs have
			--  the top word the same as their owner and the
			--  bottom half reflecting their relative position.
			-- This is the default implementation for child nodes.
		do
			create Result.make (sequence_number_high_word, 0)
		end

	string_value: STRING is
			-- String-value
		local
			a_node: XM_XPATH_NODE
			a_text_node: XM_XPATH_TREE_TEXT
			a_string: ST_COPY_ON_WRITE_STRING
		do

			-- Return the concatentation of the string value of all it's
			-- text-node descendants.

			from
				a_node := first_child
			until
				a_node = Void or else not a_node.as_tree_node.is_tree_text
			loop
				a_text_node := a_node.as_tree_node.as_tree_text
				if a_string = Void then
					create a_string.make (a_text_node.string_value)
				else
					a_string.append_string (a_text_node.string_value)
				end
				a_node := a_text_node.next_node_in_document_order (Current)
			end
			if a_string = Void then
				Result := ""
			else
				Result := a_string.item
			end
		end

	first_child: XM_XPATH_NODE is
			-- The first child of this node;
			-- If there are no children, return `Void'
		do
			if children.count > 0 then
				Result := nth_child (1)
			end
		end

	nth_child (an_index: INTEGER): XM_XPATH_NODE is
			-- The nth child of this node
		require
			valid_index: is_valid_child_index (an_index)
		do
				Result := children.item (an_index)
		end

	last_child: XM_XPATH_NODE is
			-- The last child of this node;
			-- If there are no children, return `Void'
		do
			if children.count > 0 then
				Result := children.item (children.count)
			end
		end

	child_iterator (a_node_test: XM_XPATH_NODE_TEST): XM_XPATH_AXIS_ITERATOR [XM_XPATH_TREE_NODE] is
			-- Iterator over `children'
		do
			create {XM_XPATH_TREE_CHILD_ENUMERATION} Result.make (Current, a_node_test)
		ensure
			child_iterator_invulnerable: Result /= Void
		end

	is_idrefs_attribute (an_index: INTEGER): BOOLEAN is
			-- Is `an_index' the number of an attribute with an is-idrefs property of `True'
		do
			-- False for documents
		end
	
feature -- Status report

	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		do
			Result := children.count > 0
		end

	is_valid_child_index (an_index: INTEGER): BOOLEAN is
			-- Doss `an_index' represent a valid child?
		do
			Result := an_index > 0 and then an_index <= children.count
		end

feature -- Element change

	add_child (a_child: XM_XPATH_TREE_NODE) is
			-- Add a child node to this node.
			-- Note: normalizing adjacent text nodes
			--  is the responsibility of the caller
		require
			child_not_void: a_child /= Void
		do
			if not children.extendible (1) then
				children.resize (2 * children.count)
			end
			children.put_last (a_child)
			a_child.set_parent (Current, children.count)
		end

	replace_child (a_child: XM_XPATH_TREE_NODE; a_index: INTEGER) is
			-- Replace child at `an_index' with `a_child'
		require
			child_not_void: a_child /= Void
			valid_index: is_valid_child_index (a_index)
		do
			children.replace (a_child, a_index)
			a_child.set_parent (Current, a_index)
		end


feature {XM_XPATH_TREE_BUILDER} -- Restricted
	
	sequence_number_high_word: INTEGER
			-- High_word of the sequence number

feature {NONE} -- Implementation

	children: DS_ARRAYED_LIST [XM_XPATH_TREE_NODE]
			-- Child_nodes

	update_indices is
			-- Update child indices to reflect removal.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
		do
			from l_cursor := children.new_cursor; l_cursor.start until l_cursor.after loop
				l_cursor.item.set_child_index (l_cursor.index)
				l_cursor.forth
			end
		end

invariant

	children_not_void: children /= Void
	strictly_positive_sequence_number: sequence_number_high_word > 0

end
