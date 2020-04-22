note
	description: "Conversion failure from the internal implementation"
	legal: "See notice at end of class."
	status: "See notice at end of class."
	date: "$Date$"
	revision: "$Revision$"

class
	CONVERSION_FAILURE

inherit
	DEVELOPER_EXCEPTION

create
	make_message

feature {NONE} -- Initialization

	make_message (a_message: like message)
			-- Initialize with `a_message'.
		do
			set_description (a_message)
		end

note
	library:   "Encoding: Library of reusable components for Eiffel."
	copyright: "Copyright (c) 1984-2017, Eiffel Software and others"
	license:   "Eiffel Forum License v2 (see http://www.eiffel.com/licensing/forum.txt)"
	source: "[
			Eiffel Software
			5949 Hollister Ave., Goleta, CA 93117 USA
			Telephone 805-685-1006, Fax 805-685-6869
			Website http://www.eiffel.com
			Customer support http://support.eiffel.com
		]"



end
