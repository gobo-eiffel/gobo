note
	description: "[
		Sequential, one-way linked lists that call an action
		sequence when an item is removed or added.
		]"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	keywords: "event, action, linked, list"
	date: "$Date: 2018-11-14 15:15:17 +0000 (Wed, 14 Nov 2018) $"
	revision: "$Revision: 102463 $"

class
	ACTIVE_LIST [G]

inherit
	INTERACTIVE_LIST [G]
		redefine
			default_create,
			make_filled,
			on_item_added_at,
			on_item_removed_at
		end

create
	default_create

create {ACTIVE_LIST}
	make_filled

feature {NONE} -- Initialization

	default_create
			-- Initialize
		do
			create add_actions
			create remove_actions
			Precursor {INTERACTIVE_LIST}
		end

	make_filled (n: INTEGER)
			-- <Precursor>
		do
			create add_actions
			create remove_actions
			Precursor {INTERACTIVE_LIST} (n)
		end

feature -- Access

	add_actions: ACTION_SEQUENCE [TUPLE [like item]]
			-- Actions performed when an item has just been added.

	remove_actions: ACTION_SEQUENCE [TUPLE [like item]]
			-- Actions performed when an item has just been removed.

feature -- Miscellaneous

	on_item_added_at (an_item: like item; item_index: INTEGER)
			-- `an_item' has just been added at index `item_index'.
		local
			a_index: INTEGER
		do
				-- Store index for resetting after operation to avoid side-effect
			a_index := index
			add_actions.call ([an_item])
			go_i_th (a_index)
		end

	on_item_removed_at (an_item: like item; item_index: INTEGER)
			-- `an_item' has just been removed at index `item_index'.
		local
			a_index: INTEGER
		do
				-- Store index for resetting after operation to avoid side-effect
			a_index := index
			remove_actions.call ([an_item])
			go_i_th (a_index)
		end

feature {NONE} -- Implementation

	new_filled_list (n: INTEGER): like Current
			-- New list with `n' elements.
		obsolete "Use explicit creation instead. See also explanations for `duplicate`. [2018-11-30]"
		do
			create Result.make_filled (n)
		end

invariant
	add_actions_not_void: add_actions /= Void
	remove_actions_not_void: remove_actions /= Void

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2018, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
