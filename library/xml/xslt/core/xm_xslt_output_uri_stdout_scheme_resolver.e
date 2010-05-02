note

	description:

		"Objects that resolve stdout: URIs to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_URI_STDOUT_SCHEME_RESOLVER

inherit

	XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create object.
		do
			-- do_nothing
		end

feature -- Status report

	is_correct_scheme (a_scheme: STRING): BOOLEAN
			-- does `Current' handle URIs for `a_scheme'?
		do
			Result := STRING_.same_string (a_scheme, "stdout")
		end

feature -- Action

	resolve (a_uri: UT_URI)
			-- Resolve `a_uri'.
		local
			a_stream: XM_OUTPUT
		do
			if a_uri.scheme_specific_part.count > 0 then
				error_message := "Invalid stdout: URI"
			else
				create a_stream
				a_stream.set_output_standard
				create last_result.make (a_stream, "stdout:")
			end
		end

end

