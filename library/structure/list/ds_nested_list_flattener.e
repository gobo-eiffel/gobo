indexing

	description:

		"Nested list flatteners: machines that make sure %
		%that all items accessible remotely in some given %
		%nested lists are also kept locally. The nested %
		%list flatteners take care of possible cycles in %
		%the di-graph of nested lists."

	library:    "Gobo Eiffel Structure Library"
	author:     "Eric Bezault <ericb@gobo.demon.co.uk>"
	copyright:  "Copyright (c) 1998, Eric Bezault"
	date:       "$Date$"
	revision:   "$Revision$"

class DS_NESTED_LIST_FLATTENER [G]

creation

	make

feature {NONE} -- Initialization

	make is
			-- Create a new nested list flattener.
		do
		end

feature -- Basic operations

	flatten (nested_lists: DS_LIST [DS_NESTED_LIST [G]]) is
			-- Make sure that for each list in `nested_lists'
			-- all items are held locally, even those that
			-- could be accessed remotely.
		require
			nested_lists_not_void: nested_lists /= Void
			no_void_nested_list: not nested_lists.has (Void)
		local
			a_cursor: DS_LINEAR_CURSOR [DS_NESTED_LIST [G]]
			pending: DS_ARRAYED_STACK [DS_NESTED_LIST [G]]
			processed: DS_ARRAYED_LIST [DS_NESTED_LIST [G]]
			a_list: DS_NESTED_LIST [G]
			nb: INTEGER
		do
			nb := nested_lists.count
			!! pending.make (nb)
			!! processed.make (nb)
			a_cursor := nested_lists.new_cursor
			from a_cursor.start until a_cursor.after loop
				a_list := a_cursor.item
				if not processed.has (a_list) then
					traverse (a_list, pending, processed)
				end
				a_cursor.forth
			end
		end

feature {NONE} -- Implementation

	traverse (a_list: DS_NESTED_LIST [G];
		pending: DS_STACK [DS_NESTED_LIST [G]];
		processed: DS_LIST [DS_NESTED_LIST [G]]) is
			-- Traverse nested lists containing the remote
			-- items of `a_list' and copy them locally.
			-- `pending' is the stack of nested lists
			-- currently being traversed and `processed'
			-- keeps track of the nested lists already
			-- traversed.
		require
			a_list_not_void: a_list /= Void
			pending_not_void: pending /= Void
			no_void_pending: not pending.has (Void)
			processed_not_void: processed /= Void
			no_void_processed: not processed.has (Void)
			a_list_not_pending: not pending.has (a_list)
			a_list_not_processed: not processed.has (a_list)
		local
			remote_cursor: DS_LINEAR_CURSOR [DS_NESTED_LIST [G]]
			remote_items: DS_NESTED_LIST [G]
			local_cursor: DS_LINEAR_CURSOR [G]
			local_items: DS_LIST [G]
			cyclic: BOOLEAN
			an_item: G
		do
			pending.force (a_list)
			local_items := a_list.local_items
			remote_cursor := a_list.remote_items.new_cursor
			from remote_cursor.start until remote_cursor.after loop
				remote_items := remote_cursor.item
				if remote_items /= a_list then
					if pending.has (remote_items) then
							-- `remote_items' is being processed.
							-- We found a cycle in the di-graph
							-- of nested lists.
						cyclic := True
					elseif not processed.has (remote_items) then
							-- `remove_items' has not been flattened
							-- yet. Take care of that now.
						traverse (remote_items, pending, processed)
						if pending.has (remote_items) then
								-- `remote_items' is being processed.
								-- We found a cycle in the di-graph
								-- of nested lists.
							cyclic := True
						end
					end
					local_cursor := remote_items.local_items.new_cursor
					from local_cursor.start until local_cursor.after loop
						an_item := local_cursor.item
						if not local_items.has (an_item) then
							local_items.force_last (an_item)
						end
						local_cursor.forth
					end
				end
				remote_cursor.forth
			end
			if not cyclic then
					-- All nested lists which have been left
					-- above `a_list' in the `pending' stack
					-- are in the same cycle as `a_list' in
					-- the di-graph made up of the nested lists.
					-- Therefore they all have the same items.
				from
					remote_items := pending.item
					processed.force_last (remote_items)
					pending.remove
				until
					remote_items = a_list
				loop
					remote_items.local_items.wipe_out
					remote_items.local_items.append_last (local_items)
					remote_items := pending.item
					processed.force_last (remote_items)
					pending.remove
				end
			end
		end

end -- class DS_NESTED_LIST_FLATTENER
