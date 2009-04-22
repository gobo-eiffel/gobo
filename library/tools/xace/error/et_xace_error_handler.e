indexing

	description:

		"Xace error handlers"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2001-2004, Andreas Leitner and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

deferred class ET_XACE_ERROR_HANDLER

inherit

	ET_XACE_ELEMENT_NAMES
	KL_IMPORTED_STRING_ROUTINES

feature -- Reporting errors

	report_cannot_read_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in read mode.
		require
			a_filename_not_void: a_filename /= Void
		deferred
		end

	report_cannot_write_file_error (a_filename: STRING) is
			-- Report that file `a_filename' cannot
			-- be open in write mode.
		require
			a_filename_not_void: a_filename /= Void
		deferred
		end

	report_parser_error (a_message: STRING) is
			-- Report an XML parser error.
		require
			a_message_not_void: a_message /= Void
		deferred
		end

	report_not_xace_file_error (a_filename: STRING) is
			-- Report that file `a_filename' does not contain
			-- an Xace document.
		require
			a_filename_not_void: a_filename /= Void
		deferred
		end

	report_wrong_root_element_error (an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that Xace file does not contain the
			-- expected root element `an_element_name'.
		require
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: an_element_name.count > 0
			a_position_not_void: a_position /= Void
		deferred
		end

	report_missing_attribute_error (a_containing_element: XM_ELEMENT; an_attribute_name: STRING; a_position: XM_POSITION) is
			-- Report that attribute `an_attribute_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			an_attribute_name_not_empty: an_attribute_name.count > 0
			a_position_not_void: a_position /= Void
		deferred
		end

	report_missing_element_error (a_containing_element: XM_ELEMENT; an_element_name: STRING; a_position: XM_POSITION) is
			-- Report that element `an_element_name' is
			-- missing in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_name_not_void: an_element_name /= Void
			an_element_name_not_empty: an_element_name.count > 0
			a_position_not_void: a_position /= Void
		deferred
		end

	report_unknown_element_error (a_containing_element: XM_ELEMENT; an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that element `an_element' is not
			-- expected in element `a_containing_element'.
		require
			a_containing_element_not_void: a_containing_element /= Void
			an_element_not_void: an_element /= Void
			a_position_not_void: a_position /= Void
		deferred
		end

	report_invalid_expression_error (an_invalid_expression: STRING; a_position: XM_POSITION) is
			-- Report that expression `an_invalid_expression'
			-- is not valid.
		require
			an_invalid_expression_not_void: an_invalid_expression /= Void
			a_position_not_void: a_position /= Void
		deferred
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
		deferred
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
		deferred
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
		deferred
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
			no_void_expected_value: not an_expected_values.has_void
			a_position_not_void: a_position /= Void
		deferred
		end

	report_multiple_library_prefix_error (a_mount1, a_mount2: ET_XACE_MOUNTED_LIBRARY) is
			-- Report that a library has been mounted several times
			-- with different prefixes.
		require
			a_mount1_not_void: a_mount1 /= Void
			a_mount2_not_void: a_mount2 /= Void
		deferred
		end

feature -- Reporting warnings

	report_attribute_obsoleted_by_element_warning (an_element: XM_ELEMENT; an_attribute_name: STRING; a_new_element: STRING; a_position: XM_POSITION) is
			-- Report that an attribute `an_attribute_name' of element `an_element'
			-- is obsoleted by an element `a_new_element'.
		require
			an_element_not_void: an_element /= Void
			an_attribute_name_not_void: an_attribute_name /= Void
			a_new_element_not_void: a_new_element /= Void
			a_position_not_void: a_position /= Void
		deferred
		end

	report_element_obsoleted_by_element_warning (an_element: XM_ELEMENT; a_new_element: STRING; a_position: XM_POSITION) is
			-- Report that an element `an_element' is obsoleted
			-- by an element `a_new_element'.
		require
			an_element_not_void: an_element /= Void
			a_new_element_not_void: a_new_element /= Void
			a_position_not_void: a_position /= Void
		deferred
		end

	report_obsolete_cluster_element_warning (a_position: XM_POSITION) is
			-- Report that a cluster element that groups clusters,
			-- mounts and options is no longer used.
		require
			a_position_not_void: a_position /= Void
		deferred
		end

	report_obsolete_exclude_element_warning (a_position: XM_POSITION) is
			-- Report that an exclude element is obsoleted by if/unless attributes.
		require
			a_position_not_void: a_position /= Void
		deferred
		end

	report_unknown_option_warning (an_element: XM_ELEMENT; a_position: XM_POSITION) is
			-- Report that the value of the attribute "name"
			-- in the "option" elment `an_element' is unknown.
		require
			an_element_not_void: an_element /= Void
			an_element_has_option_as_name: STRING_.same_string (an_element.name, uc_option)
			an_element_has_name_attribute: an_element.has_attribute_by_name (uc_name)
			a_name_attribute_not_empty: an_element.attribute_by_name (uc_name).value.count > 0
			a_position_not_void: a_position /= Void
		deferred
		end

end
