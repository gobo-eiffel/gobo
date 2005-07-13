indexing

	description:

		"Objects that represent a system or uri entry in an XM_CATALOG"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_CATALOG_ENTRY

create

	make

feature {NONE} -- Initialization

	make (a_target_uri: UT_URI) is
			-- Establish invariant.
		require
			target_uri_not_void: a_target_uri /= Void and then a_target_uri.is_absolute
		do
			target_uri := a_target_uri
		ensure
			target_set: target_uri = a_target_uri
		end

feature -- Access

	target: STRING is
			-- URI to be used
		do
			Result := target_uri.full_reference
		ensure
			target_has_scheme: Result /= Void and then Result.count > 2
		end

feature {NONE} -- Implementation

	target_uri: UT_URI
			-- Target URI

invariant

	target_uri_is_absolute: target_uri /= Void and then target_uri.is_absolute

end
	
