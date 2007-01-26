indexing

	description:

		"Objects that represent a delegatePublic entry in an XM_CATALOG"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_PUBLIC_DELEGATE_CATALOG_ENTRY

inherit

	XM_DELEGATE_CATALOG_ENTRY
		rename
			make as make_core
		end

create

	make

feature {NONE} -- Initialization

	make (a_start_string: STRING; a_target_uri: UT_URI; a_prefer_public: BOOLEAN) is
			-- Establish invariant.
		require
			target_uri_not_void: a_target_uri /= Void and then a_target_uri.is_absolute
			start_string_not_void: a_start_string /= Void
		do
			prefer_public := a_prefer_public
			make_core (a_start_string, a_target_uri)
		ensure
			prefer_public_set: prefer_public = a_prefer_public
			start_string_set: start_string = a_start_string
			target_set: target_uri = a_target_uri
		end

feature -- Access

	prefer_public: BOOLEAN
			-- Was prefer="public" in effect when this entry was encountered?


end
	
