note

	description:

		"Eiffel dynamic primary types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2018, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_PRIMARY_TYPES

feature -- Access

	dynamic_type (i: INTEGER): ET_DYNAMIC_PRIMARY_TYPE
			-- Dynamic type at index `i'
		require
			i_large_enough: i >= 1
			i_small_enough: i <= count
		deferred
		ensure
			dynamic_type_not_void: Result /= Void
		end

	special_type: detachable ET_DYNAMIC_PRIMARY_TYPE
			-- One of the SPECIAL types contained in current dynamic types
			-- if any, Void otherwise
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			nb := count
			from i := 1 until i > nb loop
				l_type := dynamic_type (i)
				if l_type.is_special then
					Result := l_type
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			not_has: (Result = Void) = not has_special
		end

	index_of (a_type: ET_DYNAMIC_PRIMARY_TYPE): INTEGER
			-- Index of first occurrence of `a_type'.
			-- 0 if type not found.
		require
			a_type_not_void: a_type /= Void
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if dynamic_type (i) = a_type then
					Result := i
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		ensure
			index_large_enough: Result >= 0
			index_small_enough: Result <= count
			not_has: (Result = 0) = not has_type (a_type)
		end

feature -- Measurement

	count: INTEGER
			-- Number of dynamic types
		deferred
		ensure
			count_not_negative: Result >= 0
		end

feature -- Status report

	is_empty: BOOLEAN
			-- Is there no dynamic type?
		do
			Result := (count = 0)
		ensure
			definition: Result = (count = 0)
		end

	has_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Do current dynamic types contain `a_type'?
		require
			a_type_not_void: a_type /= Void
		do
			Result := index_of (a_type) /= 0
		end

	has_special: BOOLEAN
			-- Do current dynamic types contain at least one SPECIAL type?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if dynamic_type (i).is_special then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

	has_expanded: BOOLEAN
			-- Do current dynamic types contain at least one expanded type?
		local
			i, nb: INTEGER
		do
			nb := count
			from i := 1 until i > nb loop
				if dynamic_type (i).is_expanded then
					Result := True
					i := nb + 1 -- Jump out of the loop.
				else
					i := i + 1
				end
			end
		end

end
