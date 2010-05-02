note

	description:

		"Objects that resolve URIs of a specific scheme to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER

feature -- Status report

	error_message: STRING
			-- Error message from `resolve'

	http_method: STRING
			-- Value of gexslt:method extension attribute;
			-- Intended principally for http protocol, but value is unchecked here.

	is_correct_scheme (a_scheme: STRING): BOOLEAN
			-- does `Current' handle URIs for `a_scheme'?
		require
			scheme_not_void: a_scheme /= Void
		deferred
		end

feature -- Setting

	set_http_method (a_method: like http_method)
			-- Set `http_method' to `a_method'.
		require
			a_method_may_be_void: True
		do
			http_method := a_method
		ensure
			http_method_set: http_method = a_method
		end

feature -- Action

	resolve (a_uri: UT_URI)
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

