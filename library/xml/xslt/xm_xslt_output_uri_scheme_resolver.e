indexing

	description:

		"Objects that resolve URIs of a specific scheme to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER

feature -- Status report

	error_message: STRING
			-- Error message from `resolve'

	is_correct_scheme (a_scheme: STRING): BOOLEAN is
			-- does `Current' handle URIs for `a_scheme'?
		require
			scheme_not_void: a_scheme /= Void
		deferred
		end

feature -- Action

	resolve (a_uri: UT_URI) is
			-- Resolve `a_uri'.
		require
			uri_not_void: a_uri /= Void and then a_uri.is_absolute
			correct_scheme: a_uri.scheme /= Void and then is_correct_scheme (a_uri.scheme)
		deferred
		ensure
			result_or_error: last_result = Void implies error_message /= Void
		end

feature -- Result

	last_result: XM_XSLT_TRANSFORMATION_RESULT
			-- Result object from last call to `resolve'

	
end
	
