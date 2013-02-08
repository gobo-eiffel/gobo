note
	description: "[
		Lightweight tracker of modifications made to instances of this class.
		Any modification causes `version' to get a new value that can be used
		by the clients to see if there were any changes since last access.
		]"
	storable: "Version data is not stored by default with the object itself."
	library: "Free implementation of ELKS library"
	copyright: "Copyright (c) 1986-2010, Eiffel Software and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date: 2011-05-18 01:25:55 +0200 (Wed, 18 May 2011) $"
	revision: "$Revision: 510 $"

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

end
