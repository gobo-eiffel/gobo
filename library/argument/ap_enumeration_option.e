indexing
	
	description:

		"An option that needs a value from a enumerated set"

	author: "Bernd Schoeller"
	copyright: "(c) 2006 Bernd Schoeller (bernd@fams.de) and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class AP_ENUMERATION_OPTION

inherit

	AP_STRING_OPTION
		redefine
			initialize,
			record_occurrence
		end

create

	make,
	make_with_short_form,
	make_with_long_form

feature {NONE} -- Initialization

	initialize is
			-- Perform the common initialization steps.
		local
			tester: KL_EQUALITY_TESTER [STRING]
		do
			Precursor {AP_STRING_OPTION}
			create {DS_LINKED_LIST [STRING]} possible_values.make
			create tester
			possible_values.set_equality_tester (tester)
		end
	
feature -- Access

	possible_values: DS_LIST [STRING]
		-- List of possible values for this option

feature -- Status setting

	extend (a_value: STRING) is
			-- Extend the possible values by `a_value'.
			-- Update the parameter name.
		require
			not_void: a_value /= Void
			not_has_value: not possible_values.has (a_value)
		do
			possible_values.force_last (a_value)
			update_parameter_description
		end

	remove (a_value: STRING) is
			-- Remove `a_value' from the possible values.
			-- Update the parameter name.
		require
			not_void: a_value /= Void
			has_value: possible_values.has (a_value)
		do
			possible_values.delete (a_value)
			update_parameter_description
		end

	update_parameter_description is
			-- Update the description of the parameter.
		local
			new_name: STRING
		do
			from
				possible_values.start
				new_name := ""
			until
				possible_values.off
			loop
				new_name.append_string (possible_values.item_for_iteration)
				if not possible_values.is_last then
					new_name.append_character ('|')
				end
				possible_values.forth
			end
			set_parameter_description (new_name)
		end

feature{AP_PARSER} -- Parser Interface

	record_occurrence (a_parser: AP_PARSER) is
			-- This option was found during parsing by `a_parser'.
		local
			error: AP_ERROR
		do
			Precursor {AP_STRING_OPTION} (a_parser)
			if not possible_values.has (a_parser.last_option_parameter) then
				create error.make_invalid_parameter_error (Current, a_parser.last_option_parameter)
				a_parser.error_handler.report_error (error)				
			end
		end

invariant

	possible_values_exists: possible_values /= Void

end
