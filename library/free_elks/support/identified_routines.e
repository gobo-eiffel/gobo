note

	description: "Objects identified, uniquely during any session, by an integer"
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2008, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class IDENTIFIED_ROUTINES

feature -- Basic operations

	eif_id_object (an_id: INTEGER): detachable ANY
			-- Object associated with `an_id'
		require
			an_id_non_negative: an_id >= 0
		external
			"built_in"
		end

	eif_is_object_id_of_current (an_id: INTEGER): BOOLEAN
			-- Is `an_id' the associated object ID of `Current'.
		require
			an_id_non_negative: an_id >= 0
		do
			Result := (eif_id_object (an_id) = Current)
		end

	eif_object_id (an_object: ANY): INTEGER
			-- New identifier for `an_object'
		external
			"built_in"
		ensure
			eif_object_id_positive: Result > 0
			inserted: eif_id_object (Result) = an_object
		end

	eif_current_object_id: INTEGER
			-- New identifier for Current
		do
			Result := eif_object_id (Current)
		ensure
			eif_current_object_id: Result > 0
			inserted: eif_is_object_id_of_current (Result)
		end

	eif_object_id_free (an_id: INTEGER)
			-- Free the entry `an_id'
		require
			an_id_non_negative: an_id >= 0
		external
			"built_in"
		ensure
			removed: eif_id_object (an_id) = Void
		end

end
