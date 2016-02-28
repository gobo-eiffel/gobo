note

	description:

		"XPath nodes that can have children"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003-2014, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XPATH_COMPOSITE_NODE

inherit

	XM_XPATH_NODE
		redefine
			first_child, last_child
		end

feature -- Access

	first_child: detachable XM_XPATH_NODE
			-- The first child of this node;
			-- If there are no children, return `Void'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			l_iterator := new_axis_iterator (Child_axis)
			l_iterator.start
			if not l_iterator.after then
				Result := l_iterator.item
			end
		end

	last_child: detachable XM_XPATH_NODE
			-- The last child of this node;
			-- If there are no children, return `Void'.
		local
			l_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			l_iterator := new_axis_iterator (Child_axis)
			from
				l_iterator.start
			until
				l_iterator.after
			loop
				Result := l_iterator.item
				check
					last_child_not_void: Result /= Void
					-- Because not `before' (due to `start') and not `after' (due to `until')
				end
				l_iterator.forth
			end
		end

invariant

	-- Uncomment these when agents are available to Gobo classes.
	-- proper_children: children.for_all (agent is_possible_child)
	-- sorted_children: children are sorted in order of ascending `identity'. (document order).
	-- children.sorted
	-- normalized_text_nodes: no two consecutive child nodes may both be text nodes
	-- parent_relationship: children.for_all (agent (parent.is_equal (Current)))
	-- no_duplicates: children.for_all (--all nodes are distinct)

end

