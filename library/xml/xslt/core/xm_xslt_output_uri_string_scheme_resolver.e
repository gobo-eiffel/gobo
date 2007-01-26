indexing

	description:

		"Objects that resolve string: URIs to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_URI_STRING_SCHEME_RESOLVER

inherit

	XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create object.
		do
			-- do_nothing
		end

feature -- Status report

	is_correct_scheme (a_scheme: STRING): BOOLEAN is
			-- does `Current' handle URIs for `a_scheme'?
		do
			Result := STRING_.same_string (a_scheme, "string")
		end

feature -- Action

	resolve (a_uri: UT_URI) is
			-- Resolve `a_uri'.
		local
			a_stream: XM_OUTPUT
		do
			create a_stream
			a_stream.set_output_to_string
			create last_result.make (a_stream, a_uri.full_reference)
		end

end
	
