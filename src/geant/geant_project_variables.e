indexing

	description:

		"Project variables for GEANT"

	library: "Gobo Eiffel Ant"
	copyright:"Copyright (c) 2001-2004, Sven Ehrke and others"
	license:"Eiffel Forum License v2 (see forum.txt)"
	date: "$Date$"
	revision:"$Revision$"


class GEANT_PROJECT_VARIABLES

inherit

	GEANT_VARIABLES
		redefine
			make
		end

	GEANT_SHARED_PROPERTIES
		export
			{NONE} all
		undefine
			is_equal, copy
		end

create

	make

feature {NONE} -- Initialization

	make is
			-- Create a new variables object.
		local
			a_name: STRING
			a_value: STRING
		do
			precursor
				-- Create built-in variables $GOBO_OS, $is_windows/$is_unix, $exe
			Project_variables_resolver.set_variables (Current)
			a_name := "GOBO_OS"
			if not Project_variables_resolver.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := "is_windows"
			if not Project_variables_resolver.has (a_name) then
				a_value := Default_builtin_variables.value (a_name)
				if a_value /= Void then
					set_variable_value (a_name, a_value)
				end
			end
			a_name := "is_unix"
			if not Project_variables_resolver.has (a_name) then
				a_value := Default_builtin_variables.value (a_name)
				if a_value /= Void then
					set_variable_value (a_name, a_value)
				end
			end
			a_name := "path_separator"
			if not Project_variables_resolver.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := "exe"
			if not Project_variables_resolver.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
			a_name := "verbose"
			if not Project_variables_resolver.has (a_name) and Default_builtin_variables.has (a_name) then
				set_variable_value (a_name, Default_builtin_variables.value (a_name))
			end
		end

end
