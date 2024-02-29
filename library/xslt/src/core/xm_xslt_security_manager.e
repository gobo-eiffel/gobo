note

	description:

		"Objects that make security decisions"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"

deferred class XM_XSLT_SECURITY_MANAGER

inherit

	XM_XPATH_SECURITY_MANAGER

feature -- Access

	is_highly_secure: BOOLEAN
			-- Is high security in place?

	is_output_uri_permitted (an_absolute_uri: UT_URI): BOOLEAN
			-- Is writing permitted to `an_absolute_uri'?
		require
			absolute_uri: an_absolute_uri /= Void and then an_absolute_uri.is_absolute
		deferred
		end

feature -- Element_change

	set_high_security (on_or_off: BOOLEAN)
			-- Turn high security on or off.
		do
			is_highly_secure := on_or_off
		ensure
			security_level_set: is_highly_secure = on_or_off
		end

end

