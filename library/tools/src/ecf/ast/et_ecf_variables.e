note

	description:

		"ECF variables"

	library: "Gobo Eiffel Tools Library"
	copyright: "Copyright (c) 2008-2020, Eric Bezault and others"
	license: "MIT License"
	date: "$Date$"
	revision: "$Revision$"

class ET_ECF_VARIABLES

inherit

	KL_STRING_VALUES

	KL_SHARED_EXECUTION_ENVIRONMENT
		export {NONE} all end

	KL_SHARED_STRING_EQUALITY_TESTER
		export {NONE} all end

create

	make

feature {NONE} -- Initialization

	make
			-- Create new ECF variables.
		local
			l_hash_function: KL_AGENT_HASH_FUNCTION [STRING]
		do
			secondary_variables := Execution_environment
			create primary_variables.make_map (50)
			primary_variables.set_key_equality_tester (case_insensitive_string_equality_tester)
			create l_hash_function.make (agent STRING_.case_insensitive_hash_code ({STRING} ?))
			primary_variables.set_hash_function (l_hash_function)
		end

feature -- Access

	value (a_variable: STRING): detachable STRING
			-- Value of variable `a_variable';
			-- Void if variable is not defined in `primary_variables' nor in `secondary_variables'
		do
			primary_variables.search (a_variable)
			if primary_variables.found then
				Result := primary_variables.found_item
			else
				Result := secondary_variables.value (a_variable)
			end
		end

	primary_value (a_variable: STRING): detachable STRING
			-- Value of variable `a_variable';
			-- Void if variable is not defined in `primary_variables'
		require
			a_variable_not_void: a_variable /= Void
		do
			primary_variables.search (a_variable)
			if primary_variables.found then
				Result := primary_variables.found_item
			end
		end

	primary_variables: DS_HASH_TABLE [STRING, STRING]
			-- Variables explicitly defined in the target

	secondary_variables: KL_STRING_VALUES
			-- Variables to be taken into account when not
			-- explicitly defined in `primary_variables'

feature -- Setting

	set_primary_value (a_variable, a_value: STRING)
			-- Set variable `a_variable' to `a_value'.
		require
			a_variable_not_void: a_variable /= Void
			a_value_not_void: a_value /= Void
		do
			primary_variables.force_last (a_value, a_variable)
		ensure
			primary_value_set: primary_value (a_variable) = a_value
		end

	set_secondary_variables (a_variables: like secondary_variables)
			-- Set `secondary_variables' to `a_variables'.
		require
			a_variables_not_void: a_variables /= Void
--			no_cycle: `a_variables', or recursively its secondary variables, does not already have `Current' as secondary variables
		do
			secondary_variables := a_variables
		ensure
			secondary_variables_set: secondary_variables = a_variables
		end

invariant

	primary_variables_not_void: primary_variables /= Void
	no_void_primary_variable: not primary_variables.has_void
	no_void_primary_value: not primary_variables.has_void_item
	secondary_variables_not_void: secondary_variables /= Void
--	no_cycle: `secondary_variables', or recursively its secondary variables, does not already have `Current' as secondary variables

end
