indexing

	description:

		"Eiffel ancestors"

	library:    "Gobo Eiffel Tools Library"
	author:     "Eric Bezault <ericb@gobosoft.com>"
	copyright:  "Copyright (c) 1999, Eric Bezault and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_ANCESTORS

inherit

	DS_NESTED_LIST [ET_CLASS]

creation

	make

feature {NONE} -- Initialization

	make (a_class: like current_class; a_table: like ancestor_table) is
			-- Create a new ancestors for `a_class'.
		require
			a_class_not_void: a_class /= Void
			a_table_not_void: a_table /= Void
			no_void_ancestors: not a_table.has_item (Void)
		do
			current_class := a_class
			ancestor_table := a_table
			local_items := a_class.ancestors
			if local_items = Void then
				!! local_items.make (3)
				!! remote_items.make (3)
			else
					-- The ancestors of `current_class' have
					-- already been computed sucessfully.
				remote_items := Empty_remote_items
			end
		ensure
			current_class_set: current_class = a_class
			ancestor_table_set: ancestor_table = a_table
		end

feature -- Access

	current_class: ET_CLASS
			-- Class associated with current ancestors

	local_items: DS_HASH_SET [ET_CLASS]
			-- Ancestors held locally

	remote_items: DS_ARRAYED_LIST [ET_ANCESTORS]
			-- Ancestors held by other classes

	ancestor_table: DS_HASH_TABLE [ET_ANCESTORS, ET_CLASS]
			-- Classes and their ancestors already visited

feature -- Element change

	add_parent (a_class: ET_CLASS) is
			-- Add parent class `a_class' and its
			-- ancestors to current ancestors.
		require
			a_class_not_void: a_class /= Void
		do
			if not local_items.has (a_class) then
				local_items.force (a_class)
				a_class.add_cyclic_ancestors (ancestor_table)
				remote_items.force_last (ancestor_table.item (a_class))
			end
		end

	set_ancestors is
			-- Set `current_class.ancestors' to `local_items'.
			-- Report cycles in inheritance graph.
		do
			current_class.set_ancestors (local_items)
			if local_items.has (current_class) then
					-- (VHPR-1, ETL2 p.79)
				current_class.set_has_cycle
			end
		end

	set_has_cycle is
			-- Set `current_class.has_cycle' to True if
			-- one ancestor of `current_class' is a proper
			-- ancestor of itself (VHPR-1, ETL2 p.79).
		local
			a_cursor: DS_HASH_SET_CURSOR [ET_CLASS]
		do
			if not current_class.has_cycle then
				a_cursor := local_items.new_cursor
				from a_cursor.start until a_cursor.after loop
					if a_cursor.item.has_cycle then
						current_class.set_has_cycle
						a_cursor.go_after
					else
						a_cursor.forth
					end
				end
			end
		end

feature {DS_NESTED_LIST_FLATTENER} -- Implementation

	set_local_items (items: like local_items) is
			-- Set `local_items' to `items'.
		do
			local_items := items
		end

	add_local_item (an_item: ET_CLASS) is
			-- Add `an_item' to `local_items'.
		do
			local_items.force (an_item)
		end

feature {NONE} -- Implementation

	Empty_remote_items: DS_ARRAYED_LIST [ET_ANCESTORS] is
			-- Shared empty `remote_items'
		do
			!! Result.make (0)
		ensure
			remote_items_not_void: Result /= Void
			remote_items_empty: Result.is_empty
		end

invariant

	current_class_not_void: current_class /= Void
	no_void_ancestors: not ancestor_table.has_item (Void)

end -- class ET_ANCESTORS
