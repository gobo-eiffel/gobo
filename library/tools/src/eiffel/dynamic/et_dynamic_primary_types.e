note

	description:

		"Eiffel dynamic primary types"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2022, Eric Bezault and others"
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

feature -- Basic operations

	add_common_types_to_list (a_other: ET_DYNAMIC_PRIMARY_TYPES; a_list: ET_DYNAMIC_PRIMARY_TYPE_LIST)
			-- Add to `a_list' the types which are both in `Current' and `a_other'.
		require
			a_other_not_void: a_other /= Void
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if a_other = Current then
				nb := count
				from i := 1 until i > nb loop
					a_list.force_last (dynamic_type (i))
					i := i + 1
				end
			elseif count < a_other.count then
				nb := count
				from i := 1 until i > nb loop
					l_dynamic_type := dynamic_type (i)
					if a_other.has_type (l_dynamic_type) then
						a_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			else
				nb := a_other.count
				from i := 1 until i > nb loop
					l_dynamic_type := a_other.dynamic_type (i)
					if has_type (l_dynamic_type) then
						a_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			end
		end

	add_common_expanded_types_to_list (a_other: ET_DYNAMIC_PRIMARY_TYPES; a_list: ET_DYNAMIC_PRIMARY_TYPE_LIST)
			-- Add to `a_list' the expanded types which are both in `Current' and `a_other'.
		require
			a_other_not_void: a_other /= Void
			a_list_not_void: a_list /= Void
		local
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if a_other = Current then
				nb := count
				from i := 1 until i > nb loop
					l_dynamic_type := dynamic_type (i)
					if l_dynamic_type.is_expanded then
						a_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			elseif count < a_other.count then
				nb := count
				from i := 1 until i > nb loop
					l_dynamic_type := dynamic_type (i)
					if l_dynamic_type.is_expanded and then a_other.has_type (l_dynamic_type) then
						a_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			else
				nb := a_other.count
				from i := 1 until i > nb loop
					l_dynamic_type := a_other.dynamic_type (i)
					if l_dynamic_type.is_expanded and then has_type (l_dynamic_type) then
						a_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			end
		end

	add_common_expanded_and_reference_types_to_lists (a_other: ET_DYNAMIC_PRIMARY_TYPES; a_expanded_list, a_reference_list: ET_DYNAMIC_PRIMARY_TYPE_LIST)
			-- Add to `a_expanded_list' the expanded types and to `a_reference_list'
			-- the reference types which are both in `Current' and `a_other'.
		require
			a_other_not_void: a_other /= Void
			a_expanded_list_not_void: a_expanded_list /= Void
			a_reference_list_not_void: a_reference_list /= Void
		local
			i, nb: INTEGER
			l_dynamic_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			if a_other = Current then
				nb := count
				from i := 1 until i > nb loop
					l_dynamic_type := dynamic_type (i)
					if l_dynamic_type.is_expanded then
						a_expanded_list.force_last (l_dynamic_type)
					else
						a_reference_list.force_last (l_dynamic_type)
					end
					i := i + 1
				end
			elseif count < a_other.count then
				nb := count
				from i := 1 until i > nb loop
					l_dynamic_type := dynamic_type (i)
					if a_other.has_type (l_dynamic_type) then
						if l_dynamic_type.is_expanded then
							a_expanded_list.force_last (l_dynamic_type)
						else
							a_reference_list.force_last (l_dynamic_type)
						end
					end
					i := i + 1
				end
			else
				nb := a_other.count
				from i := 1 until i > nb loop
					l_dynamic_type := a_other.dynamic_type (i)
					if has_type (l_dynamic_type) then
						if l_dynamic_type.is_expanded then
							a_expanded_list.force_last (l_dynamic_type)
						else
							a_reference_list.force_last (l_dynamic_type)
						end
					end
					i := i + 1
				end
			end
		end

end
