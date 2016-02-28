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
			-- Index of Across component with cursor named `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			from i := count until i < 1 loop
				if storage.item (i).cursor_name.same_identifier (a_name) then
					Result := i
					i := 0 -- Jump out of the loop.
				else
					i := i - 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
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
