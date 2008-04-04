indexing

	description:

		"Standard tree composite nodes"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
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
		do
			if saved_sequence_number = Void then
				create saved_sequence_number.make (sequence_number_high_word, 0)
			end
			Result := saved_sequence_number
		ensure then
			saved_sequence_number_not_void: saved_sequence_number /= Void
		end

	string_value: STRING is
			-- String-value
		local
			l_node: XM_XPATH_NODE
			l_string: ST_COPY_ON_WRITE_STRING
		do
			-- TODO: review why copy-on-write is being used. The string value
			--       should be read-only, in which case we might be able to
			--       cache it.
			
			-- Return the concatentation of the string value of all it's
			-- text-node descendants.

			from
				l_node := first_child
			until
				l_node = Void
			loop
				if l_node.as_tree_node.is_tree_text then
					if l_string = Void then
						create l_string.make (l_node.as_tree_node.as_tree_text.string_value)
					else
						l_string.append_string (l_node.as_tree_node.as_tree_text.string_value)
					end
				end
				l_node := l_node.as_tree_node.next_node_in_document_order (Current)
			end
			if l_string = Void then
				Result := ""
			else
				Result := l_string.item
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

feature -- Status report

	has_child_nodes: BOOLEAN is
			-- Does `Current' have any children?
		do
			Result := children.count > 0
		end

	is_valid_child_index (a_index: INTEGER): BOOLEAN is
			-- Does `a_index' represent a valid child?
		do
			Result := a_index > 0 and a_index <= children.count
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

feature -- Removal

	strip_whitespace_nodes is
			-- Strip all whitespace-only text nodes whose immediate following sibling is xsl:param or xsl:sort.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
			l_previous_all_white: BOOLEAN
			l_index_reduction: INTEGER
		do
			from
				l_cursor := children.new_cursor
				l_cursor.start
			until
				l_cursor.after
			loop
				if l_previous_all_white and l_cursor.item.is_non_white_following_sibling then
					l_previous_all_white := False
					l_cursor.remove_left
					l_index_reduction := l_index_reduction + 1
					l_cursor.item.reduce_child_index (l_index_reduction)
					l_cursor.item.as_tree_element.strip_whitespace_nodes
				elseif l_cursor.item.is_tree_text and then l_cursor.item.as_tree_text.is_all_whitespace then
					if l_index_reduction > 0 then
						l_cursor.item.reduce_child_index (l_index_reduction)
					end
					l_previous_all_white := True
				else
					if l_index_reduction > 0 then
						l_cursor.item.reduce_child_index (l_index_reduction)
					end
					l_previous_all_white := False
					if l_cursor.item.is_tree_element then
						l_cursor.item.as_tree_element.strip_whitespace_nodes
					end
				end
				l_cursor.forth
			end
		end

feature {XM_XPATH_TREE_BUILDER} -- Restricted
	
	sequence_number_high_word: INTEGER
			-- High_word of the sequence number

feature {NONE} -- Implementation

	children: DS_ARRAYED_LIST [XM_XPATH_TREE_NODE]
			-- Child_nodes

	saved_sequence_number: XM_XPATH_64BIT_NUMERIC_CODE
			-- Cache for `sequence_number'

	update_indices is
			-- Update child indices to reflect removal.
		local
			l_cursor: DS_ARRAYED_LIST_CURSOR [XM_XPATH_TREE_NODE]
		do
			from l_cursor := children.new_cursor
			l_cursor.start until
				l_cursor.after
			loop
				l_cursor.item.set_child_index (l_cursor.index)
				l_cursor.forth
			end
		end

invariant

	children_not_void: children /= Void
	strictly_positive_sequence_number: sequence_number_high_word > 0

end
