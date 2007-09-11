indexing

	description: "Objects identified, uniquely during any session, by an integer"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2004, Eiffel Software and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class IDENTIFIED

inherit

	DISPOSABLE
		redefine
			is_equal, copy
		end

	IDENTIFIED_ROUTINES
		export
			{NONE} all
		undefine
			is_equal, copy
		end

feature -- Access

	frozen object_id: INTEGER is
			-- Unique for current object in any given session
			--| The C implementation cannot be called directly
			--| as the Eiffel object needs to keep track of
			--| the returned value. On the other hand, the address
			--| of `object_id' can be passed to C if it's more
			--| convenient to call it from C instead of Eiffel
		do
			if internal_id = 0 then
				internal_id := eif_object_id (Current)
			end
			Result := internal_id
		ensure
			valid_id: id_object (Result) = Current
		end

	frozen id_object (an_id: INTEGER): IDENTIFIED is
			-- Object associated with `an_id' (void if no such object)
		do
			Result ?= eif_id_object (an_id)
		ensure
			consistent: Result = Void or else Result.object_id = an_id
		end

feature -- Status report

	frozen id_freed: BOOLEAN is
			-- Has `Current' been removed from the table?
		do
			Result := id_object (internal_id) = Void
		end

feature -- Removal

	frozen free_id is
			-- Free the entry associated with `object_id' if any
			--| the `object_id' is not reset because of uniqueness:
			--| another call shouldn't give a new id
		do
			if internal_id /= 0 then
				eif_object_id_free (internal_id)
			end
		ensure
			object_freed: id_freed
		end

feature -- Comparison

	is_equal (other: like Current): BOOLEAN is
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

	copy (other: like Current) is
			-- Update current object using fields of object attached
			-- to `other', so as to yield equal objects.
			--| `object_id' will return a different value for the two
			--| objects
		local
			int_id: INTEGER
		do
			int_id := internal_id
			standard_copy (other)
			internal_id := int_id
		end

feature {NONE} -- Removal

	dispose is
			-- Free the entry associated with `object_id' if any
			--| If `dispose' is redefined, the redefinition has to
			--| call `free_id'
		do
			free_id
		ensure then
			object_freed: id_freed
		end

feature {IDENTIFIED} -- Implementation

	internal_id: INTEGER
			-- Internal representation of `object_id'

end
