note
	description: "[
		Lightweight tracker of modifications made to instances of this class.
		Any modification causes `version' to get a new value that can be used
		by the clients to see if there were any changes since last access.
		]"
	storable: "Version data is not stored by default with the object itself."
	library: "Free implementation of ELKS library"
	status: "See notice at end of class."
	legal: "See notice at end of class."
	date: "$Date: 2012-05-24 06:13:10 +0200 (Thu, 24 May 2012) $"
	revision: "$Revision: 559 $"

deferred class
	VERSIONABLE

feature -- Measurement

	version: NATURAL
			-- Current version
		note
			option: transient
		attribute
		end

feature {NONE} -- Basic operations

	set_version (v: like version)
			-- Set the `version' to `v'.
		do
			version := v
		ensure
			version_set: version = v
		end

	increment_version
			-- Increment `version' to indicate a modification has been made.
		do
			version := version + 1
		ensure
			version_incremented: version = old version + 1
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
