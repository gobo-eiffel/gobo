indexing

	description:

		"Eiffel dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004, Eric Bezault and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET

inherit

	ET_DYNAMIC_TARGET

feature -- Status report

	has_type (a_type: ET_DYNAMIC_TYPE): BOOLEAN is
			-- Does current type set contain `a_type'?
		require
			a_type_not_void: a_type /= Void
		do
			if first_type = a_type then
				Result := True
			elseif other_types /= Void then
				Result := other_types.has (a_type)
			end
		end

	has_special: BOOLEAN is
			-- Does current type set contain at least one SPECIAL type?
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := first_type
			if l_type /= Void then
				if l_type.is_special then
					Result := True
				elseif other_types /= Void then
					Result := other_types.has_special
				end
			end
		end

	is_expanded: BOOLEAN is
			-- Is `static_type' expanded?
		do
			Result := static_type.is_expanded
		ensure
			definition: Result = static_type.is_expanded
		end

	has_expanded: BOOLEAN is
			-- Does current type set contain at least one expanded type?
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := first_type
			if l_type /= Void then
				if l_type.is_expanded then
					Result := True
				elseif other_types /= Void then
					Result := other_types.has_expanded
				end
			end
		end

	is_subset (other: ET_DYNAMIC_TYPE_SET): BOOLEAN is
			-- Is current dynamic type set at subset of `other'.
		require
			other_not_void: other /= Void
		local
			l_type: ET_DYNAMIC_TYPE
			l_other_types: ET_DYNAMIC_TYPE_LIST
			i, nb: INTEGER
		do
			if count <= other.count then
				l_type := first_type
				if l_type = Void then
					Result := True
				elseif other.has_type (l_type) then
					Result := True
					l_other_types := other_types
					if l_other_types /= Void then
						nb := l_other_types.count
						from i := 1 until i > nb loop
							l_type := l_other_types.item (i)
							if not other.has_type (l_type) then
								Result := False
								i := nb + 1 -- Jump out of the loop.
							else
								i := i + 1
							end
						end
					end
				end
			end
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE is
			-- Type at compilation time
		deferred
		ensure
			static_type_not_void: Result /= Void
		end

	first_type: ET_DYNAMIC_TYPE is
			-- First type in current set;
			-- Void if no type in the set
		deferred
		end

	other_types: ET_DYNAMIC_TYPE_LIST is
			-- Other types in current set;
			-- Void if zero or one type in the set
		deferred
		ensure
			void_if_zero: first_type = Void implies Result = Void
			void_if_one: Result /= Void implies not Result.is_empty
		end

	sources: ET_DYNAMIC_ATTACHMENT is
			-- Subsets of current set
		deferred
		end

	special_type: ET_DYNAMIC_TYPE is
			-- One of the SPECIAL types contained in current type
			-- set if any, Void otherwise
		local
			l_type: ET_DYNAMIC_TYPE
		do
			l_type := first_type
			if l_type /= Void then
				if l_type.is_special then
					Result := l_type
				elseif other_types /= Void then
					Result := other_types.special_type
				end
			end
		end

feature -- Measurement

	count: INTEGER is
			-- Number of types in current type set
		do
			if first_type /= Void then
				if other_types /= Void then
					Result := other_types.count + 1
				else
					Result := 1
				end
			end
		ensure
			count_non_negative: Result >= 0
		end

feature -- Element change

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_SYSTEM) is
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		require
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_SYSTEM) is
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		require
			a_source_not_void: a_source /= Void
			a_system_not_void: a_system /= Void
		deferred
		end

	propagate_types (a_system: ET_SYSTEM) is
			-- Propagate types from `sources'.
		require
			a_system_not_void: a_system /= Void
		local
			l_source: ET_DYNAMIC_ATTACHMENT
		do
			from
				l_source := sources
			until
				l_source = Void
			loop
				l_source.propagate_types (Current, a_system)
				l_source := l_source.next_attachment
			end
		end

end
