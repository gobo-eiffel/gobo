note

	description:

		"Objects that represent a systemSuffix or uriSuffix entry in an XM_CATALOG"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2005, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_SUFFIX_CATALOG_ENTRY

create

	make

feature {NONE} -- Initialization

	make (a_suffix_string: STRING; a_target_uri: UT_URI)
			-- Establish invariant.
		require
			target_uri_not_void: a_target_uri /= Void and then a_target_uri.is_absolute
			suffix_string_not_void: a_suffix_string /= Void
		do
			suffix_string := a_suffix_string
			count := suffix_string.count
			target_uri := a_target_uri
		ensure
			suffix_string_set: suffix_string = a_suffix_string
			target_set: target_uri = a_target_uri
		end

feature -- Access

	suffix_string: STRING
			-- System-id or URI suffix

	count: INTEGER
			-- length of `suffix_string'

	target: STRING
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
	suffix_string_not_void: suffix_string /= Void
	correct_count: suffix_string.count = count

end

