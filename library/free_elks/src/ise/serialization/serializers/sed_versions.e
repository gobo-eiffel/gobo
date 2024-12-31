note
	description: "Summary description for {SED_STORABLE_VERSIONS}."
	author: ""
	date: "$Date: 2013-05-20 23:15:17 +0000 (Mon, 20 May 2013) $"
	revision: "$Revision: 92557 $"

class
	SED_VERSIONS

feature -- Access

	version_5_6: NATURAL_32 = 0
			-- Original introducting of Eiffel serialization.

	version_6_6: NATURAL_32 = 3
			-- Added support for recoverable serialization (aka correct mismatch)
			--| It starts at 3 because in version 7.2, values one and two were
			--| used to version session/basic serialization but really there was no
			--| need to version them since it can only work inside the same application.

	version_7_3: NATURAL_32 = 4
			-- Added support for expanded and reference with copy semantics.

note
	library:	"EiffelBase: Library of reusable components for Eiffel."
	copyright:	"Copyright (c) 1984-2013, Eiffel Software and others"
	license:	"Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"

end
