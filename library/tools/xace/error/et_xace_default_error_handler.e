note

	description:

		"Default Xace error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_XACE_DEFAULT_ERROR_HANDLER

inherit

	UT_ERROR_HANDLER
		redefine
			report_error_message,
			is_verbose
		end

	ET_XACE_ERROR_HANDLER

create

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
		local
			an_error: UT_CANNOT_READ_FILE_ERROR
		do
			create an_error.make (a_filename)
			report_error (an_error)
		end

	report_cannot_write_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in write mode.
		local
			an_error: UT_CANNOT_WRITE_TO_FILE_ERROR
		do
			create an_error.make (a_filename)
			report_error (an_error)
		end

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		local
			an_error: UT_MESSAGE
		do
			create an_error.make (a_message)
			report_error (an_error)
		end

	report_not_xace_file_error (a_filename: STRING) is
			-- Report that file `a_filename' does not contain
			-- an Xace document.
		local
			an_error: ET_XACE_NOT_XACE_FILE_ERROR
		do
			create an_error.make (a_filename)
			report_error (an_error)
		end

	report_wrong_root_element_error (an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that Xace file does not contain the
			-- expected root element `an_element_name'.
		local
			an_error: ET_XACE_WRONG_ROOT_ELEMENT_ERROR
		do
			create an_error.make (an_element_name, a_position)
			report_error (an_error)
		end

	report_missing_attribute_error (a_containing_element: XM_ELEMENT; an_attribute_name: STRING; a_position: XM_POSITION) is
			-- Report that attribute `an_attribute_name' is
			-- missing in element `a_containing_element'.
		local
			an_error: ET_XACE_MISSING_ATTRIBUTE_ERROR
		do
			create an_error.make (a_containing_element, an_attribute_name, a_position)
			report_error (an_error)
		end

	report_missing_element_error (a_containing_element: XM_ELEMENT; an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that element `an_element_name' is
			-- missing in element `a_containing_element'.
		local
			an_error: ET_XACE_MISSING_ELEMENT_ERROR
		do
			create an_error.make (a_containing_element, an_element_name, a_position)
			report_error (an_error)
		end

	report_unknown_element_error (a_containing_element: XM_ELEMENT; an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that element `an_element' is not
			-- expected in element `a_containing_element'.
		local
			an_error: ET_XACE_UNKNOWN_ELEMENT_ERROR
		do
			create an_error.make (a_containing_element, an_element, a_position)
			report_error (an_error)
		end

	report_invalid_expression_error (an_invalid_expression: STRING; a_position: XM_POSITION) is
			-- Report that expression `an_invalid_expression'
			-- is not valid.
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
		local
			an_error: ET_XACE_WRONG_ATTRIBUTE_VALUE_ERROR
		do
			create an_error.make (an_element, an_attribute_name, an_actual_value, an_expected_values, a_position)
			report_error (an_error)
		end

	report_multiple_library_prefix_error (a_mount1, a_mount2: ET_XACE_MOUNTED_LIBRARY) is
			-- Report that a library has been mounted several times
			-- with different prefixes.
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

	report_attribute_obsoleted_by_element_warning (an_element: XM_ELEMENT; an_attribute_name: STRING; a_new_element: STRING; a_position: XM_POSITION) is
			-- Report that an attribute `an_attribute_name' of element `an_element'
			-- is obsoleted by an element `a_new_element'.
		local
			a_warning: ET_XACE_ATTRIBUTE_OBSOLETED_BY_ELEMENT_WARNING
		do
			create a_warning.make (an_element, an_attribute_name, a_new_element, a_position)
			report_warning (a_warning)
		end

	report_element_obsoleted_by_element_warning (an_element: XM_ELEMENT; a_new_element: STRING; a_position: XM_POSITION) is
			-- Report that an element `an_element' is obsoleted
			-- by an element `a_new_element'.
		local
			a_warning: ET_XACE_ELEMENT_OBSOLETED_BY_ELEMENT_WARNING
		do
			create a_warning.make (an_element, a_new_element, a_position)
			report_warning (a_warning)
		end

	report_obsolete_cluster_element_warning (a_position: XM_POSITION) is
			-- Report that a cluster element that groups clusters,
			-- mounts and options is no longer used.
		local
			a_warning: ET_XACE_OBSOLETE_CLUSTER_ELEMENT_WARNING
		do
			create a_warning.make (a_position)
			report_warning (a_warning)
		end

	report_obsolete_exclude_element_warning (a_position: XM_POSITION) is
			-- Report that an exclude element is obsoleted by if/unless attributes.
		local
			a_warning: ET_XACE_OBSOLETE_EXCLUDE_ELEMENT_WARNING
		do
			create a_warning.make (a_position)
			report_warning (a_warning)
		end

	report_unknown_option_warning (an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that the value of the attribute "name"
			-- in the "option" elment `an_element' is unknown.
		local
			a_warning: ET_XACE_UNKNOWN_OPTION_NAME_WARNING
		do
			create a_warning.make (an_element, a_position)
			report_warning (a_warning)
		end

invariant

	warning_and_info_file_are_consistent: (info_file = null_output_stream) = (warning_file = null_output_stream)

end
