indexing

	description:

		"XPath nodes that can have children"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2003, Colin Adams and others"
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

	first_child: XM_XPATH_NODE is
			-- The first child of this node;
			-- If there are no children, return `Void'.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			an_iterator := new_axis_iterator (Child_axis)
			an_iterator.start
			if not an_iterator.after then Result := an_iterator.item end
		end

	last_child: XM_XPATH_NODE is
			-- The last child of this node;
			-- If there are no children, return `Void'.
		local
			an_iterator: XM_XPATH_SEQUENCE_ITERATOR [XM_XPATH_NODE]
		do
			an_iterator := new_axis_iterator (Child_axis)
			from
				an_iterator.start
			until
				an_iterator.after
			loop
				Result := an_iterator.item
				check
					result_not_void: Result /= Void
					-- Because not before (due to start) and not after (due to until)
				end
				an_iterator.forth
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

