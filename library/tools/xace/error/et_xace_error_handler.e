indexing

	description:

		"Xace error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001, Andreas Leitner and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message,
			is_verbose
		end

	KL_IMPORTED_STRING_ROUTINES
	ET_XACE_ELEMENT_NAMES

creation

	make, make_standard, make_null

feature {NONE} -- Initialization

	make is
			-- Create a new error handler using the standard
			-- error file for error and warning reporting
			-- and ignoring info messages.
		do
			make_standard
			set_info_null
			set_warning_null
		ensure
			error_file_set: error_file = std.error
			warning_file_set: warning_file = null_output_stream
			info_file_set: info_file = null_output_stream
		end

feature -- Status report

	has_error: BOOLEAN is
			-- Has an error been reported?
		do
			Result := (error_count > 0)
		end

	is_verbose: BOOLEAN is
			-- Is `info_file' set to something other than
			-- the null output stream?
		do
			Result := (info_file /= null_output_stream) and
				(warning_file /= null_output_stream)
		ensure then
			definition: Result = (info_file /= null_output_stream) and
						(warning_file /= null_output_stream)
		end

feature -- Status setting

	enable_verbose is
			-- Set `is_verbose' to True.
		do
			warning_file := std.error
			info_file := std.output
		ensure
			verbose: is_verbose
		end

	disable_verbose is
			-- Set `is_verbose' to False.
		do
			warning_file := null_output_stream
			info_file := null_output_stream
		ensure
			not_verbose: not is_verbose
		end

feature -- Measurement

	error_count: INTEGER
			-- Number of errors reported so far

feature -- Reporting errors

	report_cannot_read_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in read mode.
		require
			a_filename_not_void: a_filename /= Void
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
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
			create an_error.make (a_filename)
			report_error (an_error)
		end

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		require
			a_message_not_void: a_message /= Void
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message)
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
			create an_error.make (a_filename)
			report_error (an_error)
		end

	report_wrong_root_element_error (an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that Xace file does not contain the
			-- expected root element `an_element_name'.
		require
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: an_element_name.count > 0
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_WRONG_ROOT_ELEMENT_ERROR
		do
			create an_error.make (an_element_name, a_position)
			report_error (an_error)
		end

	report_missing_attribute_error (a_containing_element: XM_ELEMENT; an_attribute_name: STRING; a_position: XM_POSITION) is
			-- Report that attribute `an_attribute_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_MISSING_ATTRIBUTE_ERROR
		do
			create an_error.make (a_containing_element, an_attribute_name, a_position)
			report_error (an_error)
		end

	report_missing_element_error (a_containing_element: XM_ELEMENT; an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that element `an_element_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: an_element_name.count > 0
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_MISSING_ELEMENT_ERROR
		do
			create an_error.make (a_containing_element, an_element_name, a_position)
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
			create an_error.make (a_containing_element, an_element, a_position)
			report_error (an_error)
		end

	report_invalid_expression_error (an_invalid_expression: STRING; a_position: XM_POSITION) is
			-- Report that expression `an_invalid_expression'
			-- is not valid.
		require
			an_invalid_expression_not_void: an_invalid_expression /= Void
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_INVALID_EXPRESSION_ERROR
		do
			create an_error.make (an_invalid_expression, a_position)
			report_error (an_error)
		end

	report_boolean_expected_error (an_element: XM_ELEMENT; an_attribute_name: STRING;
		an_actual_value: STRING; a_position: XM_POSITION) is
			-- Report that the value of attribute `an_attribute_name'
			-- in element `an_element' should be a boolean value.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			an_actual_value_not_void: an_actual_value /= Void
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_BOOLEAN_EXPECTED_ERROR
		do
			create an_error.make (an_element, an_attribute_name, an_actual_value, a_position)
			report_error (an_error)
		end

	report_positive_integer_expected_error (an_element: XM_ELEMENT; an_attribute_name: STRING;
		an_actual_value: STRING; a_position: XM_POSITION) is
			-- Report that the value of attribute `an_attribute_name'
			-- in element `an_element' should be a positive integer.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			an_actual_value_not_void: an_actual_value /= Void
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_POSITIVE_INTEGER_EXPECTED_ERROR
		do
			create an_error.make (an_element, an_attribute_name, an_actual_value, a_position)
			report_error (an_error)
		end

	report_non_empty_attribute_expected_error (an_element: XM_ELEMENT;
		an_attribute_name: STRING; a_position: XM_POSITION) is
			-- Report that the value of attribute `an_attribute_name'
			-- in element `an_element' should be empty.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_NON_EMPTY_ATTRIBUTE_EXPECTED_ERROR
		do
			create an_error.make (an_element, an_attribute_name, a_position)
			report_error (an_error)
		end

	report_wrong_attribute_value_error (an_element: XM_ELEMENT; an_attribute_name: STRING;
		an_actual_value: STRING; an_expected_values: DS_LINEAR [STRING]; a_position: XM_POSITION) is
			-- Report that the value `an_actual_value' of attribute
			-- `an_attribute_name' in element `an_element' should be
			-- one of the `an_expected_values'.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			an_actual_value_not_void: an_actual_value /= Void
			an_expected_values_not_void: an_expected_values /= Void
			no_void_expected_value: not an_expected_values.has (Void)
			a_position_not_void: a_position /= Void
		local
			an_error: ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR
		do
			create an_error.make (an_element, an_attribute_name, an_actual_value, an_expected_values, a_position)
			report_error (an_error)
		end

	report_multiple_library_prefix_error (a_mount1, a_mount2: ET_XACE_MOUNTED_LIBRARY) is
			-- Report that a library has been mounted several times
			-- with different prefixes.
		require
			a_mount1_not_void: a_mount1 /= Void
			a_mount2_not_void: a_mount2 /= Void
		local
			an_error: ET_XACE_MULTIPLE_LIBRARY_PREFIX_ERROR
		do
			create an_error.make (a_mount1, a_mount2)
			report_error (an_error)
		end

	report_error_message (an_error: STRING) is
			-- Report `an_error'.
		do
			error_count := error_count + 1
			precursor (an_error)
		end

feature -- Reporting warnings

	report_unknown_option_warning (an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that  the value of the attribute "name"
			-- in the "option" elment `an_element' is unknown.
		require
			an_element_not_void: an_element /= Void
			an_element_has_option_as_name: STRING_.same_string (an_element.name, uc_option)
			an_element_has_name_attribute: an_element.has_attribute_by_name (uc_name)
			a_name_attribute_not_empty: an_element.attribute_by_name (uc_name).value.count > 0
			a_position_not_void: a_position /= Void
		local
			a_warning: ET_XACE_UNKNOWN_OPTION_NAME_WARNING
		do
			create a_warning.make (an_element, a_position)
			report_warning (a_warning)
		end

invariant

	warning_and_info_file_are_consistent: (info_file = null_output_stream) = (warning_file = null_output_stream)

end
