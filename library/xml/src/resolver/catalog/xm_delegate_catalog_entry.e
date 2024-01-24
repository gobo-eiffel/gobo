note

	description:

		"Objects that represent a delegateSystem or sdelegateURIentry in an XM_CATALOG"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

class XM_DELEGATE_CATALOG_ENTRY

create

	make

feature {NONE} -- Initialization

	make (a_start_string: STRING; a_target_uri: UT_URI)
			-- Establish invariant.
		require
			target_uri_not_void: a_target_uri /= Void and then a_target_uri.is_absolute
			start_string_not_void: a_start_string /= Void
		do
			start_string := a_start_string
			count := start_string.count
			target_uri := a_target_uri
		ensure
			start_string_set: start_string = a_start_string
			target_set: target_uri = a_target_uri
		end

feature -- Access

	start_string: STRING
			-- Public identifier prefix

	count: INTEGER
			-- length of `start_string'

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
	start_string_not_void: start_string /= Void
	correct_count: start_string.count = count

end

