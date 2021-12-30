note
	description: "Objects identified, uniquely during any session, by an integer"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class IDENTIFIED

inherit
	DISPOSABLE
		redefine
			is_equal, copy
		end

inherit {NONE}

	IDENTIFIED_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, copy
		end

feature -- Access

	frozen object_id: INTEGER
			-- Unique for current object in any given session
		do
			if internal_id = 0 then
				internal_id := eif_object_id (Current)
			end
			Result := internal_id
		ensure
			valid_id: Result > 0 implies id_object (Result) = Current
		end

	frozen id_object (an_id: INTEGER): detachable IDENTIFIED
			-- Object associated with `an_id' (void if no such object)
		do
			if
				an_id > 0 and then
				attached {IDENTIFIED} eif_id_object (an_id) as l_result
			then
				Result := l_result
			end
		ensure
			consistent: Result = Void or else Result.object_id = an_id
		end

feature -- Status report

	frozen id_freed: BOOLEAN
			-- Has `Current' been removed from the table?
			--| It could also mean that it was not yet added to the table.
		do
			Result := id_object (internal_id) = Void
		end

feature -- Removal

	frozen free_id
			-- Free the entry associated with `object_id' if any.
			--| The `object_id' is reset to -1 to prevent reassigning
			--| a new id to the same object.
		do
			if internal_id > 0 then
				eif_object_id_free (internal_id)
					-- Seting to `-1' also help debugging by showing that
					-- the object has been freed but is still alive.
					-- Also if we were not doing that, calling `object_id'
					-- would fail its postcondition.
				internal_id := -1
			end
		ensure
			object_freed: id_freed
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN
			-- Is `other' attached to an object considered
			-- equal to current object?
			--| `object_id' is not taken into consideration
		local
			int_id: INTEGER
		do
			int_id := internal_id
			internal_id := other.internal_id
			Result := standard_is_equal (other)
			internal_id := int_id
		end

feature -- Duplication

	copy (other: like Current)
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
			--| `object_id' will return a different value for the two
			--| objects
		local
			int_id: INTEGER
		do
			if other /= Current then
				int_id := internal_id
				standard_copy (other)
				internal_id := int_id
			end
		end

feature {NONE} -- Removal

	dispose
			-- Free the entry associated with `object_id' if any
			--| If `dispose' is redefined, the redefinition has to
			--| call `free_id'
		do
			free_id
		ensure then
			object_freed: id_freed
		end

feature {IDENTIFIED} -- Implementation

	internal_id: INTEGER;
			-- Internal representation of `object_id'

note
	copyright: "Copyright (c) 1984-2021, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
