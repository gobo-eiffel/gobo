note
	description: "Objects identified, uniquely during any session, by an integer"
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class IDENTIFIED_ROUTINES

feature -- Basic operations

	eif_id_object (an_id: INTEGER): detachable ANY
			-- Object associated with `an_id'
		require
			an_id_non_negative: an_id >= 0
		external
			"built_in static"
		ensure
			instance_free: class
		end

	eif_object_id (an_object: ANY): INTEGER
			-- New identifier for `an_object'
		external
			"built_in static"
		ensure
			instance_free: class
			eif_object_id_positive: Result > 0
			inserted: eif_id_object (Result) = an_object
		end

	eif_object_id_free (an_id: INTEGER)
			-- Free the entry `an_id'
		require
			an_id_non_negative: an_id >= 0
		external
			"built_in static"
		ensure
			instance_free: class
			removed: eif_id_object (an_id) = Void
		end

note
	copyright: "Copyright (c) 1984-2018, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
