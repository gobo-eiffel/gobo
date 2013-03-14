note
	description: "Obsolete internal file information, use FILE_INFO directly."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2013-01-24 23:27:55 +0100 (Thu, 24 Jan 2013) $"
	revision: "$Revision: 708 $"

class UNIX_FILE_INFO

inherit
	FILE_INFO
		export
			{ANY} make
		end

create
	make

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
