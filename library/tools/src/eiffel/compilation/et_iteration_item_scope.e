note

	description:

	"[
		Eiffel iteration item scopes, to determine whether a given occurrence
		of an iteration item appears in its scope or not.
	]"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ITERATION_ITEM_SCOPE

create

	make

feature {NONE} -- Initialization

	make
			-- Create a new iteration item scope.
		do
			hidden_count := 0
			create iteration_components.make (50)
		ensure
			count_set: count = 0
			hidden_count_set: hidden_count = 0
		end

feature -- Status report

	has_iteration_item (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of iteration item `a_name'?
			-- (Ignore hidden iteration items.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
		do
			i := iteration_components.count
			nb := hidden_count + 1
			from until i < nb loop
				if iteration_components.item (i).item_name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

	has_hidden_iteration_item (a_name: ET_IDENTIFIER): BOOLEAN
			-- Are we currently in the scope of iteration item `a_name', although it has been hidden?
			-- (We are probably currently analyzing an inline agent and `a_name' has
			-- been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			i := hidden_count
			from until i < 1 loop
				if iteration_components.item (i).item_name.same_identifier (a_name) then
					Result := True
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		end

feature -- Access

	iteration_component (a_name: ET_IDENTIFIER): detachable ET_ITERATION_COMPONENT
			-- If we are currently in the scope of iteration item `a_name',
			-- then return its associated iteration component, otherwise Void
			-- (Ignore hidden iteration items.)
		require
			a_name_not_void: a_name /= Void
		local
			i, nb: INTEGER
			l_iteration_component: ET_ITERATION_COMPONENT
		do
			i := iteration_components.count
			nb := hidden_count + 1
			from until i < nb loop
				l_iteration_component := iteration_components.item (i)
				if l_iteration_component.item_name.same_identifier (a_name) then
					Result := l_iteration_component
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			iteration_component_not_void: has_iteration_item (a_name) = (Result /= Void)
		end

	hidden_iteration_component (a_name: ET_IDENTIFIER): detachable ET_ITERATION_COMPONENT
			-- If we are currently in the scope of iteration item `a_name' although it has
			-- been hidden, then return its associated iteration component, otherwise Void
			-- (We are probably currently analyzing an inline agent and `a_name'
			-- has been declared in an enclosing feature or inline agent.)
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_iteration_component: ET_ITERATION_COMPONENT
		do
			i := hidden_count
			from until i < 1 loop
				l_iteration_component := iteration_components.item (i)
				if l_iteration_component.item_name.same_identifier (a_name) then
					Result := l_iteration_component
					i := 0 -- Jump out of the loop
				else
					i := i - 1
				end
			end
		ensure
			iteration_component_not_void: has_hidden_iteration_item (a_name) = (Result /= Void)
		end

	iteration_components: DS_ARRAYED_LIST [ET_ITERATION_COMPONENT]
			-- Iteration components for which we are currently within scope their iteration item
			-- (Hidden iteration components are stored between indexes 1 and `hidden_count'.)

feature -- Measurement

	count: INTEGER
			-- Number of iteration components for which we are currently within scope of their iteration items
			-- (Hidden iteration components are counted.)
		do
			Result := iteration_components.count
		ensure
			count_not_negative: Result >= 0
		end

	hidden_count: INTEGER
			-- Number of iteration components for which we consider that
			-- we are not currently within the scope of their iteration
			-- items. Useful when analyzing inline agents: we
			-- should not use iteration items declared in the
			-- enclosing feature or inline agent.

feature -- Element change

	add_iteration_component (a_iteration_component: ET_ITERATION_COMPONENT)
			-- Indicate that we are currently within the scope
			-- of the iteration item of `a_iteration_component'.
		require
			a_iteration_component_not_void: a_iteration_component /= Void
		do
			iteration_components.force_last (a_iteration_component)
		ensure
			one_more: count = old count + 1
		end

	remove_iteration_components (n: INTEGER)
			-- Indicate that we are not in the scope of
			-- the last `n' iteration items.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n <= count - hidden_count
		do
			iteration_components.prune_last (n)
		ensure
			removed: count = old count - n
		end

	keep_iteration_components (n: INTEGER)
			-- Indicate that we are now in the scope of
			-- only the first `n' iteration items.
		require
			n_large_enough: n >= 0
			n_small_enough: n <= count
			hidden_constraint: n >= hidden_count
		do
			iteration_components.keep_first (n)
		ensure
			kept: count = n
		end

	hide_iteration_components (n: INTEGER)
			-- Indicate that from now on we consider that we
			-- are not in the scope of the first `n' iteration
			-- items. Useful when analyzing inline agents: we
			-- should not use iteration items declared in the
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
			-- Indicate that we are in the scope of no iteration item anymore.
		do
			hidden_count := 0
			iteration_components.wipe_out
		ensure
			wiped_out: count = 0
			no_hidden: hidden_count = 0
		end

invariant

	iteration_components_not_void: iteration_components /= Void
	no_void_iteration_component: not iteration_components.has_void
	hidden_count_not_negative: hidden_count >= 0
	hidden_count_small_enough: hidden_count <= count

end
