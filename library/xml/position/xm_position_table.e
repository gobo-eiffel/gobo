indexing

	description:

		"A Table which maps XML nodes to their position in the source document"

	library:	"Gobo Eiffel Kernel Library"
	author:		"Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:	"Copyright (c) 2001, Andreas Leitner and others"
	license:	"Eiffel Forum Freeware License v1 (see forum.txt)"
	date:		"$Date$"
	revision:	"$Revision$"

class XM_POSITION_TABLE

creation

	make

feature {ANY}

	make is
		do
			!! table.make
		end

feature {ANY}

	put (a_position: XM_POSITION; node: XM_NODE) is
			-- Add entry to list that associated node `node'
			-- with position `position'
		local
			pair: DS_PAIR [XM_POSITION, XM_NODE]
		do
			!! pair.make (a_position, node)
			table.put_last (pair)
		end

	has (node: XM_NODE): BOOLEAN is
			-- Does this table know about the position of
			-- node `node'?
		local
			cs: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
		do
			from
				cs := table.new_cursor
				cs.start
			until
				cs.off or Result = True
			loop
				if cs.item.second = node then
					Result := True
				else
					cs.forth
				end
			end
		end

	item (node: XM_NODE): XM_POSITION is
			-- Retrieve position for node `node'.
		require
			has_node: has (node)
		local
			cs: DS_LINKED_LIST_CURSOR [DS_PAIR [XM_POSITION, XM_NODE]]
		do
			from
				cs := table.new_cursor
				cs.start
			until
				cs.off or Result /= Void
			loop
				if cs.item.second = node then
					Result := cs.item.first
				else
					cs.forth
				end
			end
		ensure
			result_not_void: Result /= Void
		end

feature {NONE}

	table: DS_LINKED_LIST [DS_PAIR [XM_POSITION, XM_NODE]]
			-- list of node, position pairs

end -- class XM_POSITION_TABLE

