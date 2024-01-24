note

	description:

		"External resolver that opens files on the local filesystem"

	library: "Gobo Eiffel XML Library"
	copyright: "Copyright (c) 2001-2014, Andreas Leitner and others"
	license: "MIT License"

class XM_FILE_EXTERNAL_RESOLVER

inherit

	XM_EXTERNAL_RESOLVER

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Make.
		do
			last_error := "no stream"
		end

feature -- Action(s)

	resolve (a_system_name: STRING)
			-- Open file with corresponding name.
		local
			l_last_stream: KL_BINARY_INPUT_FILE
		do
			create l_last_stream.make (a_system_name)
			l_last_stream.open_read
			if not l_last_stream.is_open_read then
				last_error := STRING_.concat ("cannot open input file: ", a_system_name)
				last_stream := Void
			else
				last_stream := l_last_stream
				last_error := Void
			end
		end

feature -- Result

	last_stream: detachable KI_BINARY_INPUT_FILE
			-- File matching stream

	last_error: detachable STRING
			-- Error

	has_error: BOOLEAN
			-- Is there an error?
		do
			Result := last_error /= Void
		end

invariant

	error_or_stream: last_stream /= Void xor last_error /= Void

end
