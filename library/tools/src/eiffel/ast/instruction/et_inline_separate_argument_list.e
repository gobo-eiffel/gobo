note

	description:

		"Eiffel lists of separate arguments (in inline separate instructions)"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2022-2023, Eric Bezault and others"
	license: "MIT License"

class ET_INLINE_SEPARATE_ARGUMENT_LIST

inherit

	ET_TAIL_LIST [ET_INLINE_SEPARATE_ARGUMENT]

create

	make, make_with_capacity

feature -- Access

	argument (i: INTEGER): ET_INLINE_SEPARATE_ARGUMENT
			-- Inline separate argument at index `i' in list
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		do
			Result := storage.item (i)
		ensure
			argument_not_void: Result /= Void
		end

	index_of_name (a_name: ET_IDENTIFIER): INTEGER
			-- Index of last inline separate argument named `a_name'
			-- which is in scope (by convention, we are in the scope of a separate
			-- argument if its `name' is not marked as 'is_inline_separate_argument');
			-- 0 if it does not exist
		require
			a_name_not_void: a_name /= Void
		local
			i: INTEGER
			l_name: ET_IDENTIFIER
		do
			from i := count until i < 1 loop
				l_name := storage.item (i).name
				if l_name.same_identifier (a_name) and then not l_name.is_inline_separate_argument then
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
			in_scope: Result > 0 implies not argument (Result).name.is_inline_separate_argument
		end

feature -- Duplication

	cloned_inline_separate_argument_list: ET_INLINE_SEPARATE_ARGUMENT_LIST
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

	fixed_array: KL_SPECIAL_ROUTINES [ET_INLINE_SEPARATE_ARGUMENT]
			-- Fixed array routines
		once
			create Result
		end

end
