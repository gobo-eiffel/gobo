note

	description:

		"Eiffel dynamic type sets"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2004-2021, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_DYNAMIC_TYPE_SET

inherit

	ET_DYNAMIC_TARGET

	ET_DYNAMIC_PRIMARY_TYPES

feature -- Status report

	is_expanded: BOOLEAN
			-- Is `static_type' expanded?
		do
			Result := static_type.is_expanded
		ensure
			definition: Result = static_type.is_expanded
		end

	is_never_void: BOOLEAN
			-- Can the expression of current dynamic type set never be void?
			-- (Note that in order to be truly true, the current dynamic type
			-- set should also be non-empty. Therefore it is recommended to
			-- use 'not can_be_void'.)
		deferred
		end

	can_be_void: BOOLEAN
			-- Can the expression of current dynamic type set be void?
		do
			Result := not is_expanded and then (is_empty or not is_never_void)
		end

	is_subset (other: ET_DYNAMIC_TYPE_SET): BOOLEAN
			-- Is current dynamic type set at subset of `other'.
		require
			other_not_void: other /= Void
		local
			l_type: ET_DYNAMIC_PRIMARY_TYPE
			i, nb: INTEGER
		do
			if count <= other.count then
				Result := True
				nb := count
				from i := 1 until i > nb loop
					l_type := dynamic_type (i)
					if not other.has_type (l_type) then
						Result := False
						i := nb + 1 -- Jump out of the loop.
					else
						i := i + 1
					end
				end
			end
		end

feature --Status setting

	set_never_void
			-- Set `is_never_void' to True.
		deferred
		ensure
			is_never_void: not static_type.base_class.is_none implies is_never_void
		end

feature -- Access

	static_type: ET_DYNAMIC_TYPE
			-- Type at compilation time
		deferred
		ensure
			static_type_not_void: Result /= Void
		end

	sources: detachable ET_DYNAMIC_ATTACHMENT
			-- Subsets of current set
		do
			-- The current kind of type set is not pulling
			-- types from sources.
		end

feature -- Element change

	put_target (a_target: ET_DYNAMIC_TARGET; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_target' to current set.
			-- (Targets are supersets of current set.)
		require
			a_target_not_void: a_target /= Void
			a_system_not_void: a_system /= Void
		do
			-- Do nothing: the current kind of type set is not pushing
			-- types to targets but pulling them from sources.
		end

	put_source (a_source: ET_DYNAMIC_ATTACHMENT; a_system: ET_DYNAMIC_SYSTEM)
			-- Add `a_source' to current set.
			-- (Sources are subsets of current set.)
		require
			a_source_not_void: a_source /= Void
			a_system_not_void: a_system /= Void
		do
			-- Do nothing: the current kind of type set is not pulling
			-- types from sources.
		end

	propagate_types (a_system: ET_DYNAMIC_SYSTEM)
			-- Propagate types from `sources'.
		require
			a_system_not_void: a_system /= Void
		local
			l_source: detachable ET_DYNAMIC_ATTACHMENT
			l_source_type_set: ET_DYNAMIC_TYPE_SET
		do
			from
				l_source := sources
			until
				l_source = Void
			loop
				l_source.propagate_types (Current, a_system)
				l_source_type_set := l_source.source_type_set
				if not l_source_type_set.is_never_void then
					propagate_can_be_void (l_source_type_set)
				end
				l_source := l_source.next_attachment
			end
		end

feature {ET_DYNAMIC_TYPE_SET} -- Implementation

	dynamic_types: detachable ET_DYNAMIC_PRIMARY_TYPES
			-- Dynamic types in current set;
			-- Void if no type in the set
		deferred
		end

end
