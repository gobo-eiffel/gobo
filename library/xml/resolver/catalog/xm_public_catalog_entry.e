note

	description:

		"Objects that represent a public entry in an XM_CATALOG"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_PUBLIC_CATALOG_ENTRY

inherit

	XM_CATALOG_ENTRY
		rename
			make as make_core
		end

create

	make

feature {NONE} -- Initialization

	make (a_target_uri: UT_URI; a_prefer_public: BOOLEAN)
			-- Establish invariant.
		require
			target_uri_not_void: a_target_uri /= Void and then a_target_uri.is_absolute
		do
			prefer_public := a_prefer_public
			make_core (a_target_uri)
		ensure
			prefer_public_set: prefer_public = a_prefer_public
			target_set: target_uri = a_target_uri
		end

feature -- Access

	prefer_public: BOOLEAN
			-- Was prefer="public" in effect when this entry was encountered?

end

