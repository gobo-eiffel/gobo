note

	description:

	"[
		Eiffel across cursor scopes, to determine whether a given occurrence
		of an across cursor appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2014, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_CURSOR_SCOPE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new across cursor scope.
		do
			hidden_count := 0
			create across_components.make (50)
		ensure
			count_set: count = 0
			hidden_count_set: hidden_count = 0
		end

feature -- Status report

	has_across_cursor (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of across cursor `a_name'?
			-- (Ignore hidden across cursors.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			i := across_components.count
			nb := hidden_count + 1
			from until i < nb loop
				if across_components.item (i).cursor_name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

	has_hidden_across_cursor (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of across cursor `a_name', although it has been hidden?
			-- (We are probably currently analyzing an inline agent and `a_name' has
			-- been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := hidden_count
			from until i < 1 loop
				if across_components.item (i).cursor_name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	across_component (a_name: ET_IDENTIFIER): detachable ET_ACROSS_COMPONENT
			-- If we are currently in the scope of across cursor `a_name',
			-- then return its associated across component, otherwise Void
			-- (Ignore hidden across cursors.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_across_component: ET_ACROSS_COMPONENT
		do
			i := across_components.count
			nb := hidden_count + 1
			from until i < nb loop
				l_across_component := across_components.item (i)
				if l_across_component.cursor_name.same_identifier (a_name) then
					Result := l_across_component
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			across_component_not_void: has_across_cursor (a_name) = (Result /= Void)
		end

	hidden_across_component (a_name: ET_IDENTIFIER): detachable ET_ACROSS_COMPONENT
			-- If we are currently in the scope of across cursor `a_name' although it has
			-- been hidden, then return its associated across component, otherwise Void
			-- (We are probably currently analyzing an inline agent and `a_name'
			-- has been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_across_component: ET_ACROSS_COMPONENT
		do
			i := hidden_count
			from until i < 1 loop
				l_across_component := across_components.item (i)
				if l_across_component.cursor_name.same_identifier (a_name) then
					Result := l_across_component
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			across_component_not_void: has_hidden_across_cursor (a_name) = (Result /= Void)
		end

	across_components: DS_ARRAYED_LIST [ET_ACROSS_COMPONENT]
			-- Across components for which we are currently within scope their cursor
			-- (Hidden across components are stored between indexes 1 and `hidden_count'.)

feature -- Measurement

	count: INTEGER
			-- Number of across components for which we are currently within scope of their cursors
			-- (Hidden across components are counted.)
		do
			Result := across_components.count
		ensure
			count_not_negative: Result >= 0
		end

	hidden_count: INTEGER
			-- Number of across components for which we consider that
			-- we are not currently within the scope of their
			-- cursors. Useful when analyzing inline agents: we
			-- should not use across cursors declared in the
			-- enclosing feature or inline agent.

feature -- Element change

	add_across_component (a_across_component: ET_ACROSS_COMPONENT)
			-- Indicate that we are currently within the scope
			-- of the cursor of `a_across_component'.
		require
			a_across_component_not_void: a_across_component /= Void
		do
			across_components.force_last (a_across_component)
		ensure
			one_more: count = old count + 1
		end

	remove_across_components (n: INTEGER)
			-- Indicate that we are not in the scope of
			-- the last `n' across cursors.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n <= count - hidden_count
		do
			across_components.prune_last (n)
		ensure
			removed: count = old count - n
		end

	keep_across_components (n: INTEGER)
			-- Indicate that we are now in the scope of
			-- only the first `n' across cursors.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n >= hidden_count
		do
			across_components.keep_first (n)
		ensure
			kept: count = n
		end

	hide_across_components (n: INTEGER)
			-- Indicate that from now on we consider that we
			-- are not in the scope of the first `n' across
			-- cursors. Useful when analyzing inline agents: we
			-- should not use across cursors declared in the
			-- enclosing feature or inline agent.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
		do
			hidden_count := n
		ensure
			hidden: hidden_count = n
			same_count: count = old count
		end

	wipe_out
			-- Indicate that we are in the scope of no across cursor anymore.
		do
			hidden_count := 0
			across_components.wipe_out
		ensure
			wiped_out: count = 0
			no_hidden: hidden_count = 0
		end

invariant

	across_components_not_void: across_components /= Void
	no_void_across_component: not across_components.has_void
	hidden_count_not_negative: hidden_count >= 0
	hidden_count_small_enough: hidden_count <= count

end
