note

	description:

		"Eiffel lists of iteration components"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2012-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ITERATION_COMPONENT_LIST

inherit

	ET_TAIL_LIST [ET_ITERATION_COMPONENT]

create

	make, make_with_capacity

feature -- Access

	iteration_component (i: INTEGER): ET_ITERATION_COMPONENT
			-- Iteration component at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
		ensure
			iteration_component_not_void: Result /= Void
		end

	index_of_name (a_name: ET_IDENTIFIER): INTEGER
			-- Index of first iteration component with iteration item named `a_name' 
			-- which is in scope (by convention, we are in the scope of an iteration 
			-- component if its `item_name' is not marked as 'is_iteration_item');
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_item_name: ET_IDENTIFIER
		do
			from i := count until i < 1 loop
				l_item_name := storage.item (i).item_name
				if l_item_name.same_identifier (a_name) and then not l_item_name.is_iteration_item then
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
			in_scope: Result > 0 implies not iteration_component (Result).item_name.is_iteration_item
		end

feature -- Duplication

	cloned_iteration_component_list: ET_ITERATION_COMPONENT_LIST
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

	fixed_array: KL_SPECIAL_ROUTINES [ET_ITERATION_COMPONENT]
			-- Fixed array routines
		once
			create Result
		end

end
