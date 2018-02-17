note

	description:

		"Options that need a value from a enumerated set"

	library: "Gobo Eiffel Argument Library"
	copyright: "Copyright (c) 2006-2018, Bernd Schoeller and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class AP_ENUMERATION_OPTION

inherit

	AP_STRING_OPTION
		redefine
			initialize,
			record_occurrence
		end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make,
	make_with_short_form,
	make_with_long_form

feature {NONE} -- Initialization

	initialize
			-- Perform the common initialization steps.
		do
			Precursor
			create {DS_LINKED_LIST [STRING]} possible_values.make
			possible_values.set_equality_tester (string_equality_tester)
		end

feature -- Access

	possible_values: DS_LIST [STRING]
			-- List of possible values for this option

feature -- Status setting

	extend (a_value: STRING)
			-- Extend the possible values by `a_value'.
			-- Update the parameter name.
		require
			a_value_not_void: a_value /= Void
			not_has_value: not possible_values.has (a_value)
		do
			possible_values.force_last (a_value)
			update_parameter_description
		end

	remove (a_value: STRING)
			-- Remove `a_value' from the possible values.
			-- Update the parameter name.
		require
			a_value_not_void: a_value /= Void
			has_value: possible_values.has (a_value)
		do
			possible_values.delete (a_value)
			update_parameter_description
		end

	update_parameter_description
			-- Update the description of the parameter.
		local
			new_name: STRING
		do
			create new_name.make (20)
			from
				possible_values.start
			until
				possible_values.after
			loop
				new_name.append_string (possible_values.item_for_iteration)
				if not possible_values.is_last then
					new_name.append_character ('|')
				end
				possible_values.forth
			end
			set_parameter_description (new_name)
		end

feature {AP_BASIC_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_BASIC_PARSER)
			-- This option was found during parsing by `a_parser'.
		local
			error: AP_ERROR
			l_last_option_parameter: detachable STRING
		do
			l_last_option_parameter := a_parser.last_option_parameter
			if l_last_option_parameter = Void then
				check precondition_parameter_if_needed: not needs_parameter end
				l_last_option_parameter := default_parameter
			end
			parameters.force_last (l_last_option_parameter)
			if l_last_option_parameter = Void then
				create error.make_missing_parameter_error (Current)
				a_parser.error_handler.report_error (error)
			elseif not possible_values.has (l_last_option_parameter) then
				create error.make_invalid_parameter_error (Current, l_last_option_parameter)
				a_parser.error_handler.report_error (error)
			end
		end

invariant

	possible_values_not_void: possible_values /= Void
	no_void_possible_value: not possible_values.has_void

end
