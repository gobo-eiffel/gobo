indexing

	description:

		"Tables which map XML nodes to their positions in source documents"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_POSITION_TABLE

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new position table.
		do
			create table.make
		end

feature -- Status report

	has (a_node: XM_NODE): BOOLEAN is
			-- Is there a position associated with `a_node'?
		require
			a_node_not_void: a_node /= Void
		local
			a_cursor: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
		do
			a_cursor := table.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.second = a_node then
					Result := True
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		end

feature -- Access

	item (a_node: XM_NODE): XM_POSITION is
			-- Position associated with `a_node'
		require
			a_node_not_void: a_node /= Void
			has_node: has (a_node)
		local
			a_cursor: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
		do
			a_cursor := table.new_cursor
			from a_cursor.start until a_cursor.after loop
				if a_cursor.item.second = a_node then
					Result := a_cursor.item.first
					a_cursor.go_after -- Jump out of the loop.
				else
					a_cursor.forth
				end
			end
		ensure
			position_not_void: Result /= Void
		end

feature -- Element change

	put (a_position: XM_POSITION; a_node: XM_NODE) is
			-- Associate `a_node' with position `a_position'.
		require
			a_position_not_void: a_position /= Void
			a_node_not_void: a_node /= Void
			not_has_node: not has (a_node)
		local
			a_pair: DS_PAIR [XM_POSITION, XM_NODE]
		do
			create a_pair.make (a_position, a_node)
			table.put_last (a_pair)
		ensure
			has_node: has (a_node)
			inserted: item (a_node) = a_position
		end

feature {NONE} -- Implementation

	table: DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]]
			-- List of (node, position) pairs

invariant

	table_not_void: table /= Void
	no_void_pair: not table.has (Void)
	-- no_void_position: forall p in table, p.first /= Void
	-- no_void_node: forall p in table, p.second /= Void

end
