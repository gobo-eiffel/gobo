indexing

	description:

		"Objects that bind global variable names to values"

	library: "Gobo Eiffel XSLT Library"
	copyright: "Copyright (c) 2004, Colin Adams and others"
	license: "Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision: "$Revision$"

class XM_XSLT_BINDERY

inherit

	KL_IMPORTED_STRING_ROUTINES
		export {NONE} all end

	XM_XPATH_TYPE

create

	make

feature {NONE} -- Initialization

	make (a_global_variable_count: INTEGER) is
			-- Establish invariant.
		require
			positive_global_count: a_global_variable_count >= 0
		do
			global_variable_count := a_global_variable_count + 1 -- Why + 1 - this might be redundant now - test it out???
			allocate_globals (global_variable_count)
		end

feature -- Access

	global_variable_value (a_slot_number: INTEGER): XM_XPATH_VALUE is
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			Result := global_variables.item (a_slot_number)
		ensure
			value_void_if_not_yet_bound: True
		end

	global_parameter_value (a_fingerprint: INTEGER): XM_XPATH_VALUE is
		require
			is_global_parameter_supplied (a_fingerprint)
		do
			Result := global_parameters.value (a_fingerprint)
		ensure
			value_not_void: Result /= Void
		end

feature -- Measurement
	
	global_variable_count: INTEGER
			-- Number of global variables

feature -- Status report

	is_circularity_error: BOOLEAN
			-- Has a circular definition occured

	is_evaluated (a_slot_number: INTEGER): BOOLEAN is
			-- Has global variable `a_slot_number' been evaluated yet?
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			Result := global_variables.item (a_slot_number) /= Void
		end

	is_global_parameter_supplied (a_fingerprint: INTEGER): BOOLEAN is
			-- Does `a_fingerprint' represent a supplied global parameter?
		do
			if global_parameters /= Void then
				if global_parameters.has (a_fingerprint) then
					Result := global_parameters.value (a_fingerprint) /= Void
				end
			end
		end

	last_binding_failure: STRING
			-- Message associated with last failed binding attempt

feature -- Status setting

	set_executing (a_slot_number: INTEGER; executing: BOOLEAN) is
			-- Set/Unset a flag to indicate that `a_slot_number' is currently being evaluated.
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
		do
			if executing then
				if busy_globals.item (a_slot_number) then
					is_circularity_error := True
				else
					busy_globals.put (True, a_slot_number)
				end
			else
				busy_globals.put (False, a_slot_number)
			end
		end

feature -- Element change

	define_global_variable (a_slot_number: INTEGER; a_value: XM_XPATH_VALUE) is
			-- Define global variable.
		require
			valid_slot_number: a_slot_number > 0 and then a_slot_number <= global_variable_count
			not_yet_evaluated: not is_evaluated (a_slot_number)
			value_not_void: a_value /= Void
		do
			global_variables.put (a_value, a_slot_number)
		ensure
			global_variable_defined: is_evaluated (a_slot_number)
		end

	define_global_parameters (a_parameter_set: XM_XSLT_PARAMETER_SET) is
			-- Define global parameters (e.g. as suppiled on command line by user).
		require
			parameter_set_not_void: a_parameter_set /= Void
		do
			global_parameters := a_parameter_set
		ensure
			global_parameters_set: global_parameters = a_parameter_set
		end

feature {NONE} -- Implementation

	global_parameters: XM_XSLT_PARAMETER_SET
			-- global parameters

	global_variables: ARRAY [XM_XPATH_VALUE]
			-- Global variables

	busy_globals: ARRAY [BOOLEAN]
			-- Flags used to indicate a global variable is being defined

	allocate_globals (a_global_variable_count: INTEGER) is
			-- Allocate space for global variables
		require
			strictly_positive_global_count: a_global_variable_count > 0
		do
			create global_variables.make (1, a_global_variable_count)
			create busy_globals.make (1, a_global_variable_count)
		end

invariant

	global_variables_not_void: global_variables /= Void
	busy_globals_not_void: busy_globals /= Void and then busy_globals.count = global_variables.count

end
	
