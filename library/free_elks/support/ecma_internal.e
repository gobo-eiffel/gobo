note
	description: "Version of INTERNAL which does not use the mapping of STRING to STRING_8, INTEGER to INTEGER_32, etc..."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

class
	ECMA_INTERNAL

inherit
	INTERNAL
		redefine
			is_pre_ecma_mapping_disabled
		end

feature -- Access

	is_pre_ecma_mapping_disabled: BOOLEAN
			-- Are we mapping old names to new ECMA names?
			-- No, because we are only using the ECMA names.
		do
			Result := True
		end

note
	copyright: "Copyright (c) 1984-2012, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
