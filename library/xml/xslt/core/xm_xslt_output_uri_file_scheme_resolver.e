indexing

	description:

		"Objects that resolve file URIs to output destinations"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_OUTPUT_URI_FILE_SCHEME_RESOLVER

inherit

	XM_XSLT_OUTPUT_URI_SCHEME_RESOLVER

	UT_SHARED_FILE_URI_ROUTINES
		export {NONE} all end

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
			Result := STRING_.same_string (a_scheme, "file")
		end

feature -- Action

	resolve (a_uri: UT_URI) is
			-- Resolve `a_uri'.
		local
			an_output: XM_OUTPUT
			a_stream: KL_TEXT_OUTPUT_FILE
		do
			last_result := Void
			check
				absolute_path: a_uri.has_absolute_path
				-- as `a_uri' is absolute, and scheme is "file"
			end
			create a_stream.make (File_uri.uri_to_filename (a_uri))
			a_stream.open_write
			if a_stream.is_open_write then
				create an_output
				an_output.set_output_stream (a_stream)
				create last_result.make_secondary_stream (an_output, a_stream, a_uri.path)
			else
				error_message := STRING_.concat ("Unable to open ", a_uri.full_reference)
			end
		end

end
	
