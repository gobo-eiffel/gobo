indexing

	description:

		"Xace error handlers"

	library:    "Gobo Eiffel Tools Library"
	author:     "Andreas Leitner <nozone@sbox.tugraz.at>"
	copyright:  "Copyright (c) 2001, Andreas Leitner and others"
	license:    "Eiffel Forum Freeware License v1 (see forum.txt)"
	date:       "$Date$"
	revision:   "$Revision$"

class ET_XACE_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error
		end

creation

	make, make_standard, make_null

feature {NONE} -- Initialization

	make is
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and ignoring messages.
		do
			error_file := std.error
			warning_file := std.error
			message_file := null_output_stream
		ensure
			error_file_set: error_file = std.error
			warning_file_set: warning_file = std.error
			message_file_set: message_file = null_output_stream
		end

feature -- Status report

	is_verbose: BOOLEAN is
			-- Is error handler in verbose mode?
		do
			Result := (message_file /= null_output_stream)
		end

	has_error: BOOLEAN is
			-- Has an error been reported?
		do
			Result := (error_count > 0)
		end

feature -- Status setting

	enable_verbose is
			-- Set `is_verbose' to True.
		do
			message_file := std.output
		ensure
			verbose: is_verbose
		end

	disable_verbose is
			-- Set `is_verbose' to False.
		do
			message_file := null_output_stream
		ensure
			not_verbose: not is_verbose
		end

feature -- Measurement

	error_count: INTEGER
			-- Number of errors reported so far

feature -- Reporting

	report_cannot_read_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_cannot_write_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in write mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		require
			a_message_not_void: a_message /= Void
		local
			an_error: UT_MESSAGE
		do
			!! an_error.make (a_message)
			report_error (an_error)
		end

	report_no_parser_available_error is
			-- Report that there is no XML parser available.
		local
			an_error: ET_XACE_NO_PARSER_AVAILABLE_ERROR
		do
			!! an_error.make
			report_error (an_error)
		end

	report_not_xace_file_error (a_filename: STRING) is
			-- Report that file `a_filename' does not contain
			-- an Xace document.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: ET_XACE_NOT_XACE_FILE_ERROR
		do
			!! an_error.make (a_filename)
			report_error (an_error)
		end

	report_wrong_root_element_error (an_element_name: UC_STRING; a_position: XM_POSITION) is
			-- Report that Xace file does not contain the
			-- expected root element `an_element_name'.
		require
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: not an_element_name.empty
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_WRONG_ROOT_ELEMENT_ERROR
		do
			!! an_error.make (an_element_name, a_position)
			report_error (an_error)
		end

	report_missing_attribute_error (a_containing_element: XM_ELEMENT; an_attribute_name: UC_STRING; a_position: XM_POSITION) is
			-- Report that attribute `an_attribute_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: not an_attribute_name.empty
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_MISSING_ATTRIBUTE_ERROR
		do
			!! an_error.make (a_containing_element, an_attribute_name, a_position)
			report_error (an_error)
		end

	report_missing_element_error (a_containing_element: XM_ELEMENT; an_element_name: UC_STRING; a_position: XM_POSITION) is
			-- Report that element `an_element_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: not an_element_name.empty
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_MISSING_ELEMENT_ERROR
		do
			!! an_error.make (a_containing_element, an_element_name, a_position)
			report_error (an_error)
		end

	report_unknown_element_error (a_containing_element: XM_ELEMENT; an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that element `an_element' is not
			-- expected in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_not_void: an_element /= Void
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_UNKNOWN_ELEMENT_ERROR
		do
			!! an_error.make (a_containing_element, an_element, a_position)
			report_error (an_error)
		end

	report_invalid_expression_error (an_invalid_expression: UC_STRING; a_position: XM_POSITION) is
			-- Report that expression `an_invalid_expression'
			-- is not valid.
		require
			an_invalid_expression_not_void: an_invalid_expression /= Void
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_INVALID_EXPRESSION_ERROR
		do
			!! an_error.make (an_invalid_expression, a_position)
			report_error (an_error)
		end

	report_error (an_error: UT_ERROR) is
			-- Report `an_error'.
		do
			error_count := error_count + 1
			precursor (an_error)
		end

end -- class ET_XACE_ERROR_HANDLER
