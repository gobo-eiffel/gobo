note

	description:

		"Eiffel dynamic type sets to which new types can be added"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2007-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_EXTENDIBLE_TYPE_SET

inherit

	ET_DYNAMIC_TYPE_SET
		redefine
			propagate_can_be_void,
			has_type, index_of
		end

feature -- Status report

	is_never_void: BOOLEAN
			-- Can the expression of current dynamic type set never be void?
			-- (Note that in order to be truly true, the current dynamic type
			-- set should also be non-empty. Therefore it is recommended to
			-- use 'not can_be_void'.)

	has_type (a_type: ET_DYNAMIC_PRIMARY_TYPE): BOOLEAN
			-- Do current dynamic types contain `a_type'?
		local
			i: INTEGER
			l_dynamic_types: like dynamic_types
		do
			l_dynamic_types := dynamic_types
			if l_dynamic_types = Void then
				Result := False
			elseif l_dynamic_types.count = count  then
				Result := l_dynamic_types.has_type (a_type)
			elseif attached {ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST} l_dynamic_types as l_hash_list then
				i := l_hash_list.index_of (a_type)
				if i > 0 and i <= count then
					Result := True
				end
			else
				Result := precursor (a_type)
			end
		end

feature -- Status setting

	set_never_void
			-- Set `is_never_void' to True.
		do
			is_never_void := True
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time

	dynamic_type (i: INTEGER): ET_DYNAMIC_PRIMARY_TYPE
			-- Dynamic type at index `i'
		do
			check
					-- The precondition says that `i' is valid.
				attached dynamic_types as l_dynamic_types
			then
				Result := l_dynamic_types.dynamic_type (i)
			end
		end

	index_of (a_type: ET_DYNAMIC_PRIMARY_TYPE): INTEGER
			-- Index of first occurrence of `a_type'.
			-- 0 if type not found.
		local
			i: INTEGER
			l_dynamic_types: like dynamic_types
		do
			l_dynamic_types := dynamic_types
			if l_dynamic_types = Void then
				Result := 0
			elseif l_dynamic_types.count = count  then
				Result := l_dynamic_types.index_of (a_type)
			elseif attached {ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST} l_dynamic_types as l_hash_list then
				i := l_hash_list.index_of (a_type)
				if i <= count then
					Result := i
				end
			else
				Result := precursor (a_type)
			end
		end

feature -- Measurement

	count: INTEGER
			-- Number of types in current type set

feature -- Element change

	put_type (a_type: ET_DYNAMIC_PRIMARY_TYPE)
			-- Add `a_type' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		require
			a_type_not_void: a_type /= Void
		local
			l_dynamic_types: like dynamic_types
			l_dynamic_type_list: ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST
		do
			l_dynamic_types := dynamic_types
			if l_dynamic_types = Void then
					-- The current set is made up of only one type.
				dynamic_types := a_type
				is_dynamic_types_readonly := True
				count := 1
			elseif count < l_dynamic_types.count and then l_dynamic_types.dynamic_type (count + 1) = a_type then
				count := count + 1
			elseif has_type (a_type) then
				-- This type was already in the current type set.
			elseif is_dynamic_types_readonly then
					-- We are not allowed to alter `dynamic_types'.
					-- So we have to create a new one.
				create l_dynamic_type_list.make_with_capacity ((count + 1).max (15))
				l_dynamic_type_list.append_last (Current)
				l_dynamic_type_list.put_last (a_type)
				dynamic_types := l_dynamic_type_list
				is_dynamic_types_readonly := False
				count := count + 1
			elseif attached {ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST} l_dynamic_types as l_dynamic_type_hash_list then
				l_dynamic_type_hash_list.force_last (a_type)
				count := count + 1
			else
				create l_dynamic_type_list.make_with_capacity ((count + 1).max (15))
				l_dynamic_type_list.append_last (Current)
				l_dynamic_type_list.put_last (a_type)
				dynamic_types := l_dynamic_type_list
				count := count + 1
			end
		ensure
			has_type: has_type (a_type)
		end

	put_types (other: ET_DYNAMIC_PRIMARY_TYPES)
			-- Add types of `other' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
		do
			nb := other.count
			from i := 1 until i > nb loop
				put_type (other.dynamic_type (i))
				i := i + 1
			end
		end

	put_expanded_types (other: ET_DYNAMIC_PRIMARY_TYPES)
			-- Add expanded types of `other' to current set.
			-- Do not check for type conformance with `static_type' and do not propagate to targets.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			nb := other.count
			from i := 1 until i > nb loop
				l_type := other.dynamic_type (i)
				if l_type.is_expanded then
					put_type (l_type)
				end
				i := i + 1
			end
		end

	put_conforming_expanded_types (other: ET_DYNAMIC_PRIMARY_TYPES)
			-- Add expanded types of `other' conforming to `static_type' to current set.
			-- Do not propagate to targets.
		require
			other_not_void: other /= Void
		local
			i, nb: INTEGER
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			l_static_primary_type: ET_DYNAMIC_PRIMARY_TYPE
		do
			l_static_primary_type := static_type.primary_type
			nb := other.count
			from i := 1 until i > nb loop
				l_type := other.dynamic_type (i)
				if l_type.is_expanded and then l_type.conforms_to_primary_type (l_static_primary_type) then
					put_type (l_type)
				end
				i := i + 1
			end
		end

	put_type_from_type_set (a_type: ET_DYNAMIC_PRIMARY_TYPE; a_type_set: ET_DYNAMIC_TYPE_SET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_type' coming from `a_type_set' to current target.
		local
			l_dynamic_types: like dynamic_types
			l_dynamic_type_list: ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST
		do
			if a_type.conforms_to_primary_type (static_type.primary_type) then
				l_dynamic_types := dynamic_types
				if not attached a_type_set.dynamic_types as l_other_dynamic_types then
						-- The precondition says that `a_type_set' contains `a_type'.
						-- So its 'dynamic_types' cannot be void.
					check False end
				elseif l_dynamic_types = Void then
						-- The current dynamic type set was empty.
					if l_other_dynamic_types.dynamic_type (1) = a_type then
							-- Share `dynamic_types' between the two dynamic type sets.
						dynamic_types := l_other_dynamic_types
						is_dynamic_types_readonly := True
					else
							-- The current set is made up of only one type.
						dynamic_types := a_type
						is_dynamic_types_readonly := True
					end
					count := 1
				elseif l_dynamic_types = l_other_dynamic_types then
						-- `dynamic_types' are shared between the two type sets.
					if count >= a_type_set.count then
						-- `a_type' is already in current type set.
					elseif l_other_dynamic_types.dynamic_type (count + 1) = a_type then
							-- `a_type' appears to be the next item in `l_other_dynamic_types'.
						count := count + 1
					elseif has_type (a_type) then
						-- This type was already in the current type set.
					else
							-- We are not allowed to alter `dynamic_types' (it was shared with `a_type_set').
							-- So we have to create a new one.
						create l_dynamic_type_list.make_with_capacity ((count + 1).max (15))
						l_dynamic_type_list.append_last (Current)
						l_dynamic_type_list.put_last (a_type)
						dynamic_types := l_dynamic_type_list
						is_dynamic_types_readonly := False
						count := count + 1
					end
				elseif count < l_dynamic_types.count and then l_dynamic_types.dynamic_type (count + 1) = a_type then
					count := count + 1
				elseif has_type (a_type) then
					-- This type was already in the current type set.
				elseif is_dynamic_types_readonly then
						-- We are not allowed to alter `dynamic_types'.
						-- So we have to create a new one.
					create l_dynamic_type_list.make_with_capacity ((count + 1).max (15))
					l_dynamic_type_list.append_last (Current)
					l_dynamic_type_list.put_last (a_type)
					dynamic_types := l_dynamic_type_list
					is_dynamic_types_readonly := False
					count := count + 1
				elseif attached {ET_DYNAMIC_PRIMARY_TYPE_HASH_LIST} l_dynamic_types as l_dynamic_type_hash_list then
					l_dynamic_type_hash_list.force_last (a_type)
					count := count + 1
				else
					create l_dynamic_type_list.make_with_capacity ((count + 1).max (15))
					l_dynamic_type_list.append_last (Current)
					l_dynamic_type_list.put_last (a_type)
					dynamic_types := l_dynamic_type_list
					count := count + 1
				end
			end
		end

	propagate_can_be_void (a_type_set: ET_DYNAMIC_TYPE_SET)
			-- Propagate the information that `a_type_set', from which types
			-- are propagated, is the dynamic type set of an expression which
			-- can be void at some point during execution.
		do
			is_never_void := False
		end

feature {ET_DYNAMIC_TYPE_SET} -- Implementation

	dynamic_types: detachable ET_DYNAMIC_PRIMARY_TYPES
			-- Dynamic types in current set;
			-- Void if no type in the set

feature {NONE} -- Implementation

	is_dynamic_types_readonly: BOOLEAN
			-- Is it not allowed to alter `dynamic_types'?
			-- This might be the case when `dynamic_types' actually belongs to
			-- another dynamic type set and we are just sharing it.

end
