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
			l_output: XM_OUTPUT
			l_stream: KL_TEXT_OUTPUT_FILE
			l_filename: ?STRING
		do
			last_result := Void
			check
				absolute_path: a_uri.has_absolute_path
				-- as `a_uri' is absolute, and scheme is "file"
			end
			l_filename := File_uri.uri_to_filename (a_uri)
			if l_filename /= Void then
				create l_stream.make (l_filename)
				l_stream.open_write
			end
			if l_stream /= Void and then l_stream.is_open_write then
				create l_output
				l_output.set_output_stream (l_stream)
				create last_result.make_secondary_stream (l_output, l_stream, a_uri.path)
			else
				error_message := STRING_.concat ("Unable to open ", a_uri.full_reference)
			end
		end

end
	
