note

	description:

		"Eiffel lists of across components"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ACROSS_COMPONENT_LIST

inherit

	ET_TAIL_LIST [ET_ACROSS_COMPONENT]

create

	make, make_with_capacity

feature -- Access

	across_component (i: INTEGER): ET_ACROSS_COMPONENT
			-- Across component at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
		ensure
			across_component_not_void: Result /= Void
		end

	index_of_name (a_name: ET_IDENTIFIER): INTEGER
			-- Index of first Across component with cursor named `a_name' which is in scope
			-- (by convention, we are in the scope of an Across component if its `cursor_name'
			-- is not marked as 'is_across_cursor');
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_cursor_name: ET_IDENTIFIER
		do
			from i := count until i < 1 loop
				l_cursor_name := storage.item (i).cursor_name
				if l_cursor_name.same_identifier (a_name) and then not l_cursor_name.is_across_cursor then
					Result := i
						-- Jump out of the loop.
					i := 0
				else
					i := i - 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
			in_scope: Result > 0 implies not across_component (Result).cursor_name.is_across_cursor
		end

feature -- Duplication

	cloned_across_component_list: ET_ACROSS_COMPONENT_LIST
			-- Cloned version of current list
		local
			i, nb: INTEGER
		do
			nb := count
			create Result.make_with_capacity (nb)
			from i := 1 until i > nb loop
				Result.put_last (storage.item (i))
				i := i + 1
			end
		ensure
			cloned_not_void: Result /= Void
			count_set: Result.count = count
			capacity_set: Result.capacity = count
		end

feature {NONE} -- Implementation

	fixed_array: KL_SPECIAL_ROUTINES [ET_ACROSS_COMPONENT]
			-- Fixed array routines
		once
			create Result
		end

end
