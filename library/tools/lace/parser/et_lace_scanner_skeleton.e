indexing

	description:

		"Scanner skeletons for Lace parsers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 1999-2002, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_LACE_SCANNER_SKELETON

inherit

	YY_COMPRESSED_SCANNER_SKELETON
		rename
			make as make_compressed_scanner_skeleton,
			reset as reset_compressed_scanner_skeleton
		end

	ET_LACE_TOKENS
		export {NONE} all end

	UT_CHARACTER_CODES
		export {NONE} all end

	KL_IMPORTED_INTEGER_ROUTINES
	KL_IMPORTED_STRING_ROUTINES
	KL_SHARED_PLATFORM

feature {NONE} -- Initialization

	make (a_filename: STRING; an_error_handler: like error_handler) is
			-- Create a new Lace scanner.
		require
			a_filename_not_void: a_filename /= Void
			an_error_handler_not_void: an_error_handler /= Void
		do
			make_with_buffer (Empty_buffer)
			filename := a_filename
			error_handler := an_error_handler
			create eif_buffer.make (Init_buffer_size)
			eif_lineno := 1
		ensure
			filename_set: filename = a_filename
			error_handler_set: error_handler = an_error_handler
		end

feature -- Initialization

	reset is
			-- Reset scanner before scanning next input.
		do
			reset_compressed_scanner_skeleton
			eif_lineno := 1
			STRING_.wipe_out (eif_buffer)
		end

feature -- Access

	code_: INTEGER
	str_: STRING

	filename: STRING
			-- Name of file being parsed

	eif_buffer: STRING
			-- Buffer for lexial tokens

	eif_lineno: INTEGER
			-- Current line number

	current_position: ET_POSITION is
			-- Current position
			-- (Create a new object at each call.)
		do
			create {ET_FILE_POSITION} Result.make (filename, eif_lineno, 1)
		ensure
			current_position_not_void: Result /= Void
		end

	error_handler: ET_LACE_ERROR_HANDLER
			-- Error handler

feature -- AST factory

	new_identifier (a_text: STRING): ET_IDENTIFIER is
			-- New identifier
		require
			a_text_not_void: a_text /= Void
			a_text_not_empty: a_text.count > 0
		do
			create Result.make (a_text)
			Result.set_position (eif_lineno, 1)
		ensure
			identifier_not_void: Result /= Void
		end

feature {NONE} -- Constants

	Init_buffer_size: INTEGER is 256
				-- Initial size for `eif_buffer'

invariant

	filename_not_void: filename /= Void
	eif_buffer_not_void: eif_buffer /= Void
	error_handler_not_void: error_handler /= Void

end
