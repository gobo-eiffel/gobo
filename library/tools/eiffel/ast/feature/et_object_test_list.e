note

	description:

		"Eiffel lists of object-tests with a local name"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2009, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_OBJECT_TEST_LIST

inherit

	ET_TAIL_LIST [ET_NAMED_OBJECT_TEST]

create

	make, make_with_capacity

feature -- Access

	object_test (i: INTEGER): ET_NAMED_OBJECT_TEST is
			-- Object-test at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
		ensure
			object_test_not_void: Result /= Void
		end

	index_of_name (a_name: ET_IDENTIFIER): INTEGER is
			-- Index of object-test with local named `a_name';
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
		do
			from i := count until i < 1 loop
				if storage.item (i).name.same_identifier (a_name) then
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

	cloned_object_test_list: ET_OBJECT_TEST_LIST is
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

	fixed_array: KL_SPECIAL_ROUTINES [ET_NAMED_OBJECT_TEST] is
			-- Fixed array routines
		once
			create Result
		end

end
